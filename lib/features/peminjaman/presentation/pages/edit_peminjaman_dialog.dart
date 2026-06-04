import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libraryapp/core/utils/helper.dart';

import '../../data/models/models/req/update_peminjaman_req.dart';
import '../../data/models/models/res/peminjaman_response.dart';
import '../bloc/peminjaman_bloc.dart';

class EditPeminjamanDialog extends StatefulWidget {

  final Peminjaman peminjaman;

  const EditPeminjamanDialog({
    super.key,
    required this.peminjaman,
  });

  @override
  State<EditPeminjamanDialog> createState() =>
      _EditPeminjamanDialogState();
}

class _EditPeminjamanDialogState
    extends State<EditPeminjamanDialog> {

  final _formKey = GlobalKey<FormState>();

  late TextEditingController anggotaController;
  late TextEditingController jaminanController;

  late DateTime tglPinjam;
  late DateTime tglKembali;

  @override
  void initState() {
    super.initState();

    anggotaController =
        TextEditingController(
          text: widget.peminjaman.idAnggota,
        );

    jaminanController =
        TextEditingController(
          text: widget.peminjaman.jaminan,
        );

    tglPinjam = widget.peminjaman.tglPinjam;
    tglKembali = widget.peminjaman.tglHrsKembali;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Edit Peminjaman"),

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
                  decoration: const InputDecoration(
                    labelText: "ID Anggota",
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "ID Anggota wajib diisi";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 12),

                TextFormField(
                  controller: jaminanController,
                  decoration: const InputDecoration(
                    labelText: "Jaminan",
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Jaminan wajib diisi";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 12),

                ListTile(
                  title: Text(
                    "${tglPinjam.day}-${tglPinjam.month}-${tglPinjam.year}",
                  ),
                  trailing: const Icon(Icons.calendar_month),
                  onTap: () async {

                    final picked =
                    await showDatePicker(
                      context: context,
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2100),
                      initialDate: tglPinjam,
                    );

                    if(picked != null){
                      setState(() {
                        tglPinjam = picked;
                      });
                    }
                  },
                ),

                ListTile(
                  title: Text(
                    "${tglKembali.day}-${tglKembali.month}-${tglKembali.year}",
                  ),
                  trailing: const Icon(Icons.calendar_month),
                  onTap: () async {

                    final picked =
                    await showDatePicker(
                      context: context,
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2100),
                      initialDate: tglKembali,
                    );

                    if(picked != null){
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
          onPressed: (){
            Navigator.pop(context);
          },
          child: const Text("Batal"),
        ),

        ElevatedButton(
          onPressed: () {
            if (!_formKey.currentState!.validate()) {
              return;
            }

            context.read<PeminjamanBloc>().add(
              UpdatePeminjaman(
                request: UpdatePeminjamanReq(
                  idPeminjaman: widget.peminjaman.id,
                  idAnggota: anggotaController.text.trim(),
                  jaminan: jaminanController.text.trim(),
                  tglPinjam: formatApiDate(tglPinjam),
                  tglHrsKembali: formatApiDate(tglKembali),
                ),
              ),
            );
          },
          child: const Text("Update"),
        ),
      ],
    );
  }
}