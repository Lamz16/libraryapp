import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libraryapp/features/book/data/models/res/detail_buku_response.dart';
import 'package:libraryapp/features/book/domain/book_repository.dart';
import '../../../../core/state/result_state.dart';
import '../../data/models/res/buku_response.dart';

part 'book_state.dart';

part 'book_event.dart';

class BookBloc extends Bloc<BookEvent, BookState> {

  final BookRepository repository;

  BookBloc(this.repository)
      : super(BookState.initial()) {

    on<GetAllBookEvent>(_getAllBook);
    on<GetBookByDetail>(_getBookById);

  }

  Future<void> _getAllBook(
      GetAllBookEvent event,
      Emitter<BookState> emit,
      ) async {

    emit(
      state.copyWith(
        bookState: ResultLoading(),
      ),
    );

    try {

      final response =
      await repository.getAllBook();

      emit(
        state.copyWith(
          bookState: ResultLoaded(response),
        ),
      );

    } catch (e) {

      emit(
        state.copyWith(
          bookState: ResultError(
            e.toString(),
          ),
        ),
      );

    }

  }

  Future<void> _getBookById(
      GetBookByDetail event,
      Emitter<BookState> emit,
      ) async {

    emit(
      state.copyWith(
        detailBookState: ResultLoading()
      )
    );
    
    try{
      final data = await repository.getBookById(id: event.id);
      emit(
        state.copyWith(
          detailBookState: ResultLoaded(data)
        )
      );
    }catch(e){

      emit(
        state.copyWith(
          detailBookState: ResultError(e.toString())
        )
      );

    }

  }

}
