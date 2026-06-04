import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libraryapp/features/penerbit_buku/data/models/models/req/penerbit_update_req.dart';
import 'package:libraryapp/features/penerbit_buku/data/models/models/res/penerbit_msg_response.dart';

import '../../../../core/state/result_state.dart';
import '../../data/models/models/res/penerbit_response.dart';
import '../bloc/penerbit_bloc.dart';

class EditPenerbitDialog extends StatefulWidget {

  final Datum penerbit;

  const EditPenerbitDialog({
    super.key,
    required this.penerbit,
  });

  @override
  State<EditPenerbitDialog> createState() =>
      _EditPenerbitDialogState();
}

class _EditPenerbitDialogState
    extends State<EditPenerbitDialog> {

  final _formKey = GlobalKey<FormState>();

  late TextEditingController namaController;
  late TextEditingController alamatController;
  late TextEditingController emailController;
  late TextEditingController telpController;
  late TextEditingController deskripsiController;

  @override
  void initState() {
    super.initState();

    namaController = TextEditingController(
      text: widget.penerbit.penerbitBuku,
    );

    alamatController = TextEditingController(
      text: widget.penerbit.alamatPenerbit,
    );

    emailController = TextEditingController(
      text: widget.penerbit.emailPenerbit,
    );

    telpController = TextEditingController(
      text: widget.penerbit.telpPenerbit,
    );

    deskripsiController = TextEditingController(
      text: widget.penerbit.deskripsiPenerbit,
    );
  }

  @override
  Widget build(BuildContext context) {

    final isLoading =
    context.watch<PenerbitBloc>()
        .state.update
    is ResultLoading<PenerbitMsgResponse>;

    return AlertDialog(
      title: const Text(
        "Edit Penerbit",
      ),

      content: SizedBox(
        width: 500,

        child: Form(
          key: _formKey,

          child: SingleChildScrollView(
            child: Column(
              children: [

                TextFormField(
                  controller: namaController,
                  decoration: const InputDecoration(
                    labelText: "Nama Penerbit",
                  ),
                  validator: (v) =>
                  v!.isEmpty
                      ? "Wajib diisi"
                      : null,
                ),

                const SizedBox(height: 12),

                TextFormField(
                  controller: alamatController,
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

                const SizedBox(height: 12),

                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: "Email",
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Email wajib diisi";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 12),

                TextFormField(
                  controller: telpController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: "Telepon",
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Telepon wajib diisi";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 12),

                TextFormField(
                  controller: deskripsiController,
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
            Navigator.pop(context);
          },
          child: const Text(
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
                .validate()){
              return;
            }

            context
                .read<PenerbitBloc>()
                .add(
              UpdatePenerbit(
                request:
                PenerbitUpdateReq(
                  id:
                  widget.penerbit.id,

                  penerbitBuku:
                  namaController.text,

                  alamatPenerbit:
                  alamatController.text,

                  emailPenerbit:
                  emailController.text,

                  telpPenerbit:
                  telpController.text,

                  deskripsi:
                  deskripsiController.text,
                ),
              ),
            );
          },

          child: isLoading
              ? const SizedBox(
            width: 20,
            height: 20,
            child:
            CircularProgressIndicator(
              strokeWidth: 2,
            ),
          )
              : const Text(
            "Update",
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    namaController.dispose();
    alamatController.dispose();
    emailController.dispose();
    telpController.dispose();
    deskripsiController.dispose();
    super.dispose();
  }
}