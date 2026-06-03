import 'package:libraryapp/features/jenbu/data/models/models/res/jenis_buku_response.dart';

class DetailJenisResponse {
  final JenisBuku data;

  DetailJenisResponse({required this.data});

  factory DetailJenisResponse.fromJson(Map<String, dynamic> json) {
    return DetailJenisResponse(data: JenisBuku.fromJson(json['data']));
  }
}
