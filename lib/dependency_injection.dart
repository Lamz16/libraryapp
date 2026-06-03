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

import 'core/network/dio_client.dart';
import 'features/auth/data/repository/auth_repository_impl.dart';
import 'features/auth/domain/auth_repository.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';

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
}
