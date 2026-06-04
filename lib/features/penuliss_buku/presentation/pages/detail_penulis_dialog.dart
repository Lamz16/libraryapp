import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libraryapp/features/penuliss_buku/data/models/models/res/detail_penulis_response.dart';

import '../../../../core/state/result_state.dart';
import '../bloc/penulis_bloc.dart';

class DetailPenerbitDialog
    extends StatefulWidget {

  final String id;

  const DetailPenerbitDialog({
    super.key,
    required this.id,
  });

  @override
  State<DetailPenerbitDialog>
  createState() =>
      _DetailPenerbitDialogState();
}

class _DetailPenerbitDialogState
    extends State<
        DetailPenerbitDialog> {

  @override
  void initState() {
    super.initState();

    context.read<PenulisBloc>()
        .add(
      GetPenulisId(
        id: widget.id,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      title:
      const Text(
        "Detail Penerbit",
      ),

      content: SizedBox(
        width: 500,

        child: BlocBuilder<
            PenulisBloc,
            PenulisState>(
          builder: (context,state){

            final result =
                state.detailPenulis;

            if(result
            is ResultLoading<DetailPenulisResponse>){

              return const Center(
                child:
                CircularProgressIndicator(),
              );
            }

            if(result
            is ResultError<DetailPenulisResponse>){

              return Text(
                result.message,
              );
            }

            if(result
            is ResultLoaded<
                DetailPenulisResponse>){

              final data =
                  result.data.data;

              return Column(
                mainAxisSize:
                MainAxisSize.min,

                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  Text(
                    "ID : ${data.id}",
                  ),

                  const SizedBox(
                    height: 8,
                  ),

                  Text(
                    "Penulis : ${data.penulisBuku}",
                  ),

                  const SizedBox(
                    height: 8,
                  ),

                  Text(
                    "Email : ${data.emailPenulis}",
                  ),

                  const SizedBox(
                    height: 8,
                  ),

                  Text(
                    "Alamat : ${data.alamat}",
                  ),

                  const SizedBox(
                    height: 8,
                  ),

                  Text(
                    "Deskripsi : ${data.deskripsi}",
                  ),
                ],
              );
            }

            return const SizedBox();
          },
        ),
      ),

      actions: [

        TextButton(
          onPressed: (){
            Navigator.pop(
              context,
            );
          },
          child:
          const Text(
            "Tutup",
          ),
        ),
      ],
    );
  }
}