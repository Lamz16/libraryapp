class PeminjamanResponse {
  final List<Peminjaman> data;
  final bool error;
  final String msg;

  PeminjamanResponse({
    required this.data,
    required this.error,
    required this.msg,
  });

  factory PeminjamanResponse.fromJson(Map<String, dynamic> json) {
    return PeminjamanResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => Peminjaman.fromJson(e))
          .toList(),
      error: json['error'] ?? false,
      msg: json['msg'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((e) => e.toJson()).toList(),
      'error': error,
      'msg': msg,
    };
  }
}

class Peminjaman {
  final String id;
  final String idAnggota;
  final DateTime tglPinjam;
  final DateTime tglHrsKembali;
  final String jaminan;
  final DateTime createdAt;
  final DateTime updatedAt;

  Peminjaman({
    required this.id,
    required this.idAnggota,
    required this.tglPinjam,
    required this.tglHrsKembali,
    required this.jaminan,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Peminjaman.fromJson(Map<String, dynamic> json) {
    return Peminjaman(
      id: json['id'] ?? '',
      idAnggota: json['id_anggota'] ?? '',
      tglPinjam: DateTime.parse(json['tgl_pinjam']),
      tglHrsKembali: DateTime.parse(json['tgl_hrs_kembali']),
      jaminan: json['jaminan'] ?? '',
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'id_anggota': idAnggota,
      'tgl_pinjam': tglPinjam.toIso8601String(),
      'tgl_hrs_kembali': tglHrsKembali.toIso8601String(),
      'jaminan': jaminan,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}