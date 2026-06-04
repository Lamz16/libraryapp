import 'package:libraryapp/features/peminjaman/data/models/models/req/create_peminjaman_req.dart';
import 'package:libraryapp/features/peminjaman/data/models/models/req/update_peminjaman_req.dart';
import 'package:libraryapp/features/peminjaman/data/models/models/res/peminjaman_detail_response.dart';
import 'package:libraryapp/features/peminjaman/data/models/models/res/peminjaman_id_response.dart';
import 'package:libraryapp/features/peminjaman/data/models/models/res/peminjaman_msg_response.dart';
import 'package:libraryapp/features/peminjaman/data/models/models/res/peminjaman_response.dart';

abstract class PeminjamanRepository {

  Future<PeminjamanResponse> getAllPeminjaman();
  Future<PeminjamanIdResponse> getPeminjamanId({required String id});
  Future<PeminjamanDetailResponse> getDetailPeminjaman({required String id});
  Future<PeminjamanMsgResponse> createPeminjaman({required CreatePeminjamanReq request});
  Future<PeminjamanMsgResponse> updatePeminjaman({required UpdatePeminjamanReq request});
  Future<PeminjamanMsgResponse> deletePeminjaman({required String id});

}