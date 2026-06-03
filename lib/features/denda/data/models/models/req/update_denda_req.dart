class UpdateDendaReq {
  final String idDenda;
  final int jumlahDenda;
  final String tglPinjam;
  final String tglHrsKembali;
  final String tglKembali;
  final String idPeminjaman;
  final String idAnggota;

  UpdateDendaReq({
    required this.idDenda,
    required this.jumlahDenda,
    required this.tglPinjam,
    required this.tglHrsKembali,
    required this.tglKembali,
    required this.idPeminjaman,
    required this.idAnggota,
  });

  Map<String, dynamic> toJson() {
    return {
      "id_denda": idDenda,
      "jumlah_denda": jumlahDenda,
      "tgl_pinjam": tglPinjam,
      "tgl_hrs_kembali": tglHrsKembali,
      "tgl_kembali": tglKembali,
      "id_peminjaman": idPeminjaman,
      "id_anggota": idAnggota,
    };
  }
}