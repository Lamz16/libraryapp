
class UpdatePenulisReq {
    UpdatePenulisReq({
        required this.emailPenulis,
        required this.penulisBuku,
        required this.id,
        required this.alamatPenulis,
        required this.deskripsi,
    });

    String emailPenulis;
    String penulisBuku;
    String id;
    String alamatPenulis;
    String deskripsi;

    Map<dynamic, dynamic> toJson() => {
        "email_penulis": emailPenulis,
        "penulis_buku": penulisBuku,
        "id": id,
        "alamat_penulis": alamatPenulis,
        "deskripsi": deskripsi,
    };
}
