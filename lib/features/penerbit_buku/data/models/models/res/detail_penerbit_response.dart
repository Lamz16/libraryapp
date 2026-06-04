import 'package:libraryapp/features/penerbit_buku/data/models/models/res/penerbit_response.dart';

class DetailPenerbitResponse {
  final Datum data;
  
  DetailPenerbitResponse({required this.data});

  factory DetailPenerbitResponse.fromJson(Map<String,dynamic> json){
    return DetailPenerbitResponse(data: Datum.fromJson(json['data']));
  }
  
}