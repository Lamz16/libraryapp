import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libraryapp/features/denda/data/models/models/res/Denda_msg_response.dart';

import '../../../../core/state/result_state.dart';
import '../../../peminjaman/data/models/models/res/peminjaman_response.dart';
import '../../../peminjaman/presentation/bloc/peminjaman_bloc.dart' as peminjaman;
import '../../data/models/models/req/create_denda_req.dart';
import '../../data/models/models/req/update_denda_req.dart';
import '../../data/models/models/res/denda_response.dart';


import '../bloc/denda_bloc.dart'
as denda;
import 'denda_card.dart';
import 'denda_delete_dialog.dart';
import 'denda_detail_dialog.dart';
import 'denda_form_bottom_sheet.dart';

class DendaPage extends StatefulWidget {
  const DendaPage({super.key});

  @override
  State<DendaPage> createState() => _DendaPageState();
}

class _DendaPageState extends State<DendaPage> {
  @override
  void initState() {
    super.initState();

    context.read<denda.DendaBloc>()
        .add(denda.GetAllDenda());

    context.read<peminjaman.PeminjamanBloc>()
        .add(peminjaman.GetAllPeminjaman());
  }

  Future<void> _refresh() async {
    context.read<denda.DendaBloc>()
        .add(denda.GetAllDenda());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) {
              return const DendaFormBottomSheet();
            },
          );
        },
      ),
      body: BlocBuilder<
          denda.DendaBloc,
          denda.DendaState>(
        builder: (context, state) {
          final result = state.denda;

          if (result is ResultLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (result is ResultError<DendaResponse>) {
            return Center(
              child: Text(result.message),
            );
          }

          if (result is ResultLoaded<DendaResponse>) {
            final data = result.data.data;

            return RefreshIndicator(
              onRefresh: _refresh,
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: data.length,
                separatorBuilder: (_, __) =>
                const SizedBox(height: 12),
                itemBuilder: (_, index) {
                  final item = data[index];

                  return DendaCard(
                    item: item,
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) =>
                            DendaDetailDialog(
                              item: item,
                            ),
                      );
                    },
                    onEdit: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (_) =>
                            DendaFormBottomSheet(
                              item: item,
                            ),
                      );
                    },
                    onDelete: () {
                      showDialog(
                        context: context,
                        builder: (_) =>
                            DendaDeleteDialog(
                              id: item.idDenda,
                            ),
                      );
                    },
                  );
                },
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
