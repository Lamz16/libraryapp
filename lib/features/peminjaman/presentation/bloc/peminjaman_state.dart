part of 'peminjaman_bloc.dart';

class PeminjamanState {
  final ResultState<PeminjamanResponse> peminjamanState;
  final ResultState<PeminjamanIdResponse> peminjamanIdState;
  final ResultState<PeminjamanDetailResponse> detailState;
  final ResultState<PeminjamanMsgResponse> createState;
  final ResultState<PeminjamanMsgResponse> updateState;
  final ResultState<PeminjamanMsgResponse> deleteState;

  PeminjamanState({
    required this.peminjamanState,
    required this.peminjamanIdState,
    required this.detailState,
    required this.createState,
    required this.updateState,
    required this.deleteState
  });

  factory PeminjamanState.initial(){
    return PeminjamanState(
        peminjamanState: ResultNone(),
        peminjamanIdState: ResultNone(),
        detailState: ResultNone(),
        createState: ResultNone(),
        updateState: ResultNone(),
        deleteState: ResultNone()
    );
  }

  PeminjamanState copyWith({
    ResultState<PeminjamanResponse>? peminjamanState,
    ResultState<PeminjamanIdResponse>? peminjamanIdState,
    ResultState<PeminjamanDetailResponse>? detailState,
    ResultState<PeminjamanMsgResponse>? createState,
    ResultState<PeminjamanMsgResponse>? updateState,
    ResultState<PeminjamanMsgResponse>? deleteState,
  }) {
    return PeminjamanState(
        peminjamanState: peminjamanState ?? this.peminjamanState,
        peminjamanIdState: peminjamanIdState ?? this.peminjamanIdState,
        detailState: detailState ?? this.detailState,
        createState: createState ?? this.createState,
        updateState: updateState ?? this.updateState,
        deleteState: deleteState ?? this.deleteState);
  }

}