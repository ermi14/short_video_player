import 'package:dio/dio.dart';

import '../../utils/api_helper.dart';
import '../../utils/exceptions.dart';

class RemoteDataSource {
  final ApiBaseHelper apiBaseHelper;

  RemoteDataSource({required this.apiBaseHelper});

  Future<Response> getVideos() async {
    try {
      final response = await apiBaseHelper.getHTTP("api/clips");
      return response;
    } catch (e) {
      throw NetworkException(e.toString());
    }
  }
}
