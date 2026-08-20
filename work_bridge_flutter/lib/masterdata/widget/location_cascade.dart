
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
  });

  final ValueChanged<LocationSelection> onChanged;
  final String countryLabel;
  final String divisionLabel;
  final String districtLabel;
  final String policeStationLabel;

  /// Job search only needs down to District — set false to hide the
  /// Police Station level for that case.
  final bool showPoliceStation;

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
      if (mounted) setState(() => _divisions = list);
    } finally {
      if (mounted) setState(() => _loadingDivisions = false);
    }
  }

  Future<void> _onDivisionChanged(DivisionResponseDTO? division) async {
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
      if (mounted) setState(() => _districts = list);
    } finally {
      if (mounted) setState(() => _loadingDistricts = false);
    }
  }

  Future<void> _onDistrictChanged(DistrictResponseDTO? district) async {
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
      if (mounted) setState(() => _policeStations = list);
    } finally {
      if (mounted) setState(() => _loadingPoliceStations = false);
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