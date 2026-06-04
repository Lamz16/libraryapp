import 'package:libraryapp/features/penerbit_buku/data/models/models/req/create_penerbit_req.dart';
import 'package:libraryapp/features/penerbit_buku/data/models/models/req/penerbit_update_req.dart';
import 'package:libraryapp/features/penerbit_buku/data/models/models/res/detail_penerbit_response.dart';
import 'package:libraryapp/features/penerbit_buku/data/models/models/res/penerbit_delete_response.dart';
import 'package:libraryapp/features/penerbit_buku/data/models/models/res/penerbit_msg_response.dart';
import 'package:libraryapp/features/penerbit_buku/data/models/models/res/penerbit_response.dart';

abstract class PenerbitRepository {
  Future<PenerbitResponse> getAllPenerbit();
  Future<DetailPenerbitResponse> getDetailPenerbit({required String id});
  Future<PenerbitMsgResponse> createPenerbit({required CreatePenerbitReq request});
  Future<PenerbitMsgResponse> updatePenerbit({required PenerbitUpdateReq request});
  Future<PenerbitDeleteResponse> deletPenerbit({required String id});
}