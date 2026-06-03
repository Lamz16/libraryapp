class DendaMsgResponse {
  String msg;

  DendaMsgResponse({required this.msg});

  factory DendaMsgResponse.fromJson(Map<String, dynamic> json) {
    return DendaMsgResponse(
      msg: json['msg'],
    );
  }
}