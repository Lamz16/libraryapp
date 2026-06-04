import 'package:dio/dio.dart';
import 'package:libraryapp/core/network/api_endpoint.dart';
import 'package:libraryapp/features/penerbit_buku/data/models/models/req/create_penerbit_req.dart';
import 'package:libraryapp/features/penerbit_buku/data/models/models/req/penerbit_update_req.dart';
import 'package:libraryapp/features/penerbit_buku/data/models/models/res/detail_penerbit_response.dart';
import 'package:libraryapp/features/penerbit_buku/data/models/models/res/penerbit_delete_response.dart';
import 'package:libraryapp/features/penerbit_buku/data/models/models/res/penerbit_msg_response.dart';
import 'package:libraryapp/features/penerbit_buku/data/models/models/res/penerbit_response.dart';

class PenerbitDatasource {
  final Dio dio;
  
  PenerbitDatasource(this.dio);
  
  Future<PenerbitResponse> getAllPenerbit() async{
    final response = await dio.get(ApiEndpoint.penerbit);
    
    return PenerbitResponse.fromJson(response.data);
  }
  
  Future<DetailPenerbitResponse> getDetailPenerbit({required String id}) async{
    final response = await dio.get("${ApiEndpoint.detailPenerbit}/$id");

    return DetailPenerbitResponse.fromJson(response.data);
  }

  Future<PenerbitMsgResponse> createPenerbit({required CreatePenerbitReq request}) async{
    final response = await dio.post(ApiEndpoint.createPenerbit, data: request.toJson());
    return PenerbitMsgResponse.fromJson(response.data);
  }

  Future<PenerbitMsgResponse> updatePenerbit({required PenerbitUpdateReq request}) async{
    final response = await dio.put(ApiEndpoint.updatePenerbit, data: request.toJson());
    return PenerbitMsgResponse.fromJson(response.data);
  }

  Future<PenerbitDeleteResponse> deletePenerbit({required String id}) async {
    final data ={
      "id": id
    };
    final response = await dio.delete(ApiEndpoint.deletePenerbit, data: data);
    return PenerbitDeleteResponse.fromJson(response.data);
  }
  
  
}