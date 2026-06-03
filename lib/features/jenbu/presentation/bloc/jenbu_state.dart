part of 'jenbu_bloc.dart';

class JenbuState {
  final ResultState<JenisBukuResponse> jenbuState;
  final ResultState<JenbuResponse> createState;
  final ResultState<JenbuResponse> updateState;
  final ResultState<JenbuResponse> deleteState;

  JenbuState({
    required this.jenbuState,
    required this.createState,
    required this.updateState,
    required this.deleteState,
  });

  factory JenbuState.initial() {
    return JenbuState(
      jenbuState: ResultNone(),
      createState: ResultNone(),
      updateState: ResultNone(),
      deleteState: ResultNone(),
    );
  }

  JenbuState copyWith({
    ResultState<JenisBukuResponse>? jenbuState,
    ResultState<JenbuResponse>? createState,
    ResultState<JenbuResponse>? updateState,
    ResultState<JenbuResponse>? deletState
  }) {
    return JenbuState(
      jenbuState: jenbuState ?? this.jenbuState,
      createState: createState ?? this.createState,
      updateState: updateState ?? this.updateState,
      deleteState: deletState ?? this.deleteState,
    );
  }
}
