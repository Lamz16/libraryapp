import 'package:libraryapp/features/jenbu/data/datasource/jenbu_data_source.dart';
import 'package:libraryapp/features/jenbu/data/models/models/req/create_jenbu_req.dart';
import 'package:libraryapp/features/jenbu/data/models/models/res/CreateJenbuRes.dart';
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
  Future<CreateJenbuRes> createJenbu({required CreateJenbuReq request}) {
    return dataSource.createJenbu(request: request);
  }

}