class CreatePenerbitReq {
    CreatePenerbitReq({
        required this.emailPenerbit,
        required this.penerbitBuku,
        required this.alamatPenerbit,
        required this.telpPenerbit,
        required this.deskripsi,
    });

    String emailPenerbit;
    String penerbitBuku;
    String alamatPenerbit;
    String telpPenerbit;
    String deskripsi;

    Map<dynamic, dynamic> toJson() => {
        "email_penerbit": emailPenerbit,
        "penerbit_buku": penerbitBuku,
        "alamat_penerbit": alamatPenerbit,
        "telp_penerbit": telpPenerbit,
        "deskripsi": deskripsi,
    };
}
