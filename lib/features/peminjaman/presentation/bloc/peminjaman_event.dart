part of 'peminjaman_bloc.dart';

sealed class PeminjamanEvent {}

final class GetAllPeminjaman extends PeminjamanEvent{}
final class GetByIdPeminjaman extends PeminjamanEvent {
  final String id;

  GetByIdPeminjaman({required this.id});
}
final class GetDetailPeminjaman extends PeminjamanEvent {
  final String id;

  GetDetailPeminjaman({required this.id});
}
final class CreatePeminjaman extends PeminjamanEvent {
  final CreatePeminjamanReq request;

  CreatePeminjaman({required this.request});
}

final class UpdatePeminjaman extends PeminjamanEvent {
  final UpdatePeminjamanReq request;

  UpdatePeminjaman({required this.request});
}

final class DeletePeminjaman extends PeminjamanEvent{
  final String id;

  DeletePeminjaman({required this.id});
}

final class ResetCreate extends PeminjamanEvent{}
final class ResetUpdate extends PeminjamanEvent{}
final class ResetDelete extends PeminjamanEvent{}