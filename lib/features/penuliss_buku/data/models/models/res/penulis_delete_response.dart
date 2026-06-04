class PenulisDeleteResponse {
  String msg;

  PenulisDeleteResponse({required this.msg});

  factory PenulisDeleteResponse.fromJson(Map<dynamic, dynamic> json) =>
      PenulisDeleteResponse(msg: json["msg"]);
}
