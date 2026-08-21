import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:work_bridge_flutter/masterdata/models/response/country_response.dart';
import 'package:work_bridge_flutter/masterdata/models/response/district_response.dart';
import 'package:work_bridge_flutter/masterdata/models/response/division_response.dart';
import 'package:work_bridge_flutter/masterdata/models/response/policestation_response.dart';
import 'package:work_bridge_flutter/utils/providers.dart';

/// Selection reported back to the parent whenever any level changes.
/// Every field is nullable/independent so the parent can use whichever
/// level it needs — e.g. job search only cares about
/// countryId/divisionId/districtId/policeStationId (JobSearchRequestDTO
/// fields), while an address form wants the full leaf record.
class LocationSelection {
  const LocationSelection({
    this.countryId,
    this.countryName,
    this.divisionId,
    this.divisionName,
    this.districtId,
    this.districtName,
    this.policeStationId,
    this.policeStationName,
  });

  final int? countryId;
  final String? countryName;
  final int? divisionId;
  final String? divisionName;
  final int? districtId;
  final String? districtName;
  final int? policeStationId;
  final String? policeStationName;

  bool get isComplete => policeStationId != null;

  static const empty = LocationSelection();
}

/// Reusable Country -> Division -> District -> Police Station cascade,
/// backed by MasterDataRepository. Drop in two instances (e.g. present +
/// permanent address on a profile form, or country/division/district as
/// job-search filters) — each instance keeps independent selection state
/// while sharing the cached countriesProvider list.
class LocationCascade extends ConsumerStatefulWidget {
  const LocationCascade({
    super.key,
    required this.onChanged,
    this.countryLabel = 'Country',
    this.divisionLabel = 'Division',
    this.districtLabel = 'District',
    this.policeStationLabel = 'Police Station',
    this.showPoliceStation = true,
    this.initialSelection,
  });

  final ValueChanged<LocationSelection> onChanged;
  final String countryLabel;
  final String divisionLabel;
  final String districtLabel;
  final String policeStationLabel;

  /// Job search only needs down to District — set false to hide the
  /// Police Station level for that case.
  final bool showPoliceStation;

  /// Pre-fill the cascade from a previously saved selection — e.g. when
  /// editing an existing company/user address. Only the IDs are used;
  /// the widget resolves the actual DTO objects itself by fetching each
  /// level's list in order (there's no "give me the ancestor chain for
  /// this leaf id" endpoint on the backend, so this has to walk down
  /// from Country the same way manual selection does).
  final LocationSelection? initialSelection;

  @override
  ConsumerState<LocationCascade> createState() => _LocationCascadeState();
}

class _LocationCascadeState extends ConsumerState<LocationCascade> {
  List<DivisionResponseDTO> _divisions = [];
  List<DistrictResponseDTO> _districts = [];
  List<PoliceStationResponseDTO> _policeStations = [];

  CountryResponseDTO? _country;
  DivisionResponseDTO? _division;
  DistrictResponseDTO? _district;
  PoliceStationResponseDTO? _policeStation;

  bool _loadingDivisions = false;
  bool _loadingDistricts = false;
  bool _loadingPoliceStations = false;

  // Request tokens guard against out-of-order async responses — e.g. if
  // the user picks Country A then quickly Country B, and A's network
  // response arrives after B's, we must not let A's (stale) divisions
  // overwrite B's list. Each level only applies a response if it's still
  // the most recent request for that level. The initial pre-fill walk
  // (below) also goes through these same counters so a manual selection
  // made while pre-fill is still in flight correctly wins.
  int _countryRequestId = 0;
  int _divisionRequestId = 0;
  int _districtRequestId = 0;

