class JenisBukuResponse {

  final List<JenisBuku> data;
  final bool error;
  final String msg;

  JenisBukuResponse({
    required this.data,
    required this.error,
    required this.msg,
  });

  factory JenisBukuResponse.fromJson(
      Map<String, dynamic> json,
      ) {

    return JenisBukuResponse(
      data: List<JenisBuku>.from(
        (json["data"] ?? []).map(
              (x) => JenisBuku.fromJson(x),
        ),
      ),
      error: json["error"] ?? false,
      msg: json["msg"] ?? "",
    );

  }

}

class JenisBuku {

  final String id;
  final String jenisBuku;
  final String deskripsi;
  final DateTime updatedAt;

  JenisBuku({
    required this.id,
    required this.jenisBuku,
    required this.deskripsi,
    required this.updatedAt,
  });

  factory JenisBuku.fromJson(
      Map<String, dynamic> json,
      ) {

    return JenisBuku(
      id: json["id"] ?? "",
      jenisBuku:
      json["jenis_buku"] ?? "",
      deskripsi:
      json["deskripsi"] ?? "",
      updatedAt:
      DateTime.parse(
        json["updated_at"],
      ),
    );

  }

}