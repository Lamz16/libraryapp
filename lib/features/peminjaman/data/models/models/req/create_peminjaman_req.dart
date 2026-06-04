
class CreatePeminjamanReq {
    CreatePeminjamanReq({
        required this.jaminan,
        required this.tglHrsKembali,
        required this.idAnggota,
        required this.tglPinjam,
    });

    String jaminan;
    String tglHrsKembali;
    String idAnggota;
    String tglPinjam;
    
    Map<dynamic, dynamic> toJson() => {
        "jaminan": jaminan,
        "tgl_hrs_kembali": tglHrsKembali,
        "id_anggota": idAnggota,
        "tgl_pinjam": tglPinjam,
    };
}
