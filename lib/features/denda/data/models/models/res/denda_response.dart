class DendaResponse {
  final List<DendaModel> data;
  final bool error;
  final String msg;

  DendaResponse({
    required this.data,
    required this.error,
    required this.msg,
  });

  factory DendaResponse.fromJson(Map<String, dynamic> json) {
    return DendaResponse(
      data: (json['data'] as List)
          .map((e) => DendaModel.fromJson(e))
          .toList(),
      error: json['error'] ?? false,
      msg: json['msg'] ?? '',
    );
  }
}

class DendaModel {
  final String idDenda;
  final int jumlahDenda;
  final DateTime tglPinjam;
  final DateTime tglHrsKembali;
  final DateTime tglKembali;
  final String idPeminjaman;
  final String idAnggota;
  final DateTime createdAt;
  final DateTime updatedAt;

  DendaModel({
    required this.idDenda,
    required this.jumlahDenda,
    required this.tglPinjam,
    required this.tglHrsKembali,
    required this.tglKembali,
    required this.idPeminjaman,
    required this.idAnggota,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DendaModel.fromJson(Map<String, dynamic> json) {
    return DendaModel(
      idDenda: json['id_denda'] ?? '',
      jumlahDenda: json['jumlah_denda'] ?? 0,
      tglPinjam: DateTime.parse(json['tgl_pinjam']),
      tglHrsKembali: DateTime.parse(json['tgl_hrs_kembali']),
      tglKembali: DateTime.parse(json['tgl_kembali']),
      idPeminjaman: json['id_peminjaman'] ?? '',
      idAnggota: json['id_anggota'] ?? '',
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
