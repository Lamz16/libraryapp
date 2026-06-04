import 'package:libraryapp/features/peminjaman/data/datasource/peminjaman_data_source.dart';
import 'package:libraryapp/features/peminjaman/data/models/models/req/create_peminjaman_req.dart';
import 'package:libraryapp/features/peminjaman/data/models/models/req/update_peminjaman_req.dart';
import 'package:libraryapp/features/peminjaman/data/models/models/res/peminjaman_detail_response.dart';
import 'package:libraryapp/features/peminjaman/data/models/models/res/peminjaman_id_response.dart';
import 'package:libraryapp/features/peminjaman/data/models/models/res/peminjaman_msg_response.dart';
import 'package:libraryapp/features/peminjaman/data/models/models/res/peminjaman_response.dart';
import 'package:libraryapp/features/peminjaman/domain/peminjaman_repository.dart';

class PeminjamanRepositoryImpl implements PeminjamanRepository{
  final PeminjamanDataSource dataSource;

  PeminjamanRepositoryImpl(this.dataSource);

  @override
  Future<PeminjamanMsgResponse> createPeminjaman({required CreatePeminjamanReq request}) {
    return dataSource.createPeminjaman(request: request);
  }

  @override
  Future<PeminjamanMsgResponse> deletePeminjaman({required String id}) {
    return dataSource.deletePeminjaman(id: id);
  }

  @override
  Future<PeminjamanResponse> getAllPeminjaman() {
    return dataSource.getAllPeminjaman();
  }

  @override
  Future<PeminjamanDetailResponse> getDetailPeminjaman({required String id}) {
    return dataSource.getDetailPeminjaman(id: id);
  }

  @override
  Future<PeminjamanIdResponse> getPeminjamanId({required String id}) {
    return dataSource.getPeminjamanId(id: id);
  }

  @override
  Future<PeminjamanMsgResponse> updatePeminjaman({required UpdatePeminjamanReq request}) {
    return dataSource.updatePeminjaman(request: request);
  }

}