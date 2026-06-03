part of 'book_bloc.dart';

class BookState {

  final ResultState<BukuResponse> bookState;
  final ResultState<DetailBukuResponse> detailBookState;

  BookState({
    required this.bookState,
    required this.detailBookState,
  });

  factory BookState.initial() {
    return BookState(
      bookState: ResultNone(),
      detailBookState: ResultNone(),
    );
  }

  BookState copyWith({
    ResultState<BukuResponse>? bookState,
    ResultState<DetailBukuResponse>? detailBookState,
  }) {

    return BookState(
      bookState:
      bookState ?? this.bookState,
      detailBookState: detailBookState ?? this.detailBookState,
    );

  }

}
