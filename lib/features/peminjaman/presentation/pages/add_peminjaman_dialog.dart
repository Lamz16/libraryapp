import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/state/result_state.dart';
import '../../../../core/utils/helper.dart';
import '../../data/models/models/req/create_peminjaman_req.dart';
import '../bloc/peminjaman_bloc.dart';

class AddPeminjamanDialog extends StatefulWidget {
  const AddPeminjamanDialog({super.key});

  @override
  State<AddPeminjamanDialog> createState() =>
      _AddPeminjamanDialogState();
}

class _AddPeminjamanDialogState extends State<AddPeminjamanDialog> {
  final _formKey = GlobalKey<FormState>();

  final anggotaController = TextEditingController();
  final jaminanController = TextEditingController();

  DateTime? tglPinjam;
  DateTime? tglKembali;

  void _submit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (tglPinjam == null || tglKembali == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Tanggal wajib diisi"),
        ),
      );
      return;
    }

    context.read<PeminjamanBloc>().add(
      CreatePeminjaman(
        request: CreatePeminjamanReq(
          idAnggota: anggotaController.text.trim(),
          jaminan: jaminanController.text.trim(),
          tglPinjam: formatApiDate(tglPinjam!),
          tglHrsKembali: formatApiDate(tglKembali!),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PeminjamanBloc, PeminjamanState>(
      builder: (context, state) {
        final isLoading = state.createState is ResultLoading;

        return AlertDialog(
          title: const Text("Tambah Peminjaman"),

          content: SizedBox(
            width: 450,
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: anggotaController,
                      enabled: !isLoading,
                      decoration: const InputDecoration(
                        labelText: "ID Anggota",
                      ),
                      validator: (v) =>
                      v == null || v.isEmpty
                          ? "Wajib diisi"
                          : null,
                    ),

                    const SizedBox(height: 12),

                    TextFormField(
                      controller: jaminanController,
                      enabled: !isLoading,
                      decoration: const InputDecoration(
                        labelText: "Jaminan",
                      ),
                      validator: (v) =>
                      v == null || v.isEmpty
                          ? "Wajib diisi"
                          : null,
                    ),

                    const SizedBox(height: 12),

                    ListTile(
                      enabled: !isLoading,
                      title: Text(
                        tglPinjam == null
                            ? "Pilih Tanggal Pinjam"
                            : "${tglPinjam!.day}-${tglPinjam!.month}-${tglPinjam!.year}",
                      ),
                      trailing: const Icon(Icons.calendar_month),
                      onTap: isLoading
                          ? null
                          : () async {
                        final picked = await showDatePicker(
                          context: context,
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2100),
                          initialDate: DateTime.now(),
                        );

                        if (picked != null) {
                          setState(() {
                            tglPinjam = picked;
                          });
                        }
                      },
                    ),

                    ListTile(
                      enabled: !isLoading,
                      title: Text(
                        tglKembali == null
                            ? "Pilih Tanggal Kembali"
                            : "${tglKembali!.day}-${tglKembali!.month}-${tglKembali!.year}",
                      ),
                      trailing: const Icon(Icons.calendar_month),
                      onTap: isLoading
                          ? null
                          : () async {
                        final picked = await showDatePicker(
                          context: context,
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2100),
                          initialDate: DateTime.now(),
                        );

                        if (picked != null) {
                          setState(() {
                            tglKembali = picked;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),

          actions: [
            TextButton(
              onPressed: isLoading
                  ? null
                  : () {
                Navigator.pop(context);
              },
              child: const Text("Batal"),
            ),

            ElevatedButton(
              onPressed: isLoading ? null : _submit,
              child: isLoading
                  ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              )
                  : const Text("Simpan"),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    anggotaController.dispose();
    jaminanController.dispose();
    super.dispose();
  }
}