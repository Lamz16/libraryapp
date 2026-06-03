class BukuResponse {

  final List<Buku> data;
  final bool error;
  final String msg;

  BukuResponse({
    required this.data,
    required this.error,
    required this.msg,
  });

  factory BukuResponse.fromJson(Map<String, dynamic> json) {
    return BukuResponse(
      data: List<Buku>.from(
        json["data"].map(
              (x) => Buku.fromJson(x),
        ),
      ),
      error: json["error"],
      msg: json["msg"],
    );
  }

}

class Buku {

  final String idBuku;
  final String isbn;
  final String idKategoriBuku;
  final String judulBuku;
  final String idPenulisBuku;
  final String idPenerbitBuku;
  final String tahunTerbit;
  final int stokBuku;
  final String rakBuku;
  final String deskripsiBuku;
  final String gambarBuku;
  final String kondisiBuku;
  final DateTime createdAt;
  final DateTime updatedAt;

  Buku({
    required this.idBuku,
    required this.isbn,
    required this.idKategoriBuku,
    required this.judulBuku,
    required this.idPenulisBuku,
    required this.idPenerbitBuku,
    required this.tahunTerbit,
    required this.stokBuku,
    required this.rakBuku,
    required this.deskripsiBuku,
    required this.gambarBuku,
    required this.kondisiBuku,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Buku.fromJson(Map<String, dynamic> json) {
    return Buku(
      idBuku: json["id_buku"],
      isbn: json["isbn"],
      idKategoriBuku: json["id_kategori_buku"],
      judulBuku: json["judul_buku"],
      idPenulisBuku: json["id_penulis_buku"],
      idPenerbitBuku: json["id_penerbit_buku"],
      tahunTerbit: json["tahun_terbit"],
      stokBuku: json["stok_buku"],
      rakBuku: json["rak_buku"],
      deskripsiBuku: json["deskripsi_buku"],
      gambarBuku: json["gambar_buku"],
      kondisiBuku: json["kondisi_buku"],
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
    );
  }

}