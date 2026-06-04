class PenerbitDeleteResponse {
  String msg;

  PenerbitDeleteResponse({required this.msg});

  factory PenerbitDeleteResponse.fromJson(Map<dynamic, dynamic> json) =>
      PenerbitDeleteResponse(msg: json["msg"]);
}
