import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:libraryapp/core/network/api_endpoint.dart';
import 'package:libraryapp/features/penuliss_buku/data/models/models/res/penulis_delete_response.dart';

import '../models/models/req/create_penulis_req.dart';
import '../models/models/req/update_penulis_req.dart';
import '../models/models/res/detail_penulis_response.dart';
import '../models/models/res/penulis_msg_response.dart';
import '../models/models/res/penulis_response.dart';


class PenulisDataSource {
  final Dio dio;

  PenulisDataSource(this.dio);

  Future<PenulisResponse> getAllPenulis() async{
    final response = await dio.get(ApiEndpoint.author);
    
    return PenulisResponse.fromJson(response.data);
  }
  
  Future<DetailPenulisResponse> getPenulisById({required String id}) async {
    final response = await dio.get("${ApiEndpoint.detailAuthor}/$id");

    return DetailPenulisResponse.fromJson(response.data);
  }
  
  Future<PenulisMsgResponse> createPenulis({required CreatePenulisReq request}) async{
    final response = await dio.post(ApiEndpoint.createAuthor, data: request.toJson());
    
    return PenulisMsgResponse.fromJson(response.data);
  }
  
  Future<PenulisMsgResponse> updatePenulis({required UpdatePenulisReq request}) async{
    final response = await dio.put(ApiEndpoint.updateAuthor, data: request.toJson());
    debugPrint("Data nya ${response.data}");
    
    return PenulisMsgResponse.fromJson(response.data);
  }

  Future<PenulisDeleteResponse> deletePenulis({required String id }) async{
    final data = {
      "id" : id
    };
    final response = await dio.delete(ApiEndpoint.deleteAuthor, data: data);

    return PenulisDeleteResponse.fromJson(response.data);
  }

}