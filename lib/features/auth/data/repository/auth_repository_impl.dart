import 'package:libraryapp/features/auth/data/datasource/auth_data_source.dart';
import 'package:libraryapp/features/auth/data/models/req/login_request.dart';
import 'package:libraryapp/features/auth/data/models/res/login_response.dart';
import 'package:libraryapp/features/auth/domain/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository{
  final AuthDataSource dataSource;

  AuthRepositoryImpl(this.dataSource);

  @override
  Future<LoginResponse> login(LoginRequest request){
    return dataSource.login(request);
  }

}