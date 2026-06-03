part of 'jenbu_bloc.dart';

sealed class JenbuEvent {}

final class GetAllJenbu extends JenbuEvent {}

final class CreateJenbu extends JenbuEvent {
  final CreateJenbuReq request;

  CreateJenbu({required this.request});
}

final class ResetCreateJenbu
    extends JenbuEvent {}

final class UpdateJenbu extends JenbuEvent{
  final UpdateJenbuReq request;
  UpdateJenbu({required this.request});
}

final class ResetUpdateJenbu extends JenbuEvent{}

final class DeleteJenbu extends JenbuEvent {
  final String id;

  DeleteJenbu({required this.id});
}

final class ResetDeleteJenbu extends JenbuEvent {}