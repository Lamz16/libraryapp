part of 'jenbu_bloc.dart';

class JenbuState {
  final ResultState<JenisBukuResponse> jenbuState;
  final ResultState<CreateJenbuRes> createState;

  JenbuState({required this.jenbuState, required this.createState});

  factory JenbuState.initial() {
    return JenbuState(jenbuState: ResultNone(), createState: ResultNone());
  }

  JenbuState copyWith({
    ResultState<JenisBukuResponse>? jenbuState,
    ResultState<CreateJenbuRes>? createState,
  }) {
    return JenbuState(
      jenbuState: jenbuState ?? this.jenbuState,
      createState: createState ?? this.createState,
    );
  }
}
