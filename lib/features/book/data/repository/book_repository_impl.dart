import 'package:libraryapp/features/book/data/datasource/book_data_source.dart';
import 'package:libraryapp/features/book/data/models/res/buku_response.dart';
import 'package:libraryapp/features/book/data/models/res/detail_buku_response.dart';
import 'package:libraryapp/features/book/domain/book_repository.dart';

class BookRepositoryImpl implements BookRepository{
  final BookDataSource dataSource;
  BookRepositoryImpl(this.dataSource);

  @override
  Future<BukuResponse> getAllBook() {
    return dataSource.getAllBook();
  }

  @override
  Future<DetailBukuResponse> getBookById({required String id}) {
    return dataSource.getBookById(id: id);
  }

}