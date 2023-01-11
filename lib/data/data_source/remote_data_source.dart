import 'package:dio/dio.dart';

import '../../utils/api_helper.dart';
import '../../utils/exceptions.dart';

class RemoteDataSource {
  final ApiBaseHelper apiBaseHelper;

  RemoteDataSource({required this.apiBaseHelper});

  Future<Response> getVideos() async {
    try {
      final response = await apiBaseHelper.postHTTP(
        "api/clips",
        {
          'marAuth': '5344333591ebe3c10594e1abf146b309',
          'limit': '100',
          'sessionID': '389482'
        },
      );
      return response;
    } catch (e) {
      throw NetworkException(e.toString());
    }
  }
}
