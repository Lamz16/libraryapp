part of 'jenbu_bloc.dart';

class JenbuState {
  final ResultState<JenisBukuResponse> jenbuState;
  final ResultState<DetailJenisResponse> detailState;
  final ResultState<JenbuResponse> createState;
  final ResultState<JenbuResponse> updateState;
  final ResultState<JenbuResponse> deleteState;

  JenbuState({
    required this.jenbuState,
    required this.detailState,
    required this.createState,
    required this.updateState,
    required this.deleteState,
  });

  factory JenbuState.initial() {
    return JenbuState(
      jenbuState: ResultNone(),
      detailState: ResultNone(),
      createState: ResultNone(),
      updateState: ResultNone(),
      deleteState: ResultNone(),
    );
  }

  JenbuState copyWith({
    ResultState<JenisBukuResponse>? jenbuState,
    ResultState<DetailJenisResponse>? detailState,
    ResultState<JenbuResponse>? createState,
    ResultState<JenbuResponse>? updateState,
    ResultState<JenbuResponse>? deletState
  }) {
    return JenbuState(
      jenbuState: jenbuState ?? this.jenbuState,
      detailState: detailState ?? this.detailState,
      createState: createState ?? this.createState,
      updateState: updateState ?? this.updateState,
      deleteState: deletState ?? this.deleteState,
    );
  }
}
