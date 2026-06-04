
class PenerbitMsgResponse {
  PenerbitMsgResponse({
    required this.status,
  });
  String status;

  factory PenerbitMsgResponse.fromJson(Map<dynamic, dynamic> json) => PenerbitMsgResponse(
    status: json["status"],
  );
}
