part of 'denda_bloc.dart';

sealed class DendaEvent {}

final class GetAllDenda extends DendaEvent {}

final class GetDetailDenda extends DendaEvent {
  final String id;

  GetDetailDenda({required this.id});
}

final class CreateDenda extends DendaEvent {
  final CreateDendaReq request;

  CreateDenda({required this.request});
}

final class ResetCreate extends DendaEvent{}

final class UpdateDenda extends DendaEvent {
  final UpdateDendaReq request;

  UpdateDenda({required this.request});
}

final class ResetUpdate extends DendaEvent{}

final class DeleteDenda extends DendaEvent {
  final String id;

  DeleteDenda({required this.id});
}

final class ResetDelete extends DendaEvent{}
