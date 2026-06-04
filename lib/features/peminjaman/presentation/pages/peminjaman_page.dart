import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libraryapp/features/peminjaman/data/models/models/res/peminjaman_msg_response.dart';

import '../../../../core/state/result_state.dart';
import '../../data/models/models/res/peminjaman_response.dart';
import '../bloc/peminjaman_bloc.dart';
import 'add_peminjaman_dialog.dart';
import 'detail_peminjaman_dialog.dart';
import 'edit_peminjaman_dialog.dart';

class PeminjamanPage extends StatefulWidget {
  const PeminjamanPage({super.key});

  @override
  State<PeminjamanPage> createState() => _PeminjamanPageState();
}

class _PeminjamanPageState extends State<PeminjamanPage> {
  @override
  void initState() {
    super.initState();
    context.read<PeminjamanBloc>().add(GetAllPeminjaman());
  }

  Future<void> _refresh() async {
    context.read<PeminjamanBloc>().add(GetAllPeminjaman());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => const AddPeminjamanDialog(),
          );
        },
        child: const Icon(Icons.add),
      ),

      body: MultiBlocListener(
        listeners: [
          BlocListener<PeminjamanBloc, PeminjamanState>(
            listenWhen: (p, c) => p.createState != c.createState,
            listener: (context, state) {
              final createState = state.createState;
              if (createState is ResultLoaded<PeminjamanMsgResponse>) {
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Data berhasil ditambahkan')),
                );

                context.read<PeminjamanBloc>()
                  ..add(ResetCreate())
                  ..add(GetAllPeminjaman());
              }

              if(createState is ResultError<PeminjamanMsgResponse>){
                final message = createState.message;
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(message)),
                );

                context.read<PeminjamanBloc>()
                  ..add(ResetCreate())
                  ..add(GetAllPeminjaman());
              }
            },
          ),

          BlocListener<PeminjamanBloc, PeminjamanState>(
            listenWhen: (p, c) => p.updateState != c.updateState,
            listener: (context, state) {
              final updateState = state.updateState;
              if (updateState is ResultLoaded<PeminjamanMsgResponse>) {
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Data berhasil diperbarui')),
                );

                context.read<PeminjamanBloc>()
                  ..add(ResetUpdate())
                  ..add(GetAllPeminjaman());
              }

              if(updateState is ResultError<PeminjamanMsgResponse>){
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(updateState.message)),
                );

                context.read<PeminjamanBloc>()
                  ..add(ResetUpdate())
                  ..add(GetAllPeminjaman());
              }

            },
          ),

          BlocListener<PeminjamanBloc, PeminjamanState>(
            listenWhen: (p, c) => p.deleteState != c.deleteState,
            listener: (context, state) {
              final deleteState = state.deleteState;
              if (deleteState is ResultLoaded) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Data berhasil dihapus')),
                );

                context.read<PeminjamanBloc>()
                  ..add(ResetDelete())
                  ..add(GetAllPeminjaman());
              }

              if(deleteState is ResultError<PeminjamanMsgResponse>){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(deleteState.message)),
                );

                context.read<PeminjamanBloc>()
                  ..add(ResetDelete())
                  ..add(GetAllPeminjaman());
              }
            },
          ),
        ],

        child: BlocBuilder<PeminjamanBloc, PeminjamanState>(
          builder: (context, state) {
            final result = state.peminjamanState;

            if (result is ResultLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (result is ResultError<PeminjamanResponse>) {
              return Center(child: Text(result.message));
            }

            if (result is ResultLoaded<PeminjamanResponse>) {
              final items = result.data.data;

              if (items.isEmpty) {
                return const Center(child: Text("Belum ada data"));
              }

              return RefreshIndicator(
                onRefresh: _refresh,
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];

                    return Card(
                      child: ListTile(
                        onTap: () {
                          _showDetail(item.id);
                        },

                        title: Text(item.jaminan),

                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('ID Anggota : ${item.idAnggota}'),

                            Text(
                              'Pinjam : ${item.tglPinjam.day}-${item.tglPinjam.month}-${item.tglPinjam.year}',
                            ),

                            Text(
                              'Kembali : ${item.tglHrsKembali.day}-${item.tglHrsKembali.month}-${item.tglHrsKembali.year}',
                            ),
                          ],
                        ),

                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (_) =>
                                      EditPeminjamanDialog(peminjaman: item),
                                );
                              },
                            ),

                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                _confirmDelete(item.id);
                              },
                            ),
                          ],
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
      ),
    );
  }

  void _showDetail(String id) {
    showDialog(
      context: context,
      builder: (_) => DetailPeminjamanDialog(id: id),
    );
  }

  void _confirmDelete(String id) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Hapus Data'),
          content: const Text('Yakin ingin menghapus data ini?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);

                context.read<PeminjamanBloc>().add(DeletePeminjaman(id: id));
              },
              child: const Text('Hapus'),
            ),
          ],
        );
      },
    );
  }
}
