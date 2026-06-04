import 'package:libraryapp/features/penerbit_buku/data/datasource/penerbit_datasource.dart';
import 'package:libraryapp/features/penerbit_buku/data/models/models/req/create_penerbit_req.dart';
import 'package:libraryapp/features/penerbit_buku/data/models/models/req/penerbit_update_req.dart';
import 'package:libraryapp/features/penerbit_buku/data/models/models/res/detail_penerbit_response.dart';
import 'package:libraryapp/features/penerbit_buku/data/models/models/res/penerbit_delete_response.dart';
import 'package:libraryapp/features/penerbit_buku/data/models/models/res/penerbit_msg_response.dart';
import 'package:libraryapp/features/penerbit_buku/data/models/models/res/penerbit_response.dart';
import 'package:libraryapp/features/penerbit_buku/domain/penerbit_repository.dart';

class PenerbitRepositoryImpl implements PenerbitRepository {
  final PenerbitDatasource datasource;

  PenerbitRepositoryImpl(this.datasource);

  @override
  Future<PenerbitMsgResponse> createPenerbit({
    required CreatePenerbitReq request,
  }) {
    return datasource.createPenerbit(request: request);
  }

  @override
  Future<PenerbitDeleteResponse> deletPenerbit({required String id}) {
    return datasource.deletePenerbit(id: id);
  }

  @override
  Future<PenerbitResponse> getAllPenerbit() {
    return datasource.getAllPenerbit();
  }

  @override
  Future<DetailPenerbitResponse> getDetailPenerbit({required String id}) {
    return datasource.getDetailPenerbit(id: id);
  }

  @override
  Future<PenerbitMsgResponse> updatePenerbit({
    required PenerbitUpdateReq request,
  }) {
    return datasource.updatePenerbit(request: request);
  }
}
