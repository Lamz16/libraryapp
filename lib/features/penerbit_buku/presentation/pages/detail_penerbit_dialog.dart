import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libraryapp/core/utils/helper.dart';
import 'package:libraryapp/features/penerbit_buku/data/models/models/res/detail_penerbit_response.dart';

import '../../../../core/state/result_state.dart';
import '../bloc/penerbit_bloc.dart';

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

    context.read<PenerbitBloc>()
        .add(
      GetDetailPenerbit(
        id: widget.id,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      title: const Text(
        "Detail Penerbit",
      ),

      content: SizedBox(
        width: 500,

        child: BlocBuilder<
            PenerbitBloc,
            PenerbitState>(
          builder: (context,state){

            final result =
                state.detail;

            if(result
            is ResultLoading<DetailPenerbitResponse>){
              return const Center(
                child:
                CircularProgressIndicator(),
              );
            }

            if(result
            is ResultError<DetailPenerbitResponse>){
              return Text(
                result.message,
              );
            }

            if(result
            is ResultLoaded<
                DetailPenerbitResponse>){

              final data =
                  result.data.data;

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  mainAxisSize:
                  MainAxisSize.min,

                  children: [

                    _item(
                      "ID",
                      data.id,
                    ),

                    _item(
                      "Nama Penerbit",
                      data.penerbitBuku,
                    ),

                    _item(
                      "Alamat",
                      data.alamatPenerbit,
                    ),

                    _item(
                      "Email",
                      data.emailPenerbit,
                    ),

                    _item(
                      "Telepon",
                      data.telpPenerbit,
                    ),

                    _item(
                      "Deskripsi",
                      data.deskripsiPenerbit,
                    ),

                    _item(
                      "Updated At",
                      dateOnly(data.updatedAt),
                    ),
                  ],
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),

      actions: [

        TextButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: const Text(
            "Tutup",
          ),
        ),
      ],
    );
  }

  Widget _item(
      String title,
      String value,
      ) {
    return Padding(
      padding:
      const EdgeInsets.only(
        bottom: 12,
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [

          Text(
            title,
            style:
            const TextStyle(
              fontWeight:
              FontWeight.bold,
            ),
          ),

          const SizedBox(
            height: 4,
          ),

          Text(value),
        ],
      ),
    );
  }
}