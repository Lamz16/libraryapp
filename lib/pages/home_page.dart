import 'package:flutter/material.dart';
import 'package:libraryapp/features/penerbit_buku/presentation/pages/penerbit_page.dart';
import 'package:libraryapp/features/penuliss_buku/presentation/pages/penulis_page.dart';

import '../core/utils/shared_preference_helper.dart';
import '../features/auth/presentation/pages/login_page.dart';
import '../features/book/presentation/pages/buku_page.dart';
import '../features/denda/presentation/pages/denda_page.dart';
import '../features/jenbu/presentation/pages/jenis_buku_page.dart';
import '../features/peminjaman/presentation/pages/peminjaman_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    BukuPage(),
    JenisBukuPage(),
    PeminjamanPage(),
    DendaPage(),
    PenulisPage(),
    PenerbitPage(),
  ];

  final List<String> titles = [
    "Daftar Buku",
    "Jenis Buku",
    "Peminjaman",
    "Denda",
    "Penulis Buku",
    "Penerbit Buku"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titles[currentIndex])),

      drawer: Drawer(

        width:
        MediaQuery.of(context).size.width * 0.65,

        child: SafeArea(

          child: Column(

            children: [

              DrawerHeader(

                child: Column(

                  mainAxisAlignment:
                  MainAxisAlignment.center,

                  children: const [

                    Icon(
                      Icons.library_books,
                      size: 60,
                    ),

                    SizedBox(height: 12),

                    Text(
                      "Library App",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),

                  ],
                ),
              ),

              _menuItem(
                icon: Icons.menu_book,
                title: "Daftar Buku",
                index: 0,
              ),

              _menuItem(
                icon: Icons.book,
                title: "Jenis Buku",
                index: 1,
              ),

              _menuItem(
                icon: Icons.assignment,
                title: "Peminjaman",
                index: 2,
              ),

              _menuItem(
                icon: Icons.money_off,
                title: "Denda",
                index: 3,
              ),

              _menuItem(
                icon: Icons.menu_book,
                title: "Penulis Buku",
                index: 4,
              ),

              _menuItem(
                icon: Icons.menu_book,
                title: "Penerbit Buku",
                index: 5,
              ),

              const Spacer(),

              const Divider(),

              ListTile(

                leading: const Icon(
                  Icons.logout,
                  color: Colors.red,
                ),

                title: const Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),

                onTap: () async {

                  await SharedPreferenceHelper
                      .clear();

                  if (!context.mounted) return;

                  Navigator.pushAndRemoveUntil(

                    context,

                    MaterialPageRoute(
                      builder: (_) =>
                      const LoginPage(),
                    ),

                        (route) => false,

                  );

                },
              ),

            ],
          ),
        ),
      ),

      body: pages[currentIndex],
    );
  }

  Widget _menuItem({
    required IconData icon,
    required String title,
    required int index,
  }) {
    return ListTile(
      leading: Icon(icon),

      title: Text(title),

      onTap: () {
        Navigator.pop(context);

        setState(() {
          currentIndex = index;
        });
      },
    );
  }
}
