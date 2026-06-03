class UpdateJenbuReq {
  final String id;
  final String jenisBuku;
  final String deskripsi;

  UpdateJenbuReq({
    required this.id,
    required this.jenisBuku,
    required this.deskripsi,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "jenis_buku": jenisBuku,
      "deskripsi": deskripsi,
    };
  }
}