

import '../../domain/penulis_repository.dart';
import '../datasource/penulis_buku_datasource.dart';
import '../models/models/req/create_penulis_req.dart';
import '../models/models/req/update_penulis_req.dart';
import '../models/models/res/detail_penulis_response.dart';
import '../models/models/res/penulis_delete_response.dart';
import '../models/models/res/penulis_msg_response.dart';
import '../models/models/res/penulis_response.dart';

class PenulisRepositoryImpl implements PenulisRepository{
  final PenulisDataSource datasource;

  PenulisRepositoryImpl(this.datasource);

  @override
  Future<PenulisMsgResponse> createPenulis({required CreatePenulisReq request}) {
    return datasource.createPenulis(request: request);
  }

  @override
  Future<PenulisDeleteResponse> deletePenulis({required String id}) {
    return datasource.deletePenulis(id: id);
  }

  @override
  Future<PenulisResponse> getAllPenulis() {
    return datasource.getAllPenulis();
  }

  @override
  Future<DetailPenulisResponse> getPenulisById({required String id}) {
    return datasource.getPenulisById(id: id);
  }

  @override
  Future<PenulisMsgResponse> updatePenulis({required UpdatePenulisReq request}) {
    return datasource.updatePenulis(request: request);
  }

}