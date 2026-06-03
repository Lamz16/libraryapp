import 'package:dio/dio.dart';
import 'package:libraryapp/core/network/api_endpoint.dart';
import 'package:libraryapp/features/book/data/models/res/buku_response.dart';
import 'package:libraryapp/features/book/data/models/res/detail_buku_response.dart';

class BookDataSource {
  final Dio dio;

  BookDataSource(this.dio);

  Future<BukuResponse> getAllBook() async {
    final response = await dio.get(ApiEndpoint.buku);

    return BukuResponse.fromJson(response.data);
  }
  
  Future<DetailBukuResponse> getBookById({required String id}) async{
    final response = await dio.get("${ApiEndpoint.detailBuku}/$id");

    return DetailBukuResponse.fromJson(response.data);
  }
}
