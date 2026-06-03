part of 'auth_bloc.dart';

class AuthState {
  final ResultState<LoginResponse> loginState;

  AuthState({required this.loginState});

  factory AuthState.initial(){
    return AuthState(loginState: ResultNone());
  }

  AuthState copyWith({
    ResultState<LoginResponse>? loginState,
}){
    return AuthState(loginState: loginState ?? this.loginState);
  }

}
