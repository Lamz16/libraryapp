import 'buku_response.dart';

class DetailBukuResponse {

  final Buku data;
  final bool error;
  final String msg;

  DetailBukuResponse({
    required this.data,
    required this.error,
    required this.msg,
  });

  factory DetailBukuResponse.fromJson(
      Map<String, dynamic> json,
      ) {

    return DetailBukuResponse(
      data: Buku.fromJson(
        json["data"],
      ),
      error: json["error"] ?? false,
      msg: json["msg"] ?? "",
    );

  }

}