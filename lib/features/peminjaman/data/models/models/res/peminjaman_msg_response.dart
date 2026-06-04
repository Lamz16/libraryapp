
class PeminjamanMsgResponse {
    PeminjamanMsgResponse({
        required this.msg,
        required this.error,
    });

    String msg;
    bool error;

    factory PeminjamanMsgResponse.fromJson(Map<dynamic, dynamic> json) => PeminjamanMsgResponse(
        msg: json["msg"],
        error: json["error"],
    );
}
