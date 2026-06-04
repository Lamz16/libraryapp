import 'package:dio/dio.dart';
import 'package:libraryapp/core/network/api_endpoint.dart';
import 'package:libraryapp/features/denda/data/models/models/req/create_denda_req.dart';
import 'package:libraryapp/features/denda/data/models/models/req/update_denda_req.dart';
import 'package:libraryapp/features/denda/data/models/models/res/Denda_msg_response.dart';
import 'package:libraryapp/features/denda/data/models/models/res/denda_response.dart';
import 'package:libraryapp/features/denda/data/models/models/res/detail_denda_response.dart';

class DendaDataSource {
  final Dio dio;

  DendaDataSource(this.dio);

  Future<DendaResponse> getAllDenda() async {
    try {
      final response = await dio.get(ApiEndpoint.denda);

      return DendaResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(
        e.response?.data['message'] ??
            e.message ??
            'Terjadi kesalahan saat mengambil data denda',
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<DetailDendaResponse> getDendaDetail({
    required String id,
  }) async {
    try {
      final response = await dio.get("${ApiEndpoint.detailDenda}/$id");

      return DetailDendaResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(
        e.response?.data['msg'] ??
            e.message ??
            'Terjadi kesalahan saat mengambil detail denda',
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<DendaMsgResponse> createDenda({
    required CreateDendaReq request,
  }) async {
    try {
      final response = await dio.post(
        ApiEndpoint.createDenda,
        data: request.toJson(),
      );

      return DendaMsgResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(
        e.response?.data['msg'] ??
            e.message ??
            'Terjadi kesalahan saat menambahkan denda',
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<DendaMsgResponse> updateDenda({
    required UpdateDendaReq request,
  }) async {
    try {
      final response = await dio.put(
        ApiEndpoint.updateDenda,
        data: request.toJson(),
      );

      return DendaMsgResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(
        e.response?.data['msg'] ??
            e.message ??
            'Terjadi kesalahan saat mengubah denda',
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<DendaMsgResponse> deleteDenda({
    required String id,
  }) async {
    try {
      final Map<String, String> data = {
        "id_denda": id,
      };

      final response = await dio.delete(
        ApiEndpoint.deleteDenda,
        data: data,
      );

      return DendaMsgResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(
        e.response?.data['msg'] ??
            e.message ??
            'Terjadi kesalahan saat menghapus denda',
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}