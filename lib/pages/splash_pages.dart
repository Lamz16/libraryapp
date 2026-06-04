import 'package:flutter/material.dart';

import '../core/utils/shared_preference_helper.dart';
import '../features/auth/presentation/pages/login_page.dart';
import '../features/book/presentation/pages/buku_page.dart';
import 'home_page.dart';

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