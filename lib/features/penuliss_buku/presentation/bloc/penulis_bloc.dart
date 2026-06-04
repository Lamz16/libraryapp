import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libraryapp/features/penuliss_buku/domain/penulis_repository.dart';
import '../../../../core/state/result_state.dart';
import '../../data/models/models/req/create_penulis_req.dart';
import '../../data/models/models/req/update_penulis_req.dart';
import '../../data/models/models/res/detail_penulis_response.dart';
import '../../data/models/models/res/penulis_delete_response.dart';
import '../../data/models/models/res/penulis_msg_response.dart';
import '../../data/models/models/res/penulis_response.dart';


part 'penulis_event.dart';

part 'penulis_state.dart';

class PenulisBloc extends Bloc<PenulisEvent, PenulisState> {
  final PenulisRepository repository;

  PenulisBloc(this.repository) : super(PenulisState.initial()) {

    on<GetPenulis>(_getAllPenulis);
    on<GetPenulisId>(_getPenulisById);

    on<CreatePenulis>(_createPenulis);
    on<UpdatePenulis>(_updatePenulis);
    on<DeletePenulis>(_deletePenulis);

    on<ResetCreate>(_resetCreate);
    on<ResetUpdate>(_resetUpdate);
    on<ResetDelete>(_resetDelete);
  }

  Future<void> _getAllPenulis(
      GetPenulis event,
      Emitter<PenulisState> emit,
      ) async {
    emit(state.copyWith(penulis: ResultLoading()));

    try {
      final response = await repository.getAllPenulis();

      emit(
        state.copyWith(
          penulis: ResultLoaded(response),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          penulis: ResultError(e.toString()),
        ),
      );
    }
  }

  Future<void> _getPenulisById(
      GetPenulisId event,
      Emitter<PenulisState> emit,
      ) async {
    emit(state.copyWith(detailPenulis: ResultLoading()));

    try {
      final response = await repository.getPenulisById(
        id: event.id,
      );

      emit(
        state.copyWith(
          detailPenulis: ResultLoaded(response),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          detailPenulis: ResultError(e.toString()),
        ),
      );
    }
  }

  Future<void> _createPenulis(
      CreatePenulis event,
      Emitter<PenulisState> emit,
      ) async {
    emit(state.copyWith(createPenulis: ResultLoading()));

    try {
      final response = await repository.createPenulis(
        request: event.req,
      );

      emit(
        state.copyWith(
          createPenulis: ResultLoaded(response),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          createPenulis: ResultError(e.toString()),
        ),
      );
    }
  }

  Future<void> _updatePenulis(
      UpdatePenulis event,
      Emitter<PenulisState> emit,
      ) async {
    emit(state.copyWith(updatePenulis: ResultLoading()));

    try {
      final response = await repository.updatePenulis(
        request: event.req,
      );

      emit(
        state.copyWith(
          updatePenulis: ResultLoaded(response),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          updatePenulis: ResultError(e.toString()),
        ),
      );
    }
  }

  Future<void> _deletePenulis(
      DeletePenulis event,
      Emitter<PenulisState> emit,
      ) async {
    emit(state.copyWith(deletePenulis: ResultLoading()));

    try {
      final response = await repository.deletePenulis(
        id: event.id,
      );

      emit(
        state.copyWith(
          deletePenulis: ResultLoaded(response),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          deletePenulis: ResultError(e.toString()),
        ),
      );
    }
  }

  Future<void> _resetCreate(
      ResetCreate event,
      Emitter<PenulisState> emit,
      ) async {
    emit(
      state.copyWith(
        createPenulis: ResultNone(),
      ),
    );
  }

  Future<void> _resetUpdate(
      ResetUpdate event,
      Emitter<PenulisState> emit,
      ) async {
    emit(
      state.copyWith(
        updatePenulis: ResultNone(),
      ),
    );
  }

  Future<void> _resetDelete(
      ResetDelete event,
      Emitter<PenulisState> emit,
      ) async {
    emit(
      state.copyWith(
        deletePenulis: ResultNone(),
      ),
    );
  }
}
