
class PenerbitResponse {
    PenerbitResponse({
        required this.data,
        required this.error,
        required this.status,
    });

    List<Datum> data;
    bool error;
    String status;

    factory PenerbitResponse.fromJson(Map<dynamic, dynamic> json) => PenerbitResponse(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        error: json["error"],
        status: json["status"],
    );
}

class Datum {
    Datum({
        required this.emailPenerbit,
        required this.updatedAt,
        required this.penerbitBuku,
        required this.alamatPenerbit,
        required this.telpPenerbit,
        required this.deskripsiPenerbit,
        required this.id,
    });

    String emailPenerbit;
    String updatedAt;
    String penerbitBuku;
    String alamatPenerbit;
    String telpPenerbit;
    String deskripsiPenerbit;
    String id;

    factory Datum.fromJson(Map<dynamic, dynamic> json) => Datum(
        emailPenerbit: json["email_penerbit"],
        updatedAt: json["updated_at"],
        penerbitBuku: json["penerbit_buku"],
        alamatPenerbit: json["alamat_penerbit"],
        telpPenerbit: json["telp_penerbit"],
        deskripsiPenerbit: json["deskripsi_penerbit"],
        id: json["id"],
    );
}
