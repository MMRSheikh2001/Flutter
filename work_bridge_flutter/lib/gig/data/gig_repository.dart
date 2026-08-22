
import 'package:dio/dio.dart';
import 'package:work_bridge_flutter/gig/entity/request/gig_search_request.dart';
import 'package:work_bridge_flutter/gig/entity/response/gig_response.dart';
import 'package:work_bridge_flutter/utils/api_client.dart';
import 'package:work_bridge_flutter/utils/api_constants.dart';

class GigRepository {
  GigRepository(this._apiClient);

  final ApiClient _apiClient;

  Dio get _dio => _apiClient.dio;

// =====================================================
// Gigs
// =====================================================

  Future<List<GigResponseDTO>> searchGigs(GigSearchRequestDTO request) async {
    final response = await _dio.post(
      ApiConstants.searchGigs,
      data: request.toJson(),
    );

    return (response.data as List)
        .map((json) => GigResponseDTO.fromJson(json))
        .toList();
  }

  Future<GigResponseDTO> getGigById(int id) async {
    final response = await _dio.get(ApiConstants.getGigUrl(id));

    return GigResponseDTO.fromJson(response.data);
  }

}