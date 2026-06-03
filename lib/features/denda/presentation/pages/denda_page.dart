import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libraryapp/features/denda/data/models/models/res/Denda_msg_response.dart';

import '../../../../core/state/result_state.dart';
import '../../data/models/models/req/create_denda_req.dart';
import '../../data/models/models/req/update_denda_req.dart';
import '../../data/models/models/res/denda_response.dart';
import '../bloc/denda_bloc.dart';

class DendaPage extends StatefulWidget {
  const DendaPage({super.key});

  @override
  State<DendaPage> createState() => _DendaPageState();
}

class _DendaPageState extends State<DendaPage> {
  @override
  void initState() {
    super.initState();
    context.read<DendaBloc>().add(GetAllDenda());
  }

  Future<void> _refresh() async {
    context.read<DendaBloc>().add(GetAllDenda());
  }

  void _showDetailDialog(BuildContext context, dynamic item) {
    Widget buildItem({
      required String title,
      required String value,
    }) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 4),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      );
    }

    showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      "Detail Denda",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  buildItem(
                    title: "ID Denda",
                    value: item.idDenda,
                  ),

                  buildItem(
                    title: "Jumlah Denda",
                    value: "Rp ${item.jumlahDenda}",
                  ),

                  buildItem(
                    title: "Tanggal Pinjam",
                    value: item.tglPinjam.toString(),
                  ),

                  buildItem(
                    title: "Tanggal Harus Kembali",
                    value: item.tglHrsKembali.toString(),
                  ),

                  buildItem(
                    title: "Tanggal Kembali",
                    value: item.tglKembali.toString(),
                  ),

                  buildItem(
                    title: "ID Peminjaman",
                    value: item.idPeminjaman,
                  ),

                  buildItem(
                    title: "ID Anggota",
                    value: item.idAnggota,
                  ),

                  buildItem(
                    title: "Created At",
                    value: item.createdAt.toString(),
                  ),

                  buildItem(
                    title: "Updated At",
                    value: item.updatedAt.toString(),
                  ),

                  const SizedBox(height: 10),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Tutup"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showFormBottomSheet({required BuildContext context, dynamic item}) {
    final isEdit = item != null;

    final idDenda = item?.idDenda;

    final jumlahDendaController = TextEditingController(
      text: item?.jumlahDenda.toString() ?? '',
    );

    final tglPinjamController = TextEditingController(
      text: item?.tglPinjam.toUtc().toIso8601String() ?? '',
    );

    final tglHrsKembaliController = TextEditingController(
      text: item?.tglHrsKembali.toUtc().toIso8601String() ?? '',
    );

    final tglKembaliController = TextEditingController(
      text: item?.tglKembali.toUtc().toIso8601String() ?? '',
    );

    final idPeminjamanController = TextEditingController(
      text: item?.idPeminjaman ?? '',
    );

    final idAnggotaController = TextEditingController(
      text: item?.idAnggota ?? '',
    );

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  isEdit ? "Edit Denda" : "Tambah Denda",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                TextField(
                  controller: jumlahDendaController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: "Jumlah Denda"),
                ),

                const SizedBox(height: 12),

                TextField(
                  controller: tglPinjamController,
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: "Tanggal Pinjam",
                    suffixIcon: Icon(Icons.calendar_month),
                  ),
                  onTap: () {
                    _pickDate(
                      context: context,
                      controller: tglPinjamController,
                    );
                  },
                ),

                const SizedBox(height: 12),

                TextField(
                  controller: tglHrsKembaliController,
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: "Tanggal Harus Kembali",
                    suffixIcon: Icon(Icons.calendar_month),
                  ),
                  onTap: () {
                    _pickDate(
                      context: context,
                      controller: tglHrsKembaliController,
                    );
                  },
                ),

                const SizedBox(height: 12),

                TextField(
                  controller: tglKembaliController,
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: "Tanggal Kembali",
                    suffixIcon: Icon(Icons.calendar_month),
                  ),
                  onTap: () {
                    _pickDate(
                      context: context,
                      controller: tglKembaliController,
                    );
                  },
                ),

                const SizedBox(height: 12),

                if(!isEdit)...[
                  TextField(
                    controller: idPeminjamanController,
                    decoration: const InputDecoration(labelText: "ID Peminjaman"),
                  ),
                ],

                const SizedBox(height: 12),

                if (!isEdit) ...[
                  TextField(
                    controller: idAnggotaController,
                    decoration: const InputDecoration(
                      labelText: "ID Anggota",
                    ),
                  ),

                  const SizedBox(height: 12),
                ],

                const SizedBox(height: 20),

                BlocConsumer<DendaBloc, DendaState>(
                  listener: (context, state) {
                    if (state.create is ResultLoaded<DendaMsgResponse>) {
                      final response =
                          (state.create as ResultLoaded<DendaMsgResponse>).data;

                      Navigator.pop(context);

                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(response.msg)));

                      context.read<DendaBloc>().add(ResetCreate());
                      context.read<DendaBloc>().add(GetAllDenda());
                    }

                    if (state.update is ResultLoaded<DendaMsgResponse>) {
                      final response =
                          (state.update as ResultLoaded<DendaMsgResponse>).data;

                      Navigator.pop(context);

                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(response.msg)));

                      context.read<DendaBloc>().add(ResetUpdate());
                      context.read<DendaBloc>().add(GetAllDenda());
                    }
                  },
                  builder: (context, state) {
                    final isLoading =
                        state.create is ResultLoading ||
                        state.update is ResultLoading;

                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: isLoading
                            ? null
                            : () {
                                if (isEdit) {
                                  context.read<DendaBloc>().add(
                                    UpdateDenda(
                                      request: UpdateDendaReq(
                                        idDenda: idDenda ?? '',
                                        jumlahDenda: int.parse(
                                          jumlahDendaController.text,
                                        ),
                                        tglPinjam: tglPinjamController.text,
                                        tglHrsKembali:
                                            tglHrsKembaliController.text,
                                        tglKembali: tglKembaliController.text,
                                        idPeminjaman:
                                            idPeminjamanController.text,
                                        idAnggota: idAnggotaController.text,
                                      ),
                                    ),
                                  );
                                } else {
                                  context.read<DendaBloc>().add(
                                    CreateDenda(
                                      request: CreateDendaReq(
                                        jumlahDenda: int.parse(
                                          jumlahDendaController.text,
                                        ),
                                        tglPinjam: tglPinjamController.text,
                                        tglHrsKembali:
                                            tglHrsKembaliController.text,
                                        tglKembali: tglKembaliController.text,
                                        idPeminjaman:
                                            idPeminjamanController.text,
                                        idAnggota: idAnggotaController.text,
                                      ),
                                    ),
                                  );
                                }
                              },
                        child: isLoading
                            ? const CircularProgressIndicator()
                            : Text(isEdit ? "Update" : "Tambah"),
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
  }

  void _deleteDialog(BuildContext context, String id) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text("Delete Denda"),
          content: const Text("Apakah yakin ingin menghapus data ini?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Batal"),
            ),
            BlocConsumer<DendaBloc, DendaState>(
              listener: (context, state) {
                if (state.delete is ResultLoaded) {
                  final response = (state.delete as ResultLoaded).data;

                  Navigator.pop(context);

                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(response.msg)));

                  context.read<DendaBloc>().add(ResetDelete());
                  context.read<DendaBloc>().add(GetAllDenda());
                }
              },
              builder: (context, state) {
                final isLoading = state.delete is ResultLoading;

                return TextButton(
                  onPressed: isLoading
                      ? null
                      : () {
                          context.read<DendaBloc>().add(DeleteDenda(id: id));
                        },
                  child: isLoading
                      ? const CircularProgressIndicator()
                      : const Text("Delete"),
                );
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _pickDate({
    required BuildContext context,
    required TextEditingController controller,
  }) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      final date = DateTime.utc(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
        10,
        0,
        0,
      );

      controller.text = date.toIso8601String();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showFormBottomSheet(context: context);
        },
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<DendaBloc, DendaState>(
        builder: (context, state) {
          final result = state.denda;

          if (result is ResultLoading<DendaResponse>) {
            return const Center(child: CircularProgressIndicator());
          }

          if (result is ResultError<DendaResponse>) {
            return Center(child: Text(result.message));
          }

          if (result is ResultLoaded<DendaResponse>) {
            final response = result.data;
            final data = response.data;

            if (data.isEmpty) {
              return const Center(child: Text("Data kosong"));
            }

            return RefreshIndicator(
              onRefresh: _refresh,
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: data.length,
                separatorBuilder: (_, _) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final item = data[index];

                  return Card(
                    child: ListTile(
                      onTap: () {
                        _showDetailDialog(context, item);
                      },
                      title: Text("Denda Rp ${item.jumlahDenda}"),
                      subtitle: Text(item.idDenda),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              _showFormBottomSheet(
                                context: context,
                                item: item,
                              );
                            },
                            icon: const Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () {
                              _deleteDialog(context, item.idDenda);
                            },
                            icon: const Icon(Icons.delete),
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
    );
  }
}
