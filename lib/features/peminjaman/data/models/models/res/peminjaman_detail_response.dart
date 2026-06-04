class PeminjamanDetailResponse {
  PeminjamanDetailResponse({
    required this.msg,
    required this.data,
    required this.error,
  });

  String msg;
  Data data;
  bool error;

  factory PeminjamanDetailResponse.fromJson(Map<dynamic, dynamic> json) =>
      PeminjamanDetailResponse(
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
        error: json["error"],
      );
}

class Data {
  Data({
    required this.anggota,
    required this.jaminan,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
    required this.tglHrsKembali,
    required this.tglPinjam,
  });

  Anggota anggota;
  String jaminan;
  String updatedAt;
  String createdAt;
  String id;
  String tglHrsKembali;
  String tglPinjam;

  factory Data.fromJson(Map<dynamic, dynamic> json) => Data(
    anggota: Anggota.fromJson(json["anggota"]),
    jaminan: json["jaminan"],
    updatedAt: json["updated_at"],
    createdAt: json["created_at"],
    id: json["id"],
    tglHrsKembali: json["tgl_hrs_kembali"],
    tglPinjam: json["tgl_pinjam"],
  );
}

class Anggota {
  Anggota({required this.nama, required this.idAnggota});

  String nama;
  String idAnggota;

  factory Anggota.fromJson(Map<dynamic, dynamic> json) =>
      Anggota(nama: json["nama"], idAnggota: json["id_anggota"]);
}
