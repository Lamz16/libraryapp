import 'package:libraryapp/features/jenbu/data/models/models/res/CreateJenbuRes.dart';
import 'package:libraryapp/features/jenbu/data/models/models/res/jenis_buku_response.dart';

import '../data/models/models/req/create_jenbu_req.dart';

abstract class JenisRepository {
  Future<JenisBukuResponse> getAllJenisBuku();
  Future<CreateJenbuRes> createJenbu({required CreateJenbuReq request});
}