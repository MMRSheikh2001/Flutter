import 'package:dio/dio.dart';
import 'package:work_bridge_flutter/utils/api_client.dart';

class CompanyProfileRepository {
  CompanyProfileRepository(this._apiClient);

  final ApiClient _apiClient;

  Dio get _dio => _apiClient.dio;








}