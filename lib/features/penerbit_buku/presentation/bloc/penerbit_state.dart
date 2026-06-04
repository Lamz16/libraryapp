part of 'penerbit_bloc.dart';

class PenerbitState {
  ResultState<PenerbitResponse> penerbits;
  ResultState<DetailPenerbitResponse> detail;
  ResultState<PenerbitMsgResponse> create;
  ResultState<PenerbitMsgResponse> update;
  ResultState<PenerbitDeleteResponse> delete;

  PenerbitState({
    required this.penerbits,
    required this.detail,
    required this.create,
    required this.update,
    required this.delete,
  });

  factory PenerbitState.initial(){
    return PenerbitState(penerbits: ResultNone(),
        detail: ResultNone(),
        create: ResultNone(),
        update: ResultNone(),
        delete: ResultNone()
    );
  }

  PenerbitState copyWith({
    ResultState<PenerbitResponse>? penerbits,
    ResultState<DetailPenerbitResponse>? detail,
    ResultState<PenerbitMsgResponse>? create,
    ResultState<PenerbitMsgResponse>? update,
    ResultState<PenerbitDeleteResponse>? delete
  }) {
    return PenerbitState(penerbits: penerbits ?? this.penerbits,
        detail: detail ?? this.detail,
        create: create ?? this.create,
        update: update ?? this.update,
        delete: delete ?? this.delete
    );
  }

}
