

class PenerbitUpdateReq {
    PenerbitUpdateReq({
        required this.emailPenerbit,
        required this.penerbitBuku,
        required this.alamatPenerbit,
        required this.telpPenerbit,
        required this.id,
        required this.deskripsi,
    });

    String emailPenerbit;
    String penerbitBuku;
    String alamatPenerbit;
    String telpPenerbit;
    String id;
    String deskripsi;

    Map<dynamic, dynamic> toJson() => {
        "email_penerbit": emailPenerbit,
        "penerbit_buku": penerbitBuku,
        "alamat_penerbit": alamatPenerbit,
        "telp_penerbit": telpPenerbit,
        "id": id,
        "deskripsi": deskripsi,
    };
}
