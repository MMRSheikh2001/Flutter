import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:work_bridge_flutter/gig/entity/request/gig_search_request.dart';
import 'package:work_bridge_flutter/gig/entity/response/gig_response.dart';
import 'package:work_bridge_flutter/utils/providers.dart';

/// Current gig search filter.
final gigSearchFilterProvider = StateProvider<GigSearchRequestDTO>((ref) {
  return const GigSearchRequestDTO();
});

/// Auto re-fetches whenever gigSearchFilterProvider changes.
final gigSearchResultsProvider = FutureProvider<List<GigResponseDTO>>((ref) {
  final filter = ref.watch(gigSearchFilterProvider);

  return ref.watch(gigRepositoryProvider).searchGigs(filter);
});
