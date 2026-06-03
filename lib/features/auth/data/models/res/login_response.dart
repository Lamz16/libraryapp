class LoginResponse {

  final LoginData data;
  final bool error;
  final String msg;

  LoginResponse({
    required this.data,
    required this.error,
    required this.msg,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      data: LoginData.fromJson(json["data"]),
      error: json["error"],
      msg: json["msg"],
    );
  }

}

class LoginData {

  final String username;
  final String token;
  final String refreshToken;

  LoginData({
    required this.username,
    required this.token,
    required this.refreshToken,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      username: json["username"],
      token: json["token"],
      refreshToken: json["refresh_token"],
    );
  }

}