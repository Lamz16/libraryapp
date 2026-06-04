import 'package:dio/dio.dart';
import 'package:libraryapp/core/network/api_endpoint.dart';
import 'package:libraryapp/features/book/data/models/res/buku_response.dart';
import 'package:libraryapp/features/book/data/models/res/detail_buku_response.dart';

class BookDataSource {
  final Dio dio;

  BookDataSource(this.dio);

  Future<BukuResponse> getAllBook() async {
    try {
      final response = await dio.get(ApiEndpoint.buku);

      return BukuResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(
        e.response?.data['message'] ??
            e.message ??
            'Terjadi kesalahan saat mengambil data buku',
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<DetailBukuResponse> getBookById({
    required String id,
  }) async {
    try {
      final response = await dio.get(
        "${ApiEndpoint.detailBuku}/$id",
      );

      return DetailBukuResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(
        e.response?.data['message'] ??
            e.message ??
            'Terjadi kesalahan saat mengambil detail buku',
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
