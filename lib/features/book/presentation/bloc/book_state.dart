part of 'book_bloc.dart';

class BookState {

  final ResultState<BukuResponse> bookState;

  BookState({
    required this.bookState,
  });

  factory BookState.initial() {
    return BookState(
      bookState: ResultNone(),
    );
  }

  BookState copyWith({
    ResultState<BukuResponse>? bookState,
  }) {

    return BookState(
      bookState:
      bookState ?? this.bookState,
    );

  }

}
