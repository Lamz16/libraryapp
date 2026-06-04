
class CreatePenulisReq {
    CreatePenulisReq({
        required this.emailPenulis,
        required this.penulisBuku,
        required this.alamatPenulis,
        required this.deskripsi,
    });

    String emailPenulis;
    String penulisBuku;
    String alamatPenulis;
    String deskripsi;

    Map<dynamic, dynamic> toJson() => {
        "email_penulis": emailPenulis,
        "penulis_buku": penulisBuku,
        "alamat_penulis": alamatPenulis,
        "deskripsi": deskripsi,
    };
}
