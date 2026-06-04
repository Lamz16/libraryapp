import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:libraryapp/core/utils/shared_preference_helper.dart';
import 'package:libraryapp/pages/splash_pages.dart';

import 'dependency_injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('id_ID');

  await SharedPreferenceHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => DependencyInjection.authBloc()),
        BlocProvider(create: (_) => DependencyInjection.bookBloc()),
        BlocProvider(create: (_) => DependencyInjection.jenbuBloc()),
        BlocProvider(create: (_) => DependencyInjection.dendaBloc()),
        BlocProvider(create: (_) => DependencyInjection.peminjamanBloc()),
        BlocProvider(create: (_) => DependencyInjection.penulisBloc()),
      ],

      child: MaterialApp(debugShowCheckedModeBanner: false, home: SplashPage(),),
    );
  }
}

