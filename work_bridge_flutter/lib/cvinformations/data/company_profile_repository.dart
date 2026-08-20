import 'dart:io';

import 'package:dio/dio.dart';
import 'package:work_bridge_flutter/cvinformations/models/request/company_profile_request.dart';
import 'package:work_bridge_flutter/cvinformations/models/response/company_profile_response.dart';
import 'package:work_bridge_flutter/utils/api_client.dart';
import 'package:work_bridge_flutter/utils/api_constants.dart';

class CompanyProfileRepository {
  CompanyProfileRepository(this._apiClient);

  final ApiClient _apiClient;

  Dio get _dio => _apiClient.dio;



  Future<CompanyProfileResponseDTO> getCompanyProfileById(int id) async {
    final response = await _dio.get(
      ApiConstants.companyProfileById(id),
    );
    return CompanyProfileResponseDTO.fromJson(response.data);
  }

  Future<CompanyProfileResponseDTO> getCompanyProfileByUserId(int userId) async {
    final response = await _dio.get(
      ApiConstants.companyProfileByUserId(userId),
    );
    return CompanyProfileResponseDTO.fromJson(response.data);
  }

  Future<CompanyProfileResponseDTO> updateCompanyProfile(
      int id,
      CompanyProfileRequestDTO request,
      File? imageFile,
      ) async {
    final formData = FormData();

    formData.files.add(
      MapEntry(
        'companyprofile',
        MultipartFile.fromString(
          request.toJsonString(),
          contentType: DioMediaType('application', 'json'),
        ),
      ),
    );

    if (imageFile != null) {
      formData.files.add(
        MapEntry(
          'image',
          await MultipartFile.fromFile(
            imageFile.path,
            filename: imageFile.path.split(Platform.pathSeparator).last,
          ),
        ),
      );
    }

    final response = await _dio.put(
      ApiConstants.companyProfileById(id),
      data: formData,
    );

    return CompanyProfileResponseDTO.fromJson(response.data);
  }

  Future<String> deleteCompanyProfileImage(int id) async {
    final response = await _dio.delete(
      ApiConstants.deletecompanyProfileImage(id),
    );
    return response.data.toString();
  }






}