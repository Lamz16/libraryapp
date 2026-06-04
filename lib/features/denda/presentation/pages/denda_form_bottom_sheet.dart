import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/state/result_state.dart';

import '../../../peminjaman/data/models/models/res/peminjaman_response.dart';
import '../../../peminjaman/presentation/bloc/peminjaman_bloc.dart'
as peminjaman;

import '../../data/models/models/req/create_denda_req.dart';
import '../../data/models/models/req/update_denda_req.dart';
import '../../data/models/models/res/Denda_msg_response.dart';

import '../bloc/denda_bloc.dart' as denda;

class DendaFormBottomSheet extends StatefulWidget {
  final dynamic item;

  const DendaFormBottomSheet({
    super.key,
    this.item,
  });

  @override
  State<DendaFormBottomSheet> createState() =>
      _DendaFormBottomSheetState();
}

class _DendaFormBottomSheetState
    extends State<DendaFormBottomSheet> {

  late TextEditingController jumlahDendaController;
  late TextEditingController tglPinjamController;
  late TextEditingController tglHrsKembaliController;
  late TextEditingController tglKembaliController;

  String? selectedPeminjamanId;
  String? selectedAnggotaId;

  bool get isEdit => widget.item != null;

  @override
  void initState() {
    super.initState();

    jumlahDendaController = TextEditingController(
      text: widget.item?.jumlahDenda.toString() ?? '',
    );

    tglPinjamController = TextEditingController(
      text: widget.item?.tglPinjam
          ?.toUtc()
          .toIso8601String() ??
          '',
    );

    tglHrsKembaliController = TextEditingController(
      text: widget.item?.tglHrsKembali
          ?.toUtc()
          .toIso8601String() ??
          '',
    );

    tglKembaliController = TextEditingController(
      text: widget.item?.tglKembali
          ?.toUtc()
          .toIso8601String() ??
          '',
    );

    selectedPeminjamanId =
        widget.item?.idPeminjaman;

    selectedAnggotaId =
        widget.item?.idAnggota;
  }

  @override
  void dispose() {
    jumlahDendaController.dispose();
    tglPinjamController.dispose();
    tglHrsKembaliController.dispose();
    tglKembaliController.dispose();
    super.dispose();
  }

  Future<void> _pickDate(
      TextEditingController controller) async {

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate == null) return;

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

  void _submit() {
    if (jumlahDendaController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Jumlah denda wajib diisi"),
        ),
      );
      return;
    }

    if (isEdit) {
      context.read<denda.DendaBloc>().add(
        denda.UpdateDenda(
          request: UpdateDendaReq(
            idDenda: widget.item.idDenda,
            jumlahDenda: int.parse(
              jumlahDendaController.text,
            ),
            tglPinjam: tglPinjamController.text,
            tglHrsKembali:
            tglHrsKembaliController.text,
            tglKembali:
            tglKembaliController.text,
            idPeminjaman:
            widget.item.idPeminjaman,
            idAnggota:
            widget.item.idAnggota,
          ),
        ),
      );
    } else {
      context.read<denda.DendaBloc>().add(
        denda.CreateDenda(
          request: CreateDendaReq(
            jumlahDenda: int.parse(
              jumlahDendaController.text,
            ),
            tglPinjam:
            tglPinjamController.text,
            tglHrsKembali:
            tglHrsKembaliController.text,
            tglKembali:
            tglKembaliController.text,
            idPeminjaman:
            selectedPeminjamanId ?? '',
            idAnggota:
            selectedAnggotaId ?? '',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom:
        MediaQuery.of(context)
            .viewInsets
            .bottom +
            16,
      ),
      child: SingleChildScrollView(
        child: BlocConsumer<
            denda.DendaBloc,
            denda.DendaState>(
          listener: (context, state) {

            if (state.create
            is ResultLoaded<
                DendaMsgResponse>) {

              final response =
                  (state.create
                  as ResultLoaded<
                      DendaMsgResponse>)
                      .data;

              Navigator.pop(context);

              ScaffoldMessenger.of(context)
                  .showSnackBar(
                SnackBar(
                  content:
                  Text(response.msg),
                ),
              );

              context
                  .read<denda.DendaBloc>()
                  .add(
                denda.ResetCreate(),
              );

              context
                  .read<denda.DendaBloc>()
                  .add(
                denda.GetAllDenda(),
              );
            }

            if (state.update
            is ResultLoaded<
                DendaMsgResponse>) {

              final response =
                  (state.update
                  as ResultLoaded<
                      DendaMsgResponse>)
                      .data;

              Navigator.pop(context);

              ScaffoldMessenger.of(context)
                  .showSnackBar(
                SnackBar(
                  content:
                  Text(response.msg),
                ),
              );

              context
                  .read<denda.DendaBloc>()
                  .add(
                denda.ResetUpdate(),
              );

              context
                  .read<denda.DendaBloc>()
                  .add(
                denda.GetAllDenda(),
              );
            }
          },
          builder: (context, state) {

            final isLoading =
                state.create
                is ResultLoading ||
                    state.update
                    is ResultLoading;

            return Column(
              mainAxisSize:
              MainAxisSize.min,
              children: [

                Text(
                  isEdit
                      ? "Edit Denda"
                      : "Tambah Denda",
                  style:
                  const TextStyle(
                    fontSize: 18,
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),

                const SizedBox(
                    height: 16),

                TextField(
                  controller:
                  jumlahDendaController,
                  keyboardType:
                  TextInputType.number,
                  decoration:
                  const InputDecoration(
                    labelText:
                    "Jumlah Denda",
                  ),
                ),

                const SizedBox(
                    height: 12),

                TextField(
                  controller:
                  tglPinjamController,
                  readOnly: true,
                  decoration:
                  const InputDecoration(
                    labelText:
                    "Tanggal Pinjam",
                    suffixIcon: Icon(
                      Icons
                          .calendar_month,
                    ),
                  ),
                  onTap: () =>
                      _pickDate(
                        tglPinjamController,
                      ),
                ),

                const SizedBox(
                    height: 12),

                TextField(
                  controller:
                  tglHrsKembaliController,
                  readOnly: true,
                  decoration:
                  const InputDecoration(
                    labelText:
                    "Tanggal Harus Kembali",
                    suffixIcon: Icon(
                      Icons
                          .calendar_month,
                    ),
                  ),
                  onTap: () =>
                      _pickDate(
                        tglHrsKembaliController,
                      ),
                ),

                const SizedBox(
                    height: 12),

                TextField(
                  controller:
                  tglKembaliController,
                  readOnly: true,
                  decoration:
                  const InputDecoration(
                    labelText:
                    "Tanggal Kembali",
                    suffixIcon: Icon(
                      Icons
                          .calendar_month,
                    ),
                  ),
                  onTap: () =>
                      _pickDate(
                        tglKembaliController,
                      ),
                ),

                const SizedBox(
                    height: 12),

                if (!isEdit)
                  BlocBuilder<
                      peminjaman
                          .PeminjamanBloc,
                      peminjaman
                          .PeminjamanState>(
                    builder:
                        (context,
                        state) {

                      final result =
                          state
                              .peminjamanState;

                      if (result
                      is ResultLoading) {
                        return const Center(
                          child:
                          CircularProgressIndicator(),
                        );
                      }

                      if (result
                      is ResultLoaded<
                          PeminjamanResponse>) {

                        final data =
                            result
                                .data
                                .data;

                        return DropdownButtonFormField<
                            String>(
                          isExpanded:
                          true,
                          value:
                          selectedPeminjamanId,
                          decoration:
                          const InputDecoration(
                            labelText:
                            "Pilih Peminjaman",
                            border:
                            OutlineInputBorder(),
                          ),
                          items:
                          data.map((e) {

                            return DropdownMenuItem(
                              value: e.id,
                              child:
                              Text(
                                e.id,
                                overflow:
                                TextOverflow.ellipsis,
                              ),
                            );
                          }).toList(),
                          onChanged:
                              (value) {

                            final selected =
                            data.firstWhere(
                                  (e) =>
                              e.id ==
                                  value,
                            );

                            setState(() {
                              selectedPeminjamanId =
                                  selected
                                      .id;

                              selectedAnggotaId =
                                  selected
                                      .idAnggota;
                            });
                          },
                        );
                      }

                      return const SizedBox();
                    },
                  ),

                const SizedBox(
                    height: 20),

                SizedBox(
                  width:
                  double.infinity,
                  child:
                  ElevatedButton(
                    onPressed:
                    isLoading
                        ? null
                        : _submit,
                    child: isLoading
                        ? const CircularProgressIndicator()
                        : Text(
                      isEdit
                          ? "Update"
                          : "Tambah",
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}