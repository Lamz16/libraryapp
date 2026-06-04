part of 'penerbit_bloc.dart';

sealed class PenerbitEvent {}

final class GetAllPenerbit extends PenerbitEvent{}

final class GetDetailPenerbit extends PenerbitEvent{
  final String id;

  GetDetailPenerbit({required this.id});
}

final class CreatePenerbit extends PenerbitEvent{
  final CreatePenerbitReq request;

  CreatePenerbit({required this.request});
}

final class UpdatePenerbit extends PenerbitEvent{
  final PenerbitUpdateReq request;

  UpdatePenerbit({required this.request});
}

final class DeletePenerbit extends PenerbitEvent{
  final String id;

  DeletePenerbit({required this.id});
}

final class ResetCreate extends PenerbitEvent{}

final class ResetUpdate extends PenerbitEvent{}

final class ResetDelete extends PenerbitEvent{}