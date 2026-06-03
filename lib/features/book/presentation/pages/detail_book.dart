import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libraryapp/features/book/data/models/res/detail_buku_response.dart';

import '../../../../core/state/result_state.dart';
import '../../data/models/res/buku_response.dart';
import '../bloc/book_bloc.dart';

class BookDetailPage extends StatefulWidget {
  final String id;

  const BookDetailPage({super.key, required this.id});

  @override
  State<BookDetailPage> createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  @override
  void initState() {
    super.initState();

    context.read<BookBloc>().add(GetBookByDetail(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Buku")),

      body: BlocBuilder<BookBloc, BookState>(
        builder: (context, state) {
          final detailState = state.detailBookState;

          if (detailState is ResultLoading<DetailBukuResponse>) {
            return const Center(child: CircularProgressIndicator());
          }

          if (detailState is ResultError<DetailBukuResponse>) {
            return Center(child: Text(detailState.message));
          }

          if (detailState is ResultLoaded<DetailBukuResponse>) {
            final book = detailState.data.data;

            return RefreshIndicator(
              onRefresh: () async {
                context.read<BookBloc>().add(GetBookByDetail(id: widget.id));
              },
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Container(
                      height: 220,
                      width: double.infinity,

                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(16),
                      ),

                      child: book.gambarBuku.isEmpty
                          ? const Icon(Icons.book, size: 80)
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.network(
                                book.gambarBuku,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),

                    const SizedBox(height: 24),

                    Text(
                      book.judulBuku,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    _item("ISBN", book.isbn),

                    _item("Tahun Terbit", book.tahunTerbit),

                    _item("Rak Buku", book.rakBuku),

                    _item("Stok Buku", book.stokBuku.toString()),

                    _item(
                      "Kondisi Buku",
                      book.kondisiBuku.isEmpty ? "-" : book.kondisiBuku,
                    ),

                    const SizedBox(height: 24),

                    const Text(
                      "Deskripsi",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      book.deskripsiBuku,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }

  Widget _item(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          SizedBox(
            width: 120,
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
