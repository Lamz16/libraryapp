import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libraryapp/features/penuliss_buku/data/models/models/req/update_penulis_req.dart';
import 'package:libraryapp/features/penuliss_buku/data/models/models/res/penulis_msg_response.dart';

import '../../../../core/state/result_state.dart';
import '../../data/models/models/res/penulis_response.dart';
import '../bloc/penulis_bloc.dart';

class EditPenulisDialog
    extends StatefulWidget {

  final Datum penulis;

  const EditPenulisDialog({
    super.key,
    required this.penulis,
  });

  @override
  State<EditPenulisDialog>
  createState() =>
      _EditPenulisDialogState();
}

class _EditPenulisDialogState
    extends State<
        EditPenulisDialog> {

  final _formKey =
  GlobalKey<FormState>();

  late TextEditingController
  namaController;

  late TextEditingController
  emailController;

  late TextEditingController
  alamatController;

  late TextEditingController
  deskripsiController;

  @override
  void initState() {
    super.initState();

    namaController =
        TextEditingController(
          text:
          widget.penulis
              .penulisBuku,
        );

    emailController =
        TextEditingController(
          text:
          widget.penulis
              .emailPenulis,
        );

    alamatController =
        TextEditingController(
          text:
          widget.penulis
              .alamat,
        );

    deskripsiController =
        TextEditingController(
          text:
          widget.penulis
              .deskripsi,
        );
  }

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<
        PenulisBloc,
        PenulisState>(
      builder: (context,state){

        final isLoading =
        state.updatePenulis
        is ResultLoading<PenulisMsgResponse>;

        return AlertDialog(
          title:
          const Text(
            "Edit Penulis",
          ),

          content: SizedBox(
            width: 500,

            child: Form(
              key: _formKey,

              child:
              SingleChildScrollView(
                child: Column(
                  mainAxisSize:
                  MainAxisSize.min,

                  children: [

                    TextFormField(
                      controller: namaController,
                      enabled: !isLoading,
                      decoration: const InputDecoration(
                        labelText: "Penulis Buku",
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Penulis buku wajib diisi";
                        }
                        return null;
                      },
                    ),

                    const SizedBox(
                      height: 12,
                    ),

                    TextFormField(
                      controller: emailController,
                      enabled: !isLoading,
                      decoration: const InputDecoration(
                        labelText: "Email Penulis",
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Email penulis wajib diisi";
                        }
                        return null;
                      },
                    ),

                    const SizedBox(
                      height: 12,
                    ),

                    TextFormField(
                      controller: alamatController,
                      enabled: !isLoading,
                      decoration: const InputDecoration(
                        labelText: "Alamat",
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Alamat wajib diisi";
                        }
                        return null;
                      },
                    ),

                    const SizedBox(
                      height: 12,
                    ),

                    TextFormField(
                      controller: deskripsiController,
                      enabled: !isLoading,
                      maxLines: 3,
                      decoration: const InputDecoration(
                        labelText: "Deskripsi",
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Deskripsi wajib diisi";
                        }
                        return null;
                      },
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
              onPressed: isLoading
                  ? null
                  : () {

                if (!_formKey.currentState!.validate()) {
                  return;
                }

                context.read<PenulisBloc>().add(
                  UpdatePenulis(
                    req: UpdatePenulisReq(
                      id: widget.penulis.id,
                      emailPenulis: emailController.text.trim(),
                      penulisBuku: namaController.text.trim(),
                      alamatPenulis: alamatController.text.trim(),
                      deskripsi: deskripsiController.text.trim(),
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
                "Update",
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