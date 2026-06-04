import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libraryapp/features/penuliss_buku/data/models/models/req/update_penulis_req.dart';
import 'package:libraryapp/features/penuliss_buku/data/models/models/res/penulis_msg_response.dart';

import '../../../../core/state/result_state.dart';
import '../../data/models/models/res/penulis_response.dart';
import '../bloc/penulis_bloc.dart';

class EditPenerbitDialog
    extends StatefulWidget {

  final Datum penerbit;

  const EditPenerbitDialog({
    super.key,
    required this.penerbit,
  });

  @override
  State<EditPenerbitDialog>
  createState() =>
      _EditPenerbitDialogState();
}

class _EditPenerbitDialogState
    extends State<
        EditPenerbitDialog> {

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
          widget.penerbit
              .penulisBuku,
        );

    emailController =
        TextEditingController(
          text:
          widget.penerbit
              .emailPenulis,
        );

    alamatController =
        TextEditingController(
          text:
          widget.penerbit
              .alamat,
        );

    deskripsiController =
        TextEditingController(
          text:
          widget.penerbit
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
            "Edit Penerbit",
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
                      controller:
                      namaController,

                      enabled:
                      !isLoading,

                      decoration:
                      const InputDecoration(
                        labelText:
                        "Penulis Buku",
                      ),
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

                context
                    .read<
                    PenulisBloc>()
                    .add(
                  UpdatePenulis(
                    req:
                    UpdatePenulisReq(
                      id:
                      widget
                          .penerbit
                          .id,

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