

class JenbuResponse {
  final String msg;

  JenbuResponse({
    required this.msg,
  });

  factory JenbuResponse.fromJson(
      Map<String, dynamic> json,
      ) {

    return JenbuResponse(
      msg: json["msg"] ?? "",
    );

  }

}