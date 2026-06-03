import 'package:libraryapp/features/denda/data/models/models/req/create_denda_req.dart';
import 'package:libraryapp/features/denda/data/models/models/req/update_denda_req.dart';
import 'package:libraryapp/features/denda/data/models/models/res/Denda_msg_response.dart';
import 'package:libraryapp/features/denda/data/models/models/res/denda_response.dart';
import 'package:libraryapp/features/denda/data/models/models/res/detail_denda_response.dart';

abstract class DendaRepository {
  Future<DendaResponse> getAllDenda();
  Future<DetailDendaResponse> getDendaDetail({required String id});
  Future<DendaMsgResponse> createDenda({required CreateDendaReq request});
  Future<DendaMsgResponse> updateDenda({required UpdateDendaReq request});
  Future<DendaMsgResponse> deleteDenda({required String id});
}