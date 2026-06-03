import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libraryapp/core/state/result_state.dart';
import 'package:libraryapp/features/denda/data/models/models/req/create_denda_req.dart';
import 'package:libraryapp/features/denda/data/models/models/req/update_denda_req.dart';
import 'package:libraryapp/features/denda/data/models/models/res/Denda_msg_response.dart';
import 'package:libraryapp/features/denda/data/models/models/res/denda_response.dart';
import 'package:libraryapp/features/denda/data/models/models/res/detail_denda_response.dart';
import 'package:libraryapp/features/denda/domain/denda_repository.dart';

part 'denda_state.dart';

part 'denda_event.dart';

class DendaBloc extends Bloc<DendaEvent, DendaState> {
  final DendaRepository repository;

  DendaBloc(this.repository) : super(DendaState.initial()) {
    on<GetAllDenda>(_getAllDenda);
    on<GetDetailDenda>(_getDetailDenda);
    on<CreateDenda>(_createDenda);
    on<ResetCreate>(_resetCreate);
    on<UpdateDenda>(_updateDenda);
    on<ResetUpdate>(_resetUpdate);
    on<DeleteDenda>(_deleteDenda);
    on<ResetDelete>(_resetDelete);
  }

  Future<void> _getAllDenda(GetAllDenda event, Emitter<DendaState> emit) async {
    emit(state.copyWith(denda: ResultLoading()));

    try {
      final response = await repository.getAllDenda();
      emit(state.copyWith(denda: ResultLoaded(response)));
    } catch (e) {
      emit(state.copyWith(denda: ResultError(e.toString())));
    }
  }

  Future<void> _getDetailDenda(
    GetDetailDenda event,
    Emitter<DendaState> emit,
  ) async {
    emit(state.copyWith(detail: ResultLoading()));

    try {
      final response = await repository.getDendaDetail(id: event.id);
      emit(state.copyWith(detail: ResultLoaded(response)));
    } catch (e) {
      emit(state.copyWith(detail: ResultError(e.toString())));
    }
  }

  Future<void> _createDenda(CreateDenda event, Emitter<DendaState> emit) async {
    emit(state.copyWith(create: ResultLoading()));

    try {
      final response = await repository.createDenda(request: event.request);
      emit(state.copyWith(create: ResultLoaded(response)));
    } catch (e) {
      emit(state.copyWith(create: ResultError(e.toString())));
    }
  }

  Future<void> _resetCreate(ResetCreate event, Emitter<DendaState> emit) async {
    emit(state.copyWith(create: ResultNone()));
  }

  Future<void> _updateDenda(UpdateDenda event, Emitter<DendaState> emit) async {
    emit(state.copyWith(update: ResultLoading()));

    try {
      final response = await repository.updateDenda(request: event.request);
      emit(state.copyWith(update: ResultLoaded(response)));
    } catch (e) {
      emit(state.copyWith(update: ResultError(e.toString())));
    }
  }

  Future<void> _resetUpdate(ResetUpdate event, Emitter<DendaState> emit) async{
    emit(state.copyWith(update: ResultNone()));
  }

  Future<void> _deleteDenda(DeleteDenda event, Emitter<DendaState> emit) async {
    emit(state.copyWith(delete: ResultLoading()));

    try{
      final response = await repository.deleteDenda(id: event.id);
      emit(state.copyWith(delete: ResultLoaded(response)));
    }catch (e){
      emit(state.copyWith(delete: ResultError(e.toString())));
    }
  }

  Future<void> _resetDelete(ResetDelete event, Emitter<DendaState> emit) async {
    emit(state.copyWith(delete: ResultNone()));
  }

}
