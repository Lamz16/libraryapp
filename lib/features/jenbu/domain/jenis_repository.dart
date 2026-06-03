import 'package:libraryapp/features/jenbu/data/models/models/req/update_jenbu_req.dart';
import 'package:libraryapp/features/jenbu/data/models/models/res/JenbuResponse.dart';
import 'package:libraryapp/features/jenbu/data/models/models/res/jenis_buku_response.dart';

import '../data/models/models/req/create_jenbu_req.dart';

abstract class JenisRepository {
  Future<JenisBukuResponse> getAllJenisBuku();
  Future<JenbuResponse> createJenbu({required CreateJenbuReq request});
  Future<JenbuResponse> updateJenbu({required UpdateJenbuReq request});
  Future<JenbuResponse> deleteJenbu({required String id});
}