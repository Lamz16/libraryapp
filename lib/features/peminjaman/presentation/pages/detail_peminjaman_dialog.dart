import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libraryapp/core/utils/helper.dart';
import 'package:libraryapp/features/peminjaman/data/models/models/res/peminjaman_detail_response.dart';

import '../../../../core/state/result_state.dart';
import '../bloc/peminjaman_bloc.dart';

class DetailPeminjamanDialog extends StatefulWidget {

  final String id;

  const DetailPeminjamanDialog({
    super.key,
    required this.id,
  });

  @override
  State<DetailPeminjamanDialog> createState() =>
      _DetailPeminjamanDialogState();
}

class _DetailPeminjamanDialogState
    extends State<DetailPeminjamanDialog> {

  @override
  void initState() {
    super.initState();

    context.read<PeminjamanBloc>()
        .add(GetDetailPeminjaman(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      title: const Text('Detail Peminjaman'),

      content: SizedBox(
        width: 400,
        child: BlocBuilder<PeminjamanBloc, PeminjamanState>(
          builder: (context, state) {

            final result = state.detailState;

            if(result is ResultLoading<PeminjamanDetailResponse>){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if(result is ResultLoaded<PeminjamanDetailResponse>){

              final data = result.data.data;

              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text("ID : ${data.id}"),
                  Text("Nama : ${data.anggota.nama}"),
                  Text("ID Anggota : ${data.anggota.idAnggota}"),
                  Text("Jaminan : ${data.jaminan}"),
                  Text("Tanggal Pinjam : ${dateOnly(data.tglPinjam)}"),
                  Text("Tanggal Kembali : ${dateOnly(data.tglHrsKembali)}"),
                  Text("Created : ${dateOnly(data.createdAt)}"),
                  Text("Updated : ${dateOnly(data.updatedAt)}"),
                ],
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}