import 'package:dio/dio.dart';
import 'package:libraryapp/core/network/api_endpoint.dart';
import 'package:libraryapp/features/jenbu/data/models/models/req/update_jenbu_req.dart';
import 'package:libraryapp/features/jenbu/data/models/models/res/JenbuResponse.dart';
import 'package:libraryapp/features/jenbu/data/models/models/res/detail_jenis_response.dart';
import 'package:libraryapp/features/jenbu/data/models/models/res/jenis_buku_response.dart';

import '../models/models/req/create_jenbu_req.dart';

class JenbuDataSource {
  final Dio dio;

  JenbuDataSource(this.dio);

  Future<JenisBukuResponse> getAllJenbu() async{
    final response = await dio.get(ApiEndpoint.jenisBuku);

    return JenisBukuResponse.fromJson(response.data);
  }

  Future<DetailJenisResponse> getJenbuById({required String id}) async{
    final response = await dio.get("${ApiEndpoint.detailJenisBuku}/$id");

    return DetailJenisResponse.fromJson(response.data);
  }


  Future<JenbuResponse> createJenbu({required CreateJenbuReq request}) async{
    final response = await dio.post(ApiEndpoint.createJenisBuku, data: request.toJson());

    return JenbuResponse.fromJson(response.data);
  }

  Future<JenbuResponse> updateJenbu({required UpdateJenbuReq request}) async {
    final response = await dio.put(ApiEndpoint.updateJenisBuku, data: request.toJson());

    return JenbuResponse.fromJson(response.data);
  }

  Future<JenbuResponse> deleteJenbu({required String id}) async{
    final Map<String, String> data = {
      "id" : id
    };
    final response = await dio.delete(ApiEndpoint.deleteJenisBuku, data: data);

    return JenbuResponse.fromJson(response.data);
  }
}