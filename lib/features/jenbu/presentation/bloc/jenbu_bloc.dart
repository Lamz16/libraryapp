import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libraryapp/features/jenbu/data/models/models/req/create_jenbu_req.dart';
import 'package:libraryapp/features/jenbu/data/models/models/req/update_jenbu_req.dart';
import 'package:libraryapp/features/jenbu/data/models/models/res/JenbuResponse.dart';
import 'package:libraryapp/features/jenbu/domain/jenis_repository.dart';

import '../../../../core/state/result_state.dart';
import '../../data/models/models/res/jenis_buku_response.dart';

part 'jenbu_event.dart';

part 'jenbu_state.dart';

class JenbuBloc extends Bloc<JenbuEvent, JenbuState> {
  final JenisRepository repository;

  JenbuBloc(this.repository) : super(JenbuState.initial()) {
    on<GetAllJenbu>(_getAllJenbu);
    on<CreateJenbu>(_createJenbu);
    on<ResetCreateJenbu>(_resetCreateJenbu);
    on<UpdateJenbu>(_updateJenbu);
    on<ResetUpdateJenbu>(_resetUpdateJenbu);
    on<DeleteJenbu>(_deleteJenbu);
    on<ResetDeleteJenbu>(_resetDeleteJenbu);
  }

  Future<void> _getAllJenbu(GetAllJenbu event, Emitter<JenbuState> emit) async {
    emit(state.copyWith(jenbuState: ResultLoading()));

    try {
      final response = await repository.getAllJenisBuku();
      emit(state.copyWith(jenbuState: ResultLoaded(response)));
    } catch (e) {
      emit(state.copyWith(jenbuState: ResultError(e.toString())));
    }
  }

  Future<void> _createJenbu(CreateJenbu event, Emitter<JenbuState> emit) async {
    emit(state.copyWith(createState: ResultLoading()));

    try {
      final response = await repository.createJenbu(request: event.request);
      emit(state.copyWith(createState: ResultLoaded(response)));
    } catch (e) {
      emit(state.copyWith(createState: ResultError(e.toString())));
    }
  }

  Future<void> _resetCreateJenbu(
    ResetCreateJenbu event,
    Emitter<JenbuState> emit,
  ) async {
    emit(state.copyWith(createState: ResultNone()));
  }

  Future<void> _updateJenbu(UpdateJenbu event, Emitter<JenbuState> emit) async {
    emit(state.copyWith(updateState: ResultLoading()));

    try {
      final response = await repository.updateJenbu(request: event.request);
      emit(state.copyWith(updateState: ResultLoaded(response)));
    } catch (e) {
      emit(state.copyWith(updateState: ResultError(e.toString())));
    }
  }

  Future<void> _resetUpdateJenbu(
    ResetUpdateJenbu event,
    Emitter<JenbuState> emit,
  ) async {
    emit(state.copyWith(updateState: ResultNone()));
  }

  Future<void> _deleteJenbu(DeleteJenbu event, Emitter<JenbuState> emit) async {
    emit(state.copyWith(deletState: ResultLoading()));

    try {
      final response = await repository.deleteJenbu(id: event.id);
      emit(state.copyWith(deletState: ResultLoaded(response)));
    } catch (e) {
      emit(state.copyWith(deletState: ResultError(e.toString())));
    }
  }

  Future<void> _resetDeleteJenbu(
    ResetDeleteJenbu event,
    Emitter<JenbuState> emit,
  ) async {
    emit(state.copyWith(deletState: ResultNone()));
  }
}
