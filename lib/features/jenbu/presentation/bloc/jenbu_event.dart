part of 'jenbu_bloc.dart';

sealed class JenbuEvent {}

final class GetAllJenbu extends JenbuEvent {}

final class CreateJenbu extends JenbuEvent {
  final CreateJenbuReq request;

  CreateJenbu({required this.request});
}

final class ResetCreateJenbu
    extends JenbuEvent {}