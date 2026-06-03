class CreateDendaReq {
  int jumlahDenda;
  String tglPinjam;
  String tglHrsKembali;
  String tglKembali;
  String idPeminjaman;
  String idAnggota;

  CreateDendaReq({
    required this.jumlahDenda,
    required this.tglPinjam,
    required this.tglHrsKembali,
    required this.tglKembali,
    required this.idPeminjaman,
    required this.idAnggota,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['jumlah_denda'] = jumlahDenda;
    map['tgl_pinjam'] = tglPinjam;
    map['tgl_hrs_kembali'] = tglHrsKembali;
    map['tgl_kembali'] = tglKembali;
    map['id_peminjaman'] = idPeminjaman;
    map['id_anggota'] = idAnggota;
    return map;
  }
}
