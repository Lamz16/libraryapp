part of 'penulis_bloc.dart';

class PenulisState {
  ResultState<PenulisResponse> penulis;
  ResultState<DetailPenulisResponse> detailPenulis;
  ResultState<PenulisMsgResponse> createPenulis;
  ResultState<PenulisMsgResponse> updatePenulis;
  ResultState<PenulisDeleteResponse> deletePenulis;

  PenulisState({
    required this.penulis,
    required this.detailPenulis,
    required this.createPenulis,
    required this.updatePenulis,
    required this.deletePenulis,
  });

  factory PenulisState.initial() {
    return PenulisState(
      penulis: ResultNone(),
      detailPenulis: ResultNone(),
      createPenulis: ResultNone(),
      updatePenulis: ResultNone(),
      deletePenulis: ResultNone(),
    );
  }

  PenulisState copyWith({
    ResultState<PenulisResponse>? penulis,
    ResultState<DetailPenulisResponse>? detailPenulis,
    ResultState<PenulisMsgResponse>? createPenulis,
    ResultState<PenulisMsgResponse>? updatePenulis,
    ResultState<PenulisDeleteResponse>? deletePenulis,
  }) {
    return PenulisState(
      penulis: penulis ?? this.penulis,
      detailPenulis: detailPenulis ?? this.detailPenulis,
      createPenulis: createPenulis ?? this.createPenulis,
      updatePenulis: updatePenulis ?? this.updatePenulis,
      deletePenulis: deletePenulis ?? this.deletePenulis,
    );
  }
}
