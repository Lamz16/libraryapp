import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libraryapp/features/book/data/models/res/buku_response.dart';
import 'package:libraryapp/features/book/presentation/bloc/book_bloc.dart';

import '../../../../core/state/result_state.dart';
import 'detail_book.dart';

class BukuPage extends StatefulWidget {
  const BukuPage({super.key});

  @override
  State<BukuPage> createState() => _BukuPageState();
}

class _BukuPageState extends State<BukuPage> {
  @override
  void initState() {
    super.initState();

    context.read<BookBloc>().add(GetAllBookEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Buku")),

      body: BlocBuilder<BookBloc, BookState>(
        builder: (context, state) {
          final bukuState = state.bookState;

          if (bukuState is ResultLoading<BukuResponse>) {
            return const Center(child: CircularProgressIndicator());
          }

          if (bukuState is ResultError<BukuResponse>) {
            return Center(child: Text(bukuState.message));
          }

          if (bukuState is ResultLoaded<BukuResponse>) {
            final books = bukuState.data.data;

            return RefreshIndicator(
              onRefresh: () async {
                context.read<BookBloc>().add(GetAllBookEvent());
              },
              child: books.isEmpty
              ? const Center(child: Text("Data buku kosong"))
              : ListView.separated(
                padding: const EdgeInsets.all(16),

                itemCount: books.length,

                separatorBuilder: (_, __) {
                  return const SizedBox(height: 12);
                },

                itemBuilder: (context, index) {
                  final book = books[index];

                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BookDetailPage(id: book.idBuku),
                        ),
                      );
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(
                              book.judulBuku,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 8),

                            Text("ISBN : ${book.isbn}"),
                            Text("Rak Buku : ${book.rakBuku}"),
                            Text("Tahun Terbit : ${book.tahunTerbit}"),
                            Text("Stok Buku : ${book.stokBuku}"),

                            const SizedBox(height: 12),

                            Text(book.deskripsiBuku),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
