import 'package:dio/dio.dart';
import 'package:libraryapp/core/network/api_endpoint.dart';
import 'package:libraryapp/features/auth/data/models/req/login_request.dart';
import 'package:libraryapp/features/auth/data/models/res/login_response.dart';

class AuthDataSource {
  final Dio dio;

  AuthDataSource(this.dio);

  Future<LoginResponse> login(LoginRequest request) async {
    try {
      final response = await dio.post(
        ApiEndpoint.login,
        data: request.toJson(),
      );

      return LoginResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(
        e.response?.data['msg'] ??
            e.message ??
            'Terjadi kesalahan saat login',
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
