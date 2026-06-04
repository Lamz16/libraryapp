import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libraryapp/features/jenbu/data/models/models/res/JenbuResponse.dart';
import 'package:libraryapp/features/jenbu/data/models/models/res/detail_jenis_response.dart';

import '../../../../core/state/result_state.dart';
import '../../data/models/models/req/create_jenbu_req.dart';
import '../../data/models/models/req/update_jenbu_req.dart';
import '../../data/models/models/res/jenis_buku_response.dart';
import '../bloc/jenbu_bloc.dart';

class JenisBukuPage extends StatefulWidget {
  const JenisBukuPage({super.key});

  @override
  State<JenisBukuPage> createState() => _JenisBukuPageState();
}

class _JenisBukuPageState extends State<JenisBukuPage> {
  @override
  void initState() {
    super.initState();

    context.read<JenbuBloc>().add(GetAllJenbu());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showJenisBukuForm();
        },

        child: const Icon(Icons.add),
      ),

      body: BlocConsumer<JenbuBloc, JenbuState>(
        listenWhen: (previous, current) {
          return previous.createState != current.createState ||
              previous.updateState != current.updateState ||
              previous.deleteState != current.deleteState;
        },

        listener: (context, state) {
          // creat data
          final createState = state.createState;

          if (createState is ResultLoaded<JenbuResponse>) {
            Navigator.pop(context);

            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(createState.data.msg)));

            context.read<JenbuBloc>().add(ResetCreateJenbu());

            context.read<JenbuBloc>().add(GetAllJenbu());
          }

          if (createState is ResultError<JenbuResponse>) {
            Navigator.pop(context);

            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(createState.message)));

            context.read<JenbuBloc>().add(ResetCreateJenbu());
          }

          // Update
          final updateState = state.updateState;

          if (updateState is ResultLoaded<JenbuResponse>) {
            Navigator.pop(context);

            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(updateState.data.msg)));

            context.read<JenbuBloc>().add(ResetUpdateJenbu());

            context.read<JenbuBloc>().add(GetAllJenbu());
          }

          if (updateState is ResultError<JenbuResponse>) {
            Navigator.pop(context);

            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(updateState.message)));

            context.read<JenbuBloc>().add(ResetUpdateJenbu());
          }

          // delete
          final deleteState = state.deleteState;

          if (deleteState is ResultLoaded<JenbuResponse>) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(deleteState.data.msg)));

            context.read<JenbuBloc>().add(ResetDeleteJenbu());

            context.read<JenbuBloc>().add(GetAllJenbu());
          }

          if (deleteState is ResultError<JenbuResponse>) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(deleteState.message)));

            context.read<JenbuBloc>().add(ResetDeleteJenbu());
          }
        },

        builder: (context, state) {
          final jenbuState = state.jenbuState;

          if (jenbuState is ResultLoading<JenisBukuResponse>) {
            return const Center(child: CircularProgressIndicator());
          }

          if (jenbuState is ResultError<JenisBukuResponse>) {
            return Center(child: Text(jenbuState.message));
          }

          if (jenbuState is ResultLoaded<JenisBukuResponse>) {
            final data = jenbuState.data.data;

            return RefreshIndicator(
              onRefresh: () async {
                context.read<JenbuBloc>().add(GetAllJenbu());
              },

              child: data.isEmpty
                  ? ListView(
                      physics: const AlwaysScrollableScrollPhysics(),

                      children: const [
                        SizedBox(height: 300),

                        Center(child: Text("Data jenis buku kosong")),
                      ],
                    )
                  : ListView.separated(
                      physics: const AlwaysScrollableScrollPhysics(),

                      padding: const EdgeInsets.all(16),

                      itemCount: data.length,

                      separatorBuilder: (_, __) {
                        return const SizedBox(height: 12);
                      },

                      itemBuilder: (context, index) {
                        final item = data[index];

                        return InkWell(
                          borderRadius: BorderRadius.circular(12),

                          onTap: () async {
                            context.read<JenbuBloc>().add(
                              GetJenbuById(id: item.id),
                            );

                            _showDetailDialog();
                          },

                          child: Card(
                            elevation: 2,

                            child: Padding(
                              padding: const EdgeInsets.all(16),

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          item.jenisBuku,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),

                                      IconButton(
                                        onPressed: () {
                                          _showJenisBukuForm(item: item);
                                        },

                                        icon: const Icon(Icons.edit),
                                      ),

                                      IconButton(
                                        onPressed: () {
                                          _showDeleteDialog(item.id);
                                        },

                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 10),

                                  Text(item.deskripsi),
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

  void _showJenisBukuForm({JenisBuku? item}) {
    final jenisController = TextEditingController(text: item?.jenisBuku ?? "");

    final deskripsiController = TextEditingController(
      text: item?.deskripsi ?? "",
    );

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        String? jenisError;
        String? deskripsiError;

        return StatefulBuilder(
          builder: (context, setModalState) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 20,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      item == null ? "Tambah Jenis Buku" : "Edit Jenis Buku",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 20),

                    TextField(
                      controller: jenisController,
                      decoration: InputDecoration(
                        labelText: "Jenis Buku",
                        border: const OutlineInputBorder(),
                        errorText: jenisError,
                      ),
                    ),

                    const SizedBox(height: 16),

                    TextField(
                      controller: deskripsiController,
                      maxLines: 4,
                      decoration: InputDecoration(
                        labelText: "Deskripsi",
                        border: const OutlineInputBorder(),
                        errorText: deskripsiError,
                      ),
                    ),

                    const SizedBox(height: 24),

                    BlocBuilder<JenbuBloc, JenbuState>(
                      builder: (context, state) {
                        final isLoading =
                            state.createState is ResultLoading ||
                                state.updateState is ResultLoading;

                        return SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: isLoading
                                ? null
                                : () {
                              final jenis = jenisController.text.trim();
                              final deskripsi =
                              deskripsiController.text.trim();

                              setModalState(() {
                                jenisError = jenis.isEmpty
                                    ? "Jenis buku wajib diisi"
                                    : null;

                                deskripsiError = deskripsi.isEmpty
                                    ? "Deskripsi wajib diisi"
                                    : null;
                              });

                              if (jenisError != null ||
                                  deskripsiError != null) {
                                return;
                              }

                              if (item == null) {
                                context.read<JenbuBloc>().add(
                                  CreateJenbu(
                                    request: CreateJenbuReq(
                                      jenisBuku: jenis,
                                      deskripsi: deskripsi,
                                    ),
                                  ),
                                );
                              } else {
                                context.read<JenbuBloc>().add(
                                  UpdateJenbu(
                                    request: UpdateJenbuReq(
                                      id: item.id,
                                      jenisBuku: jenis,
                                      deskripsi: deskripsi,
                                    ),
                                  ),
                                );
                              }
                            },
                            child: isLoading
                                ? const SizedBox(
                              height: 22,
                              width: 22,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                                : Text(item == null ? "Tambah" : "Update"),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _showDeleteDialog(String id) {
    showDialog(
      context: context,

      builder: (context) {
        return AlertDialog(
          title: const Text("Hapus Jenis Buku"),

          content: const Text("Yakin ingin menghapus data ini?"),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },

              child: const Text("Batal"),
            ),

            ElevatedButton(
              onPressed: () {
                context.read<JenbuBloc>().add(DeleteJenbu(id: id));

                Navigator.pop(context);
              },

              child: const Text("Hapus"),
            ),
          ],
        );
      },
    );
  }

  void _showDetailDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return BlocBuilder<JenbuBloc, JenbuState>(
          builder: (context, state) {
            final detailState = state.detailState;

            if (detailState is ResultLoading) {
              return const AlertDialog(
                content: SizedBox(
                  height: 100,
                  child: Center(child: CircularProgressIndicator()),
                ),
              );
            }

            if (detailState is ResultError<DetailJenisResponse>) {
              return AlertDialog(
                title: const Text("Error"),

                content: Text(detailState.message),

                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },

                    child: const Text("Tutup"),
                  ),
                ],
              );
            }

            if (detailState is ResultLoaded<DetailJenisResponse>) {
              final item = detailState.data.data;

              return AlertDialog(
                title: const Text("Detail Jenis Buku"),

                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    const Text(
                      "Jenis Buku",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(height: 4),

                    Text(item.jenisBuku),

                    const SizedBox(height: 16),

                    const Text(
                      "Deskripsi",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(height: 4),

                    Text(item.deskripsi),

                    const SizedBox(height: 16),

                    const Text(
                      "Updated At",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(height: 4),

                    Text(item.updatedAt.toString()),
                  ],
                ),

                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },

                    child: const Text("Tutup"),
                  ),
                ],
              );
            }

            return const SizedBox();
          },
        );
      },
    );
  }
}
