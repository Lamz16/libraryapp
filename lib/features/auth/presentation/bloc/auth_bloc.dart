import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libraryapp/core/utils/shared_preference_helper.dart';
import 'package:libraryapp/features/auth/domain/auth_repository.dart';

import '../../../../core/state/result_state.dart';
import '../../data/models/req/login_request.dart';
import '../../data/models/res/login_response.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthBloc(this.repository) : super(AuthState.initial()) {
    on<LoginEvent>(_login);
  }

  Future<void> _login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(loginState: ResultLoading()));

    try {
      final response = await repository.login(
        LoginRequest(username: event.username, password: event.password),
      );

      await SharedPreferenceHelper.setToken(response.data.token);

      emit(state.copyWith(loginState: ResultLoaded(response)));
    } catch (e) {
      emit(state.copyWith(loginState: ResultError(e.toString())));
    }
  }
}
