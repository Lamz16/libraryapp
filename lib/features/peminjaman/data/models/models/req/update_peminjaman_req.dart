
class UpdatePeminjamanReq {
    UpdatePeminjamanReq({
        required this.idPeminjaman,
        required this.jaminan,
        required this.tglHrsKembali,
        required this.idAnggota,
        required this.tglPinjam,
    });

    String idPeminjaman;
    String jaminan;
    String tglHrsKembali;
    String idAnggota;
    String tglPinjam;

    Map<dynamic, dynamic> toJson() => {
        "id_peminjaman": idPeminjaman,
        "jaminan": jaminan,
        "tgl_hrs_kembali": tglHrsKembali,
        "id_anggota": idAnggota,
        "tgl_pinjam": tglPinjam,
    };
}