  @override
  void initState() {
    super.initState();
    final initial = widget.initialSelection;
    if (initial != null && initial.countryId != null) {
      // Defer to after the first frame so `ref` reads are safe and the
      // countriesProvider (likely already resolved/cached) can be read
      // via `.future` without racing the widget's own first build.
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _applyInitialSelection(initial);
      });
    }
  }

  T? _findById<T>(List<T> items, int? id, int? Function(T) idOf) {
    if (id == null) return null;
    for (final item in items) {
      if (idOf(item) == id) return item;
    }
    return null;
  }

  Future<void> _applyInitialSelection(LocationSelection initial) async {
    final countryRequestId = ++_countryRequestId;
    final countries = await ref.read(countriesProvider.future);
    if (!mounted || countryRequestId != _countryRequestId) return;

    final country = _findById(countries, initial.countryId, (c) => c.countryId);
    if (country == null) return;
    setState(() => _country = country);

    if (initial.divisionId == null || country.countryId == null) return;
    final divisionRequestId = ++_divisionRequestId;
    setState(() => _loadingDivisions = true);
    final divisions = await ref
        .read(masterDataRepositoryProvider)
        .getDivisionsByCountryId(country.countryId!);
    if (!mounted || countryRequestId != _countryRequestId) return;
    setState(() {
      _divisions = divisions;
      _loadingDivisions = false;
    });

    final division =
    _findById(divisions, initial.divisionId, (d) => d.divisionId);
    if (division == null) return;
    setState(() => _division = division);

    if (initial.districtId == null || division.divisionId == null) return;
    if (divisionRequestId != _divisionRequestId) return;
    setState(() => _loadingDistricts = true);
    final districts = await ref
        .read(masterDataRepositoryProvider)
        .getDistrictsByDivisionId(division.divisionId!);
    if (!mounted || divisionRequestId != _divisionRequestId) return;
    setState(() {
      _districts = districts;
      _loadingDistricts = false;
    });

    final district =
    _findById(districts, initial.districtId, (d) => d.districtId);
    if (district == null) return;
    setState(() => _district = district);

    if (!widget.showPoliceStation ||
        initial.policeStationId == null ||
        district.districtId == null) {
      return;
    }
    final districtRequestId = ++_districtRequestId;
    setState(() => _loadingPoliceStations = true);
    final policeStations = await ref
        .read(masterDataRepositoryProvider)
        .getPoliceStationsByDistrictId(district.districtId!);
    if (!mounted || districtRequestId != _districtRequestId) return;
    setState(() {
      _policeStations = policeStations;
      _loadingPoliceStations = false;
    });

    final policeStation = _findById(
      policeStations,
      initial.policeStationId,
          (p) => p.policeStationId,
    );
    if (policeStation != null) {
      setState(() => _policeStation = policeStation);
    }
  }

  void _emit() {
    widget.onChanged(
      LocationSelection(
        countryId: _country?.countryId,
        countryName: _country?.countryName,
        divisionId: _division?.divisionId,
        divisionName: _division?.divisionName,
        districtId: _district?.districtId,
        districtName: _district?.districtName,
        policeStationId: _policeStation?.policeStationId,
        policeStationName: _policeStation?.policeStationName,
      ),
    );
  }

  Future<void> _onCountryChanged(CountryResponseDTO? country) async {
    final requestId = ++_countryRequestId;

    setState(() {
      _country = country;
      _division = null;
      _district = null;
      _policeStation = null;
      _divisions = [];
      _districts = [];
      _policeStations = [];
    });
    _emit();
    if (country?.countryId == null) return;

    setState(() => _loadingDivisions = true);
    try {
      final list = await ref
          .read(masterDataRepositoryProvider)
          .getDivisionsByCountryId(country!.countryId!);
      if (mounted && requestId == _countryRequestId) {
        setState(() => _divisions = list);
      }
    } finally {
      if (mounted && requestId == _countryRequestId) {
        setState(() => _loadingDivisions = false);
      }
    }
  }

  Future<void> _onDivisionChanged(DivisionResponseDTO? division) async {
    final requestId = ++_divisionRequestId;

    setState(() {
      _division = division;
      _district = null;
      _policeStation = null;
      _districts = [];
      _policeStations = [];
    });
    _emit();
    if (division?.divisionId == null) return;

    setState(() => _loadingDistricts = true);
    try {
      final list = await ref
          .read(masterDataRepositoryProvider)
          .getDistrictsByDivisionId(division!.divisionId!);
      if (mounted && requestId == _divisionRequestId) {
        setState(() => _districts = list);
      }
    } finally {
      if (mounted && requestId == _divisionRequestId) {
        setState(() => _loadingDistricts = false);
      }
    }
  }

  Future<void> _onDistrictChanged(DistrictResponseDTO? district) async {
    final requestId = ++_districtRequestId;

    setState(() {
      _district = district;
      _policeStation = null;
      _policeStations = [];
    });
    _emit();
    if (!widget.showPoliceStation || district?.districtId == null) return;

    setState(() => _loadingPoliceStations = true);
    try {
      final list = await ref
          .read(masterDataRepositoryProvider)
          .getPoliceStationsByDistrictId(district!.districtId!);
      if (mounted && requestId == _districtRequestId) {
        setState(() => _policeStations = list);
      }
    } finally {
      if (mounted && requestId == _districtRequestId) {
        setState(() => _loadingPoliceStations = false);
      }
    }
  }

  void _onPoliceStationChanged(PoliceStationResponseDTO? ps) {
    setState(() => _policeStation = ps);
    _emit();
  }

  @override
  Widget build(BuildContext context) {
    final countriesAsync = ref.watch(countriesProvider);

    return Column(
      children: [
        countriesAsync.when(
          loading: () => const LinearProgressIndicator(),
          error: (e, _) => Text(
            'Failed to load countries: $e',
            style: const TextStyle(color: Colors.red),
          ),
          data: (countries) => _Dropdown<CountryResponseDTO>(
            label: widget.countryLabel,
            icon: Icons.flag_outlined,
            value: _country,
            items: countries,
            itemLabel: (c) => c.countryName ?? '',
            onChanged: _onCountryChanged,
          ),
        ),
        const SizedBox(height: 12),
        _Dropdown<DivisionResponseDTO>(
          label: widget.divisionLabel,
          icon: Icons.signpost_outlined,
          value: _division,
          items: _divisions,
          itemLabel: (d) => d.divisionName ?? '',
          enabled: _divisions.isNotEmpty,
          loading: _loadingDivisions,
          onChanged: _onDivisionChanged,
        ),
        const SizedBox(height: 12),
        _Dropdown<DistrictResponseDTO>(
          label: widget.districtLabel,
          icon: Icons.map_outlined,
          value: _district,
          items: _districts,
          itemLabel: (d) => d.districtName ?? '',
          enabled: _districts.isNotEmpty,
          loading: _loadingDistricts,
          onChanged: _onDistrictChanged,
        ),
        if (widget.showPoliceStation) ...[
          const SizedBox(height: 12),
          _Dropdown<PoliceStationResponseDTO>(
            label: widget.policeStationLabel,
            icon: Icons.local_police_outlined,
            value: _policeStation,
            items: _policeStations,
            itemLabel: (p) => p.policeStationName ?? '',
            enabled: _policeStations.isNotEmpty,
            loading: _loadingPoliceStations,
            onChanged: _onPoliceStationChanged,
          ),
        ],
      ],
    );
  }
}

class _Dropdown<T> extends StatelessWidget {
  const _Dropdown({
    required this.label,
    required this.icon,
    required this.value,
    required this.items,
    required this.itemLabel,
    required this.onChanged,
    this.enabled = true,
    this.loading = false,
  });

  final String label;
  final IconData icon;
  final T? value;
  final List<T> items;
  final String Function(T) itemLabel;
  final ValueChanged<T?> onChanged;
  final bool enabled;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      isExpanded: true,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        suffixIcon: loading
            ? const Padding(
          padding: EdgeInsets.all(12),
          child: SizedBox(
            height: 16,
            width: 16,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        )
            : null,
      ),
      hint: Text('Select $label'),
      items: items
          .map((e) => DropdownMenuItem<T>(value: e, child: Text(itemLabel(e))))
          .toList(),
      onChanged: enabled ? onChanged : null,
    );
  }
}