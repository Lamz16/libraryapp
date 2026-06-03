import 'package:dio/dio.dart';
import 'package:libraryapp/core/network/api_endpoint.dart';
import 'package:libraryapp/features/jenbu/data/models/models/res/CreateJenbuRes.dart';
import 'package:libraryapp/features/jenbu/data/models/models/res/jenis_buku_response.dart';

import '../models/models/req/create_jenbu_req.dart';

class JenbuDataSource {
  final Dio dio;

  JenbuDataSource(this.dio);

  Future<JenisBukuResponse> getAllJenbu() async{
    final response = await dio.get(ApiEndpoint.jenisBuku);

    return JenisBukuResponse.fromJson(response.data);
  }


  Future<CreateJenbuRes> createJenbu({required CreateJenbuReq request}) async{
    final response = await dio.post(ApiEndpoint.createJenisBuku, data: request.toJson());

    return CreateJenbuRes.fromJson(response.data);
  }
}