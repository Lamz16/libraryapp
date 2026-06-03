import 'package:dio/dio.dart';
import 'package:libraryapp/core/network/api_endpoint.dart';
import 'package:libraryapp/features/auth/data/models/req/login_request.dart';
import 'package:libraryapp/features/auth/data/models/res/login_response.dart';

class AuthDataSource {
  final Dio dio;

  AuthDataSource(this.dio);

  Future<LoginResponse> login(LoginRequest request) async {

    final response = await dio.post(ApiEndpoint.login, data: request.toJson());

    return LoginResponse.fromJson(response.data);
  }
}
