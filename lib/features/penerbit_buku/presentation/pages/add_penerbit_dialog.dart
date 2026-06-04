import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libraryapp/features/penerbit_buku/data/models/models/req/create_penerbit_req.dart';
import 'package:libraryapp/features/penerbit_buku/data/models/models/res/penerbit_msg_response.dart';

import '../../../../core/state/result_state.dart';
import '../bloc/penerbit_bloc.dart';

class AddPenerbitDialog extends StatefulWidget {
  const AddPenerbitDialog({super.key});

  @override
  State<AddPenerbitDialog> createState() => _AddPenerbitDialogState();
}

class _AddPenerbitDialogState extends State<AddPenerbitDialog> {
  final _formKey = GlobalKey<FormState>();

  final namaController = TextEditingController();

  final alamatController = TextEditingController();

  final emailController = TextEditingController();

  final telpController = TextEditingController();

  final deskripsiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isLoading =
        context.watch<PenerbitBloc>().state.create
            is ResultLoading<PenerbitMsgResponse>;

    return AlertDialog(
      title: const Text("Tambah Penerbit"),

      content: SizedBox(
        width: 500,

        child: Form(
          key: _formKey,

          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: namaController,
                  decoration: const InputDecoration(labelText: "Nama Penerbit"),
                ),

                TextFormField(
                  controller: alamatController,
                  decoration: const InputDecoration(labelText: "Alamat"),
                ),

                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(labelText: "Email"),
                ),

                TextFormField(
                  controller: telpController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(labelText: "Telepon"),
                ),

                TextFormField(
                  controller: deskripsiController,
                  maxLines: 3,
                  decoration: const InputDecoration(labelText: "Deskripsi"),
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
          onPressed: isLoading
              ? null
              : () {
                  context.read<PenerbitBloc>().add(
                    CreatePenerbit(
                      request: CreatePenerbitReq(
                        penerbitBuku: namaController.text,
                        alamatPenerbit: alamatController.text,
                        emailPenerbit: emailController.text,
                        telpPenerbit: telpController.text,
                        deskripsi: deskripsiController.text,
                      ),
                    ),
                  );
                },

          child: isLoading
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text("Simpan"),
        ),
      ],
    );
  }
}
