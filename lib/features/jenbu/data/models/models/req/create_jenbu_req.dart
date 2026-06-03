class CreateJenbuReq {

  final String jenisBuku;
  final String deskripsi;

  CreateJenbuReq({
    required this.jenisBuku,
    required this.deskripsi,
  });

  Map<String, dynamic> toJson() {

    return {
      "jenis_buku": jenisBuku,
      "deskripsi": deskripsi,
    };

  }

}