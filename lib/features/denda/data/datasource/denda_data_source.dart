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
    final response = await dio.get(ApiEndpoint.denda);

    return DendaResponse.fromJson(response.data);
  }

  Future<DetailDendaResponse> getDendaDetail({required String id}) async {
    final response = await dio.get("${ApiEndpoint.detailDenda}/$id");

    return DetailDendaResponse.fromJson(response.data);
  }

  Future<DendaMsgResponse> createDenda({required CreateDendaReq request}) async {
    final response = await dio.post(ApiEndpoint.createDenda, data: request.toJson());

    return DendaMsgResponse.fromJson(response.data);
  }

  Future<DendaMsgResponse> updateDenda({required UpdateDendaReq request}) async{
    final response = await dio.put(ApiEndpoint.updateDenda, data: request.toJson());

    return DendaMsgResponse.fromJson(response.data);
  }

  Future<DendaMsgResponse> deleteDenda({required String id}) async {
    final Map<String, String> data = {
      "id_denda" : id
    };
    final response = await dio.delete(ApiEndpoint.deleteDenda, data: data);

    return DendaMsgResponse.fromJson(response.data);
  }
}