import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libraryapp/core/state/result_state.dart';
import 'package:libraryapp/features/penerbit_buku/data/models/models/req/create_penerbit_req.dart';
import 'package:libraryapp/features/penerbit_buku/data/models/models/req/penerbit_update_req.dart';
import 'package:libraryapp/features/penerbit_buku/data/models/models/res/detail_penerbit_response.dart';
import 'package:libraryapp/features/penerbit_buku/data/models/models/res/penerbit_delete_response.dart';
import 'package:libraryapp/features/penerbit_buku/data/models/models/res/penerbit_msg_response.dart';
import 'package:libraryapp/features/penerbit_buku/data/models/models/res/penerbit_response.dart';
import 'package:libraryapp/features/penerbit_buku/domain/penerbit_repository.dart';

part 'penerbit_event.dart';

part 'penerbit_state.dart';

class PenerbitBloc extends Bloc<PenerbitEvent, PenerbitState> {
  final PenerbitRepository repository;

  PenerbitBloc(this.repository) : super(PenerbitState.initial()) {
    on<GetAllPenerbit>(_getAllPenerbit);
    on<GetDetailPenerbit>(_getDetailPenerbit);

    on<CreatePenerbit>(_createPenerbit);
    on<UpdatePenerbit>(_updatePenerbit);
    on<DeletePenerbit>(_deletePenerbit);

    on<ResetCreate>(_resetCreate);
    on<ResetUpdate>(_resetUpdate);
    on<ResetDelete>(_resetDelete);
  }

  Future<void> _getAllPenerbit(
    GetAllPenerbit event,
    Emitter<PenerbitState> emit,
  ) async {
    emit(state.copyWith(penerbits: ResultLoading()));

    try {
      final response = await repository.getAllPenerbit();

      emit(state.copyWith(penerbits: ResultLoaded(response)));
    } catch (e) {
      emit(state.copyWith(penerbits: ResultError(e.toString())));
    }
  }

  Future<void> _getDetailPenerbit(
    GetDetailPenerbit event,
    Emitter<PenerbitState> emit,
  ) async {
    emit(state.copyWith(detail: ResultLoading()));

    try {
      final response = await repository.getDetailPenerbit(id: event.id);

      emit(state.copyWith(detail: ResultLoaded(response)));
    } catch (e) {
      emit(state.copyWith(detail: ResultError(e.toString())));
    }
  }

  Future<void> _createPenerbit(
    CreatePenerbit event,
    Emitter<PenerbitState> emit,
  ) async {
    emit(state.copyWith(create: ResultLoading()));

    try {
      final response = await repository.createPenerbit(request: event.request);

      emit(state.copyWith(create: ResultLoaded(response)));
    } catch (e) {
      emit(state.copyWith(create: ResultError(e.toString())));
    }
  }

  Future<void> _updatePenerbit(
    UpdatePenerbit event,
    Emitter<PenerbitState> emit,
  ) async {
    emit(state.copyWith(update: ResultLoading()));

    try {
      final response = await repository.updatePenerbit(request: event.request);

      emit(state.copyWith(update: ResultLoaded(response)));
    } catch (e) {
      emit(state.copyWith(update: ResultError(e.toString())));
    }
  }

  Future<void> _deletePenerbit(
    DeletePenerbit event,
    Emitter<PenerbitState> emit,
  ) async {
    emit(state.copyWith(delete: ResultLoading()));

    try {
      final response = await repository.deletPenerbit(id: event.id);

      emit(state.copyWith(delete: ResultLoaded(response)));
    } catch (e) {
      emit(state.copyWith(delete: ResultError(e.toString())));
    }
  }

  Future<void> _resetCreate(
    ResetCreate event,
    Emitter<PenerbitState> emit,
  ) async {
    emit(state.copyWith(create: ResultNone()));
  }

  Future<void> _resetUpdate(
    ResetUpdate event,
    Emitter<PenerbitState> emit,
  ) async {
    emit(state.copyWith(update: ResultNone()));
  }

  Future<void> _resetDelete(
    ResetDelete event,
    Emitter<PenerbitState> emit,
  ) async {
    emit(state.copyWith(delete: ResultNone()));
  }
}
