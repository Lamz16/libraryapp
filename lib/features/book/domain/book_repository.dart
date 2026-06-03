import 'package:libraryapp/features/book/data/models/res/buku_response.dart';

abstract class BookRepository {
  Future<BukuResponse> getAllBook();
}