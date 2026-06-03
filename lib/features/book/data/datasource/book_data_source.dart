import 'package:dio/dio.dart';
import 'package:libraryapp/core/network/api_endpoint.dart';
import 'package:libraryapp/features/book/data/models/res/buku_response.dart';

class BookDataSource {
  final Dio dio;

  BookDataSource(this.dio);

  Future<BukuResponse> getAllBook() async {
    final response = await dio.get(ApiEndpoint.buku);

    return BukuResponse.fromJson(response.data);
  }
}
