import 'package:libraryapp/features/denda/data/datasource/denda_data_source.dart';
import 'package:libraryapp/features/denda/data/models/models/req/create_denda_req.dart';
import 'package:libraryapp/features/denda/data/models/models/req/update_denda_req.dart';
import 'package:libraryapp/features/denda/data/models/models/res/Denda_msg_response.dart';
import 'package:libraryapp/features/denda/data/models/models/res/denda_response.dart';
import 'package:libraryapp/features/denda/data/models/models/res/detail_denda_response.dart';
import 'package:libraryapp/features/denda/domain/denda_repository.dart';

class DendaRepositoryImpl implements DendaRepository{

  final DendaDataSource dataSource;

  DendaRepositoryImpl(this.dataSource);

  @override
  Future<DendaResponse> getAllDenda() {
    return dataSource.getAllDenda();
  }

  @override
  Future<DetailDendaResponse> getDendaDetail({required String id}) {
    return dataSource.getDendaDetail(id: id);
  }

  @override
  Future<DendaMsgResponse> createDenda({required CreateDendaReq request}) {
    return dataSource.createDenda(request: request);
  }

  @override
  Future<DendaMsgResponse> updateDenda({required UpdateDendaReq request}) {
    return dataSource.updateDenda(request: request);
  }

  @override
  Future<DendaMsgResponse> deleteDenda({required String id}) {
    return dataSource.deleteDenda(id: id);
  }


}