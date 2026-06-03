import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libraryapp/core/utils/shared_preference_helper.dart';
import 'package:libraryapp/features/auth/presentation/pages/login_page.dart';
import 'package:libraryapp/features/book/presentation/pages/buku_page.dart';
import 'package:libraryapp/pages/home_page.dart';

import 'dependency_injection.dart';

Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();

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
      ],

      child: MaterialApp(debugShowCheckedModeBanner: false, home: SplashPage()),
    );
  }
}

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isLogin = SharedPreferenceHelper.getLogin() ?? false;

    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                const Icon(Icons.library_books_rounded, size: 120),

                const SizedBox(height: 24),

                const Text(
                  "Library App",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 12),

                const Text("Masuk sebagai", style: TextStyle(fontSize: 18)),

                const SizedBox(height: 48),

                SizedBox(
                  width: double.infinity,
                  height: 55,

                  child: ElevatedButton.icon(
                    onPressed: () {
                      (isLogin)
                          ? Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const HomePage(),
                              ),
                            )
                          : Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const LoginPage(),
                              ),
                            );
                    },

                    icon: const Icon(Icons.admin_panel_settings),

                    label: const Text("Admin / Pegawai"),

                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  height: 55,

                  child: OutlinedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const BukuPage()),
                      );
                    },

                    icon: const Icon(Icons.person),

                    label: const Text("Umum"),

                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
