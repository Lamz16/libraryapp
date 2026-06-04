import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libraryapp/core/state/result_state.dart';
import 'package:libraryapp/features/peminjaman/data/models/models/res/peminjaman_detail_response.dart';
import 'package:libraryapp/features/peminjaman/data/models/models/res/peminjaman_id_response.dart';
import 'package:libraryapp/features/peminjaman/data/models/models/res/peminjaman_msg_response.dart';
import 'package:libraryapp/features/peminjaman/data/models/models/res/peminjaman_response.dart';
import 'package:libraryapp/features/peminjaman/domain/peminjaman_repository.dart';

import '../../data/models/models/req/create_peminjaman_req.dart';
import '../../data/models/models/req/update_peminjaman_req.dart';

part 'peminjaman_event.dart';
part 'peminjaman_state.dart';

class PeminjamanBloc extends Bloc<PeminjamanEvent, PeminjamanState>{
  final PeminjamanRepository repository;

  PeminjamanBloc(this.repository) : super(PeminjamanState.initial()) {
   on<GetAllPeminjaman>(_getAllPeminjaman);
   on<GetByIdPeminjaman>(_getPeminjamanId);
   on<GetDetailPeminjaman>(_getPeminjamanDetail);
   on<CreatePeminjaman>(_createPeminjaman);
   on<UpdatePeminjaman>(_updatePeminjaman);
   on<DeletePeminjaman>(_deletePeminjaman);
   on<ResetCreate>(_resetCreate);
   on<ResetUpdate>(_resetUpdate);
   on<ResetDelete>(_resetDelete);
  }

  Future<void> _getAllPeminjaman(GetAllPeminjaman event, Emitter<PeminjamanState> emit) async{
    emit(state.copyWith(peminjamanState: ResultLoading()));

    try{
      final response = await repository.getAllPeminjaman();
      emit(state.copyWith(peminjamanState: ResultLoaded(response)));
    }catch(e){
      emit(state.copyWith(peminjamanState: ResultError(e.toString())));
    }
  }

  Future<void> _getPeminjamanId(GetByIdPeminjaman event, Emitter<PeminjamanState> emit) async{
    emit(state.copyWith(peminjamanIdState: ResultLoading()));

    try{
      final response = await repository.getPeminjamanId(id: event.id);
      emit(state.copyWith(peminjamanIdState: ResultLoaded(response)));
    }catch(e){
      emit(state.copyWith(peminjamanIdState: ResultError(e.toString())));
    }
  }

  Future<void> _getPeminjamanDetail(GetDetailPeminjaman event, Emitter<PeminjamanState> emit) async{
    emit(state.copyWith(detailState: ResultLoading()));

    try{
      final response = await repository .getDetailPeminjaman(id: event.id);
      emit(state.copyWith(detailState: ResultLoaded(response)));
    }catch(e){
      emit(state.copyWith(detailState: ResultError(e.toString())));
    }
  }

  Future<void> _createPeminjaman(CreatePeminjaman event, Emitter<PeminjamanState> emit) async{
    emit(state.copyWith(createState: ResultLoading()));

    try{
      final response = await repository.createPeminjaman(request: event.request);
      emit(state.copyWith(createState: ResultLoaded(response)));
    }catch(e){
      print("${event.request.idAnggota}");
      print("${event.request.jaminan}");
      print("${event.request.tglHrsKembali}");
      print("${event.request.tglPinjam}");
      emit(state.copyWith(createState: ResultError(e.toString())));
    }
  }

  Future<void> _updatePeminjaman(UpdatePeminjaman event, Emitter<PeminjamanState> emit) async{
    emit(state.copyWith(updateState: ResultLoading()));

    try{
      final response = await repository.updatePeminjaman(request: event.request);
      emit(state.copyWith(updateState: ResultLoaded(response)));
    }catch(e){
      emit(state.copyWith(updateState: ResultError(e.toString())));
    }
  }

  Future<void> _deletePeminjaman(DeletePeminjaman event, Emitter<PeminjamanState> emit) async {
    emit(state.copyWith(deleteState: ResultLoading()));

    try{
      final response = await repository.deletePeminjaman(id: event.id);
      emit(state.copyWith(deleteState: ResultLoaded(response)));
    }on DioException catch(e){
      emit(state.copyWith(deleteState: ResultError(e.message ?? 'Server tidak dapat melayani')));
    }catch(e){
      emit(state.copyWith(deleteState: ResultError(e.toString())));
    }
  }

  Future<void> _resetCreate(ResetCreate event, Emitter<PeminjamanState> emit) async{
    emit(state.copyWith(createState: ResultNone()));
  }

  Future<void> _resetUpdate(ResetUpdate event, Emitter<PeminjamanState> emit) async {
    emit(state.copyWith(updateState: ResultNone()));
  }

  Future<void> _resetDelete(ResetDelete event, Emitter<PeminjamanState> emit) async{
    emit(state.copyWith(deleteState: ResultNone()));
  }

}