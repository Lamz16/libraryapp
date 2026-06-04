import 'package:libraryapp/features/peminjaman/data/models/models/res/peminjaman_response.dart';

class PeminjamanIdResponse {
  final Peminjaman data;

  PeminjamanIdResponse({required this.data});

  factory PeminjamanIdResponse.fromJson(Map<String, dynamic> json) {
    return PeminjamanIdResponse(data: Peminjaman.fromJson(json['data']));
  }
}
