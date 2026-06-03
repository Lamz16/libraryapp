import 'package:libraryapp/features/denda/data/models/models/res/denda_response.dart';

class DetailDendaResponse {
  final DendaModel data;

  DetailDendaResponse({required this.data});

  factory DetailDendaResponse.fromJson(Map<String, dynamic> json) {
    return DetailDendaResponse(data: DendaModel.fromJson(json['data']));
  }
}
