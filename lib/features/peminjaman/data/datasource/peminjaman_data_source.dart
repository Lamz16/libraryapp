import 'package:dio/dio.dart';
import 'package:libraryapp/core/network/api_endpoint.dart';
import 'package:libraryapp/features/peminjaman/data/models/models/req/create_peminjaman_req.dart';
import 'package:libraryapp/features/peminjaman/data/models/models/req/update_peminjaman_req.dart';
import 'package:libraryapp/features/peminjaman/data/models/models/res/peminjaman_detail_response.dart';
import 'package:libraryapp/features/peminjaman/data/models/models/res/peminjaman_id_response.dart';
import 'package:libraryapp/features/peminjaman/data/models/models/res/peminjaman_msg_response.dart';
import 'package:libraryapp/features/peminjaman/data/models/models/res/peminjaman_response.dart';

class PeminjamanDataSource {
  final Dio dio;

  PeminjamanDataSource(this.dio);

  Future<PeminjamanResponse> getAllPeminjaman() async {
    try {
      final response = await dio.get(ApiEndpoint.peminjaman);

      return PeminjamanResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(
        e.response?.data['msg'] ??
            e.message ??
            'Terjadi kesalahan saat mengambil data peminjaman',
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<PeminjamanIdResponse> getPeminjamanId({
    required String id,
  }) async {
    try {
      final response = await dio.get(
        "${ApiEndpoint.detailPeminjaman}/$id",
      );

      return PeminjamanIdResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(
        e.response?.data['msg'] ??
            e.message ??
            'Terjadi kesalahan saat mengambil data peminjaman',
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<PeminjamanDetailResponse> getDetailPeminjaman({
    required String id,
  }) async {
    try {
      final response = await dio.get(
        "${ApiEndpoint.detailFullPeminjaman}/$id",
      );

      return PeminjamanDetailResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(
        e.response?.data['msg'] ??
            e.message ??
            'Terjadi kesalahan saat mengambil detail peminjaman',
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<PeminjamanMsgResponse> createPeminjaman({
    required CreatePeminjamanReq request,
  }) async {
    try {
      final response = await dio.post(
        ApiEndpoint.createPeminjaman,
        data: request.toJson(),
      );

      return PeminjamanMsgResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(
        e.response?.data['msg'] ??
            e.message ??
            'Terjadi kesalahan saat menambahkan peminjaman',
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<PeminjamanMsgResponse> updatePeminjaman({
    required UpdatePeminjamanReq request,
  }) async {
    try {
      final response = await dio.put(
        ApiEndpoint.updatePeminjaman,
        data: request.toJson(),
      );

      return PeminjamanMsgResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(
        e.response?.data['msg'] ??
            e.message ??
            'Terjadi kesalahan saat mengubah peminjaman',
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<PeminjamanMsgResponse> deletePeminjaman({
    required String id,
  }) async {
    try {
      final data = {
        "id_peminjaman": id,
      };

      final response = await dio.delete(
        ApiEndpoint.deletePeminjaman,
        data: data,
      );

      return PeminjamanMsgResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(
        e.response?.data['msg'] ??
            e.message ??
            'Terjadi kesalahan saat menghapus peminjaman',
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}