import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [

        // BlocProvider(
        //   create: (_) => DependencyInjection.authBloc(),
        // ),
        // BlocProvider(
        //   create: (_) => DependencyInjection.subscriptionBloc(),
        // ),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SizedBox(),
      ),
    );
  }
}