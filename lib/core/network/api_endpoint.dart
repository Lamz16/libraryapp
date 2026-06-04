class ApiEndpoint {
  static const String baseUrl = "http://192.168.2.168:8001/api/v1";

  // AUTH
  static const String login = "$baseUrl/login";

  // BUKU PUBLIC
  static const String buku = "$baseUrl/buku";
  static const String detailBuku = "$baseUrl/buku";

  // JENIS BUKU
  static const String jenisBuku = "$baseUrl/admin/buku/jenbuk";
  static const String detailJenisBuku = "$baseUrl/admin/buku/jenbuk";
  static const String createJenisBuku =
      "$baseUrl/admin/buku/jenbuk/create";
  static const String updateJenisBuku =
      "$baseUrl/admin/buku/jenbuk/update";
  static const String deleteJenisBuku =
      "$baseUrl/admin/buku/jenbuk/delete";

  // AUTHOR
  static const String author = "$baseUrl/admin/buku/author";
  static const String detailAuthor = "$baseUrl/admin/buku/author";
  static const String createAuthor =
      "$baseUrl/admin/buku/author/create";
  static const String updateAuthor =
      "$baseUrl/admin/buku/author/update";
  static const String deleteAuthor =
      "$baseUrl/admin/buku/author/delete";

  // PENERBIT
  static const String penerbit = "$baseUrl/admin/buku/penbuk";
  static const String detailPenerbit = "$baseUrl/admin/buku/penbuk";
  static const String createPenerbit =
      "$baseUrl/admin/buku/penbuk/create";
  static const String updatePenerbit =
      "$baseUrl/admin/buku/penbuk/update";
  static const String deletePenerbit =
      "$baseUrl/admin/buku/penbuk/delete";

  // PEMINJAMAN
  static const String peminjaman =
      "$baseUrl/admin/peminjaman";
  static const String detailPeminjaman =
      "$baseUrl/admin/peminjaman";
  static const String detailFullPeminjaman =
      "$baseUrl/admin/peminjaman/detail";
  static const String createPeminjaman =
      "$baseUrl/admin/peminjaman/create";
  static const String updatePeminjaman =
      "$baseUrl/admin/peminjaman/update";
  static const String deletePeminjaman =
      "$baseUrl/admin/peminjaman/delete";

  // DENDA
  static const String denda =
      "$baseUrl/admin/denda";
  static const String detailDenda =
      "$baseUrl/admin/denda";
  static const String createDenda =
      "$baseUrl/admin/denda/create";
  static const String updateDenda =
      "$baseUrl/admin/denda/update";
  static const String deleteDenda =
      "$baseUrl/admin/denda/delete";
}