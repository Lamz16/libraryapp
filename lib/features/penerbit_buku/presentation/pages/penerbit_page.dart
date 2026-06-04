import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libraryapp/features/penerbit_buku/data/models/models/res/penerbit_delete_response.dart';
import 'package:libraryapp/features/penerbit_buku/data/models/models/res/penerbit_msg_response.dart';
import 'package:libraryapp/features/penerbit_buku/presentation/pages/add_penerbit_dialog.dart';
import 'package:libraryapp/features/penerbit_buku/presentation/pages/edit_penerbit_dialog.dart';

import '../../../../core/state/result_state.dart';
import '../../data/models/models/res/penerbit_response.dart';
import '../bloc/penerbit_bloc.dart';
import 'detail_penerbit_dialog.dart';

class PenerbitPage extends StatefulWidget {
  const PenerbitPage({super.key});

  @override
  State<PenerbitPage> createState() =>
      _PenerbitPageState();
}

class _PenerbitPageState
    extends State<PenerbitPage> {

  @override
  void initState() {
    super.initState();

    context.read<PenerbitBloc>()
        .add(GetAllPenerbit());
  }

  Future<void> _refresh() async {
    context.read<PenerbitBloc>()
        .add(GetAllPenerbit());
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      floatingActionButton:
      FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) =>
            const AddPenerbitDialog(),
          );
        },
        child: const Icon(Icons.add),
      ),

      body: MultiBlocListener(
        listeners: [

          // create

          BlocListener<
              PenerbitBloc,
              PenerbitState>(
            listenWhen: (p,c) =>
            p.create != c.create,

            listener: (context,state){

              final result =
                  state.create;

              if(result
              is ResultLoaded<PenerbitMsgResponse>){

                Navigator.pop(context);

                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  SnackBar(
                    content: Text(
                      result.data.status,
                    ),
                  ),
                );

                context.read<PenerbitBloc>()
                  ..add(ResetCreate())
                  ..add(GetAllPenerbit());
              }

              if(result
              is ResultError<PenerbitMsgResponse>){

                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  SnackBar(
                    content: Text(
                      result.message,
                    ),
                  ),
                );

                context.read<PenerbitBloc>()
                    .add(ResetCreate());
              }
            },
          ),

          // update

          BlocListener<
              PenerbitBloc,
              PenerbitState>(
            listenWhen: (p,c) =>
            p.update != c.update,

            listener: (context,state){

              final result =
                  state.update;

              if(result
              is ResultLoaded<PenerbitMsgResponse>){

                Navigator.pop(context);

                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  SnackBar(
                    content: Text(
                      result.data.status,
                    ),
                  ),
                );

                context.read<PenerbitBloc>()
                  ..add(ResetUpdate())
                  ..add(GetAllPenerbit());
              }

              if(result
              is ResultError<PenerbitMsgResponse>){

                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  SnackBar(
                    content: Text(
                      result.message,
                    ),
                  ),
                );

                context.read<PenerbitBloc>()
                    .add(ResetUpdate());
              }
            },
          ),

          // delete

          BlocListener<
              PenerbitBloc,
              PenerbitState>(
            listenWhen: (p,c) =>
            p.delete != c.delete,

            listener: (context,state){

              final result =
                  state.delete;

              if(result
              is ResultLoaded<PenerbitDeleteResponse>){

                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  SnackBar(
                    content: Text(
                      result.data.msg,
                    ),
                  ),
                );

                context.read<PenerbitBloc>()
                  ..add(ResetDelete())
                  ..add(GetAllPenerbit());
              }

              if(result
              is ResultError<PenerbitDeleteResponse>){

                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  SnackBar(
                    content: Text(
                      result.message,
                    ),
                  ),
                );

                context.read<PenerbitBloc>()
                    .add(ResetDelete());
              }
            },
          ),
        ],

        child: BlocBuilder<
            PenerbitBloc,
            PenerbitState>(
          builder: (context,state){

            final result =
                state.penerbits;

            if(result is ResultLoading){
              return const Center(
                child:
                CircularProgressIndicator(),
              );
            }

            if(result is ResultError<PenerbitResponse>){
              return Center(
                child: Text(
                  result.message,
                ),
              );
            }

            if(result
            is ResultLoaded<PenerbitResponse>){

              final items =
                  result.data.data;

              if(items.isEmpty){
                return const Center(
                  child:
                  Text("Belum ada data"),
                );
              }

              return RefreshIndicator(
                onRefresh: _refresh,

                child: ListView.builder(
                  padding:
                  const EdgeInsets.all(16),

                  itemCount:
                  items.length,

                  itemBuilder:
                      (context,index){

                    final item =
                    items[index];

                    return Card(
                      child: ListTile(

                        onTap: (){
                          showDialog(
                            context: context,
                            builder: (_) =>
                                DetailPenerbitDialog(
                                  id: item.id,
                                ),
                          );
                        },

                        title: Text(
                          item.penerbitBuku,
                        ),

                        subtitle: Text(
                          item.emailPenerbit,
                        ),

                        trailing: Row(
                          mainAxisSize:
                          MainAxisSize.min,

                          children: [

                            IconButton(
                              onPressed: (){
                                showDialog(
                                  context: context,
                                  builder: (_) =>
                                      EditPenerbitDialog(
                                        penerbit:
                                        item,
                                      ),
                                );
                              },
                              icon:
                              const Icon(
                                Icons.edit,
                              ),
                            ),

                            IconButton(
                              onPressed: (){
                                _delete(
                                  item.id,
                                );
                              },
                              icon:
                              const Icon(
                                Icons.delete,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }

  void _delete(String id){

    showDialog(
      context: context,
      builder: (_) {

        return AlertDialog(
          title: const Text(
            "Hapus Data",
          ),

          content: const Text(
            "Yakin ingin menghapus data?",
          ),

          actions: [

            TextButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child:
              const Text(
                "Batal",
              ),
            ),

            ElevatedButton(
              onPressed: (){
                Navigator.pop(context);

                context
                    .read<PenerbitBloc>()
                    .add(
                  DeletePenerbit(
                    id: id,
                  ),
                );
              },
              child:
              const Text(
                "Hapus",
              ),
            ),
          ],
        );
      },
    );
  }
}