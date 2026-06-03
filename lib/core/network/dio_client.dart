import 'package:dio/dio.dart';
import 'package:libraryapp/core/network/dio_interceptor.dart';

class DioClient {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: "",
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        "Content-type": "application/json"
      },
    ),

  )
    ..interceptors.add(
        DioInterceptor()
    );
}