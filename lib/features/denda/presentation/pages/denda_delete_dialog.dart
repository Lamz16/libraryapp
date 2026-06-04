import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/state/result_state.dart';
import '../../data/models/models/res/Denda_msg_response.dart';
import '../bloc/denda_bloc.dart' as denda;

class DendaDeleteDialog extends StatelessWidget {
  final String id;

  const DendaDeleteDialog({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<denda.DendaBloc, denda.DendaState>(
      listener: (context, state) {
        if (state.delete is ResultLoaded<DendaMsgResponse>) {
          final response =
              (state.delete as ResultLoaded).data;

          Navigator.pop(context);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(response.msg),
            ),
          );

          context.read<denda.DendaBloc>().add(
            denda.ResetDelete(),
          );

          context.read<denda.DendaBloc>().add(
            denda.GetAllDenda(),
          );
        }

        if (state.delete is ResultError<DendaMsgResponse>) {
          final error =
              (state.delete as ResultError).message;

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error),
            ),
          );
        }
      },
      builder: (context, state) {
        final isLoading =
        state.delete is ResultLoading<DendaMsgResponse>;

        return AlertDialog(
          title: const Text(
            "Delete Denda",
          ),
          content: const Text(
            "Apakah yakin ingin menghapus data ini?",
          ),
          actions: [
            TextButton(
              onPressed: isLoading
                  ? null
                  : () => Navigator.pop(context),
              child: const Text("Batal"),
            ),

            TextButton(
              onPressed: isLoading
                  ? null
                  : () {
                context
                    .read<denda.DendaBloc>()
                    .add(
                  denda.DeleteDenda(
                    id: id,
                  ),
                );
              },
              child: isLoading
                  ? const SizedBox(
                width: 18,
                height: 18,
                child:
                CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              )
                  : const Text("Delete"),
            ),
          ],
        );
      },
    );
  }
}