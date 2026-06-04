
class PenulisMsgResponse {
    PenulisMsgResponse({
        required this.status,
    });
    String status;

    factory PenulisMsgResponse.fromJson(Map<dynamic, dynamic> json) => PenulisMsgResponse(
        status: json["status"],
    );
}
