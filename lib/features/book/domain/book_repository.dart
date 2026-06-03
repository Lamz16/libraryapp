import 'package:libraryapp/features/book/data/models/res/buku_response.dart';
import 'package:libraryapp/features/book/data/models/res/detail_buku_response.dart';

abstract class BookRepository {
  Future<BukuResponse> getAllBook();
  Future<DetailBukuResponse> getBookById({required String id});
}