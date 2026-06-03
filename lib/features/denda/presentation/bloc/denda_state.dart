part of 'denda_bloc.dart';

class DendaState {
  ResultState<DendaResponse> denda;
  ResultState<DetailDendaResponse> detail;
  ResultState<DendaMsgResponse> create;
  ResultState<DendaMsgResponse> update;
  ResultState<DendaMsgResponse> delete;

  DendaState({
    required this.denda,
    required this.detail,
    required this.create,
    required this.update,
    required this.delete,
  });

  factory DendaState.initial() {
    return DendaState(
      denda: ResultNone(),
      detail: ResultNone(),
      create: ResultNone(),
      update: ResultNone(),
      delete: ResultNone(),
    );
  }

  DendaState copyWith({
    ResultState<DendaResponse>? denda,
    ResultState<DetailDendaResponse>? detail,
    ResultState<DendaMsgResponse>? create,
    ResultState<DendaMsgResponse>? update,
    ResultState<DendaMsgResponse>? delete
  }) {
    return DendaState(
      denda: denda ?? this.denda,
      detail: detail ?? this.detail,
      create: create ?? this.create,
      update: update ?? this.update,
      delete: delete ?? this.delete,
    );
  }
}
