import 'package:libraryapp/features/jenbu/data/datasource/jenbu_data_source.dart';
import 'package:libraryapp/features/jenbu/data/models/models/req/create_jenbu_req.dart';
import 'package:libraryapp/features/jenbu/data/models/models/req/update_jenbu_req.dart';
import 'package:libraryapp/features/jenbu/data/models/models/res/JenbuResponse.dart';
import 'package:libraryapp/features/jenbu/data/models/models/res/jenis_buku_response.dart';
import 'package:libraryapp/features/jenbu/domain/jenis_repository.dart';

class JenisRepositoryImpl implements JenisRepository{
  final JenbuDataSource dataSource;
  JenisRepositoryImpl(this.dataSource);

  @override
  Future<JenisBukuResponse> getAllJenisBuku() {
    return dataSource.getAllJenbu();
  }

  @override
  Future<JenbuResponse> createJenbu({required CreateJenbuReq request}) {
    return dataSource.createJenbu(request: request);
  }

  @override
  Future<JenbuResponse> deleteJenbu({required String id}) {
    return dataSource.deleteJenbu(id: id);
  }

  @override
  Future<JenbuResponse> updateJenbu({required UpdateJenbuReq request}) {
   return dataSource.updateJenbu(request: request);
  }

}