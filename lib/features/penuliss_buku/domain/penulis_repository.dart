
import '../data/models/models/req/create_penulis_req.dart';
import '../data/models/models/req/update_penulis_req.dart';
import '../data/models/models/res/detail_penulis_response.dart';
import '../data/models/models/res/penulis_delete_response.dart';
import '../data/models/models/res/penulis_msg_response.dart';
import '../data/models/models/res/penulis_response.dart';

abstract class PenulisRepository {

  Future<PenulisResponse> getAllPenulis();
  Future<DetailPenulisResponse> getPenulisById({required String id});
  Future<PenulisMsgResponse> createPenulis({required CreatePenulisReq request});
  Future<PenulisMsgResponse> updatePenulis({required UpdatePenulisReq request});
  Future<PenulisDeleteResponse> deletePenulis({required String id});
}