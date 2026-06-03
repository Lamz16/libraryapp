import 'package:libraryapp/features/auth/data/models/req/login_request.dart';
import 'package:libraryapp/features/auth/data/models/res/login_response.dart';

abstract class AuthRepository {
  Future<LoginResponse> login(LoginRequest request);
}