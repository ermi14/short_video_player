import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pushit_test/utils/exceptions.dart';

import 'constants.dart';

class ApiBaseHelper {
  static const String url = kBaseUrl;

  static BaseOptions options = BaseOptions(
    baseUrl: url,
    responseType: ResponseType.json,
    connectTimeout: kTimeOutInMillis,
    receiveTimeout: kTimeOutInMillis,
  );

  static Dio createDio() {
    return Dio(options);
  }

  static Dio addInterceptors(Dio dio) {
    return dio
      ..interceptors.add(
        QueuedInterceptorsWrapper(onRequest: (
          RequestOptions requestOptions,
          RequestInterceptorHandler handler,
        ) async {
          requestOptions.headers['Content-Type'] = 'application/x-www-form-urlencoded';
          return handler.next(requestOptions);
        }, onError: (DioError error, handler) async {
          return handler.next(error);
        }),
      );
  }

  static final dio = createDio();
  static final baseAPI = addInterceptors(dio);

  Future<Response> postHTTP(String url, dynamic data) async {
    try {
      Response response = await baseAPI.post(url, data: data);
      return response;
    } on DioError catch (e) {
      throw NetworkException(e.toString());
    }
  }
}
