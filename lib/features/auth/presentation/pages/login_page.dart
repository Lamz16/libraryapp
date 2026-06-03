import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libraryapp/pages/home_page.dart';

import '../../../../core/state/result_state.dart';
import '../../../book/presentation/pages/buku_page.dart';
import '../../data/models/res/login_response.dart';
import '../bloc/auth_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController usernameController =
  TextEditingController(text: "admin");

  final TextEditingController passwordController =
  TextEditingController(text: "admin");

  bool isObscure = true;

  void login() {

    final username = usernameController.text.trim();
    final password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Username dan password wajib diisi",
          ),
        ),
      );

      return;
    }

    context.read<AuthBloc>().add(
      LoginEvent(
        username: username,
        password: password,
      ),
    );

  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return BlocListener<AuthBloc, AuthState>(

      listener: (context, state) {

        final loginState = state.loginState;

        if (loginState is ResultLoaded<LoginResponse>) {

          final response = loginState.data;

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(response.msg),
            ),
          );

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => const HomePage(),
            ),
          );

        }

        if (loginState is ResultError<LoginResponse>) {

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(loginState.message),
            ),
          );

        }

      },

      child: Scaffold(

        backgroundColor: Colors.white,

        body: SafeArea(

          child: Center(

            child: SingleChildScrollView(

              padding: const EdgeInsets.all(24),

              child: Column(

                crossAxisAlignment: CrossAxisAlignment.stretch,

                children: [

                  const Icon(
                    Icons.library_books_rounded,
                    size: 90,
                  ),

                  const SizedBox(height: 24),

                  const Text(
                    "Library App",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "Silakan login untuk melanjutkan",
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 40),

                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      labelText: "Username",
                      hintText: "Masukkan username",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: const Icon(Icons.person),
                    ),
                  ),

                  const SizedBox(height: 20),

                  TextField(
                    controller: passwordController,
                    obscureText: isObscure,
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Masukkan password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                        icon: Icon(
                          isObscure
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  BlocBuilder<AuthBloc, AuthState>(

                    builder: (context, state) {

                      final loginState = state.loginState;

                      final isLoading =
                      loginState is ResultLoading;

                      return SizedBox(

                        height: 55,

                        child: ElevatedButton(

                          onPressed: isLoading
                              ? null
                              : login,

                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(12),
                            ),
                          ),

                          child: isLoading
                              ? const SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          )
                              : const Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );

                    },
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}