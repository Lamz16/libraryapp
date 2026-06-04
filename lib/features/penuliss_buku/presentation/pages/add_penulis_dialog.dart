import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libraryapp/features/penuliss_buku/data/models/models/req/create_penulis_req.dart';
import 'package:libraryapp/features/penuliss_buku/data/models/models/res/penulis_msg_response.dart';

import '../../../../core/state/result_state.dart';
import '../bloc/penulis_bloc.dart';

class AddPenulisDialog extends StatefulWidget {
  const AddPenulisDialog({super.key});

  @override
  State<AddPenulisDialog> createState() =>
      _AddPenulisDialogState();
}

class _AddPenulisDialogState
    extends State<AddPenulisDialog> {

  final _formKey = GlobalKey<FormState>();

  final namaController =
  TextEditingController();

  final emailController =
  TextEditingController();

  final alamatController =
  TextEditingController();

  final deskripsiController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<
        PenulisBloc,
        PenulisState>(
      builder: (context,state) {

        final isLoading =
        state.createPenulis
        is ResultLoading<PenulisMsgResponse>;

        return AlertDialog(
          title: const Text(
            "Tambah Penulis",
          ),

          content: SizedBox(
            width: 500,

            child: Form(
              key: _formKey,

              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize:
                  MainAxisSize.min,

                  children: [

                    TextFormField(
                      controller:
                      namaController,

                      enabled:
                      !isLoading,

                      decoration:
                      const InputDecoration(
                        labelText:
                        "Penulis Buku",
                      ),

                      validator: (v) =>
                      v == null ||
                          v.isEmpty
                          ? "Wajib diisi"
                          : null,
                    ),

                    const SizedBox(
                      height: 12,
                    ),

                    TextFormField(
                      controller:
                      emailController,

                      enabled:
                      !isLoading,

                      decoration:
                      const InputDecoration(
                        labelText:
                        "Email Penulis",
                      ),

                      validator: (v) =>
                      v == null ||
                          v.isEmpty
                          ? "Wajib diisi"
                          : null,
                    ),

                    const SizedBox(
                      height: 12,
                    ),

                    TextFormField(
                      controller:
                      alamatController,

                      enabled:
                      !isLoading,

                      decoration:
                      const InputDecoration(
                        labelText:
                        "Alamat",
                      ),

                      validator: (v) =>
                      v == null ||
                          v.isEmpty
                          ? "Wajib diisi"
                          : null,
                    ),

                    const SizedBox(
                      height: 12,
                    ),

                    TextFormField(
                      controller:
                      deskripsiController,

                      enabled:
                      !isLoading,

                      maxLines: 3,

                      decoration:
                      const InputDecoration(
                        labelText:
                        "Deskripsi",
                      ),

                      validator: (v) =>
                      v == null ||
                          v.isEmpty
                          ? "Wajib diisi"
                          : null,
                    ),
                  ],
                ),
              ),
            ),
          ),

          actions: [

            TextButton(
              onPressed:
              isLoading
                  ? null
                  : (){
                Navigator.pop(
                  context,
                );
              },
              child:
              const Text(
                "Batal",
              ),
            ),

            ElevatedButton(
              onPressed:
              isLoading
                  ? null
                  : () {

                if(!_formKey
                    .currentState!
                    .validate()) {
                  return;
                }

                context
                    .read<
                    PenulisBloc>()
                    .add(
                  CreatePenulis(
                    req:
                    CreatePenulisReq(
                      emailPenulis:
                      emailController
                          .text,

                      penulisBuku:
                      namaController
                          .text,

                      alamatPenulis:
                      alamatController
                          .text,

                      deskripsi:
                      deskripsiController
                          .text,
                    ),
                  ),
                );
              },

              child:
              isLoading
                  ? const SizedBox(
                height: 20,
                width: 20,
                child:
                CircularProgressIndicator(
                  strokeWidth:
                  2,
                ),
              )
                  : const Text(
                "Simpan",
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    namaController.dispose();
    emailController.dispose();
    alamatController.dispose();
    deskripsiController.dispose();
    super.dispose();
  }
}