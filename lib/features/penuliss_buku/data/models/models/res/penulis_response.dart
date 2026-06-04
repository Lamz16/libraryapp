
class PenulisResponse {
    PenulisResponse({
        required this.data,
        required this.error,
        required this.status,
    });

    List<Datum> data;
    bool error;
    String status;

    factory PenulisResponse.fromJson(Map<dynamic, dynamic> json) => PenulisResponse(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        error: json["error"],
        status: json["status"],
    );
}

class Datum {
    Datum({
        required this.updatedAt,
        required this.emailPenulis,
        required this.penulisBuku,
        required this.id,
        required this.deskripsi,
        required this.alamat,
    });

    String updatedAt;
    String emailPenulis;
    String penulisBuku;
    String id;
    String deskripsi;
    String alamat;

    factory Datum.fromJson(Map<dynamic, dynamic> json) => Datum(
        updatedAt: json["updated_at"],
        emailPenulis: json["email_penulis"],
        penulisBuku: json["penulis_buku"],
        id: json["id"],
        deskripsi: json["deskripsi"],
        alamat: json["alamat"],
    );
}
