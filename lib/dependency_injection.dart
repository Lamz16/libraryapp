import 'package:dio/dio.dart';
import 'package:libraryapp/features/auth/data/datasource/auth_data_source.dart';
import 'package:libraryapp/features/book/data/datasource/book_data_source.dart';
import 'package:libraryapp/features/book/data/repository/book_repository_impl.dart';
import 'package:libraryapp/features/book/domain/book_repository.dart';
import 'package:libraryapp/features/book/presentation/bloc/book_bloc.dart';
import 'package:libraryapp/features/denda/data/datasource/denda_data_source.dart';
import 'package:libraryapp/features/denda/data/repository/denda_repository_impl.dart';
import 'package:libraryapp/features/denda/domain/denda_repository.dart';
import 'package:libraryapp/features/denda/presentation/bloc/denda_bloc.dart';
import 'package:libraryapp/features/jenbu/data/datasource/jenbu_data_source.dart';
import 'package:libraryapp/features/jenbu/data/repository/jenis_repository_impl.dart';
import 'package:libraryapp/features/jenbu/domain/jenis_repository.dart';
import 'package:libraryapp/features/jenbu/presentation/bloc/jenbu_bloc.dart';
import 'package:libraryapp/features/peminjaman/data/datasource/peminjaman_data_source.dart';
import 'package:libraryapp/features/peminjaman/data/repository/peminjaman_repository_impl.dart';
import 'package:libraryapp/features/peminjaman/domain/peminjaman_repository.dart';
import 'package:libraryapp/features/peminjaman/presentation/bloc/peminjaman_bloc.dart';
import 'package:libraryapp/features/penerbit_buku/data/datasource/penerbit_datasource.dart';
import 'package:libraryapp/features/penerbit_buku/data/repository/penerbit_repository_impl.dart';
import 'package:libraryapp/features/penerbit_buku/domain/penerbit_repository.dart';
import 'package:libraryapp/features/penerbit_buku/presentation/bloc/penerbit_bloc.dart';

import 'core/network/dio_client.dart';
import 'features/auth/data/repository/auth_repository_impl.dart';
import 'features/auth/domain/auth_repository.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/penuliss_buku/data/datasource/penulis_buku_datasource.dart';
import 'features/penuliss_buku/data/repository/penulis_repository_impl.dart';
import 'features/penuliss_buku/domain/penulis_repository.dart';
import 'features/penuliss_buku/presentation/bloc/penulis_bloc.dart';

class DependencyInjection {
  static AuthBloc authBloc() {
    Dio dio = DioClient.dio;

    final datasource = AuthDataSource(dio);

    AuthRepository repository = AuthRepositoryImpl(datasource);

    return AuthBloc(repository);
  }

  static BookBloc bookBloc() {
    Dio dio = DioClient.dio;

    final datasource = BookDataSource(dio);
    BookRepository repository = BookRepositoryImpl(datasource);
    return BookBloc(repository);
  }

  static JenbuBloc jenbuBloc() {
    Dio dio = DioClient.dio;

    final datasource = JenbuDataSource(dio);
    JenisRepository repository = JenisRepositoryImpl(datasource);
    return JenbuBloc(repository);
  }

  static DendaBloc dendaBloc(){
    Dio dio = DioClient.dio;

    final datasource = DendaDataSource(dio);
    DendaRepository repository = DendaRepositoryImpl(datasource);
    return DendaBloc(repository);
  }

  static PeminjamanBloc peminjamanBloc(){
    Dio dio = DioClient.dio;

    final datasource = PeminjamanDataSource(dio);
    PeminjamanRepository repository = PeminjamanRepositoryImpl(datasource);
    return PeminjamanBloc(repository);
  }

  static PenulisBloc penulisBloc(){
    Dio dio = DioClient.dio;

    final datasource = PenulisDataSource(dio);
    PenulisRepository repository = PenulisRepositoryImpl(datasource);
    return PenulisBloc(repository);
  }

  static PenerbitBloc penerbitBloc(){
    Dio dio = DioClient.dio;

    final datasource = PenerbitDatasource(dio);
    PenerbitRepository repository = PenerbitRepositoryImpl(datasource);
    return PenerbitBloc(repository);
  }
}
