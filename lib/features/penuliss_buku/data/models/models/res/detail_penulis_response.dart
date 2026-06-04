

import 'package:libraryapp/features/penuliss_buku/data/models/models/res/penulis_response.dart';

class DetailPenulisResponse {
  final Datum data;
  
  DetailPenulisResponse({required this.data});
  
  
  factory DetailPenulisResponse.fromJson(Map<String,dynamic> json){
    return DetailPenulisResponse(data: Datum.fromJson(json['data']));
  }
}