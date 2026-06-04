
part of 'penulis_bloc.dart';

sealed class PenulisEvent {}

final class GetPenulis extends PenulisEvent{}
final class GetPenulisId extends PenulisEvent{
  final String id;
  
  GetPenulisId({required this.id});
}
final class CreatePenulis extends PenulisEvent{
  final CreatePenulisReq req;
  
  CreatePenulis({required this.req});
}
final class UpdatePenulis extends PenulisEvent{
  final UpdatePenulisReq req;

  UpdatePenulis({required this.req});
}
final class DeletePenulis extends PenulisEvent{
  final String id;

  DeletePenulis({required this.id});
}

final class ResetCreate extends PenulisEvent{}
final class ResetUpdate extends PenulisEvent{}
final class ResetDelete extends PenulisEvent{}

