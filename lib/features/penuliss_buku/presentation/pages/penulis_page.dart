import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:libraryapp/features/penuliss_buku/data/models/models/res/penulis_response.dart';

import '../../../../core/state/result_state.dart';
import '../../data/models/models/res/penulis_delete_response.dart';
import '../../data/models/models/res/penulis_msg_response.dart';
import '../bloc/penulis_bloc.dart';
import 'add_penulis_dialog.dart';
import 'detail_penulis_dialog.dart';
import 'edit_penulis_dialog.dart';

class PenulisPage extends StatefulWidget {
  const PenulisPage({super.key});

  @override
  State<PenulisPage> createState() =>
      _PenulisPageState();
}

class _PenulisPageState
    extends State<PenulisPage> {

  @override
  void initState() {
    super.initState();

    context.read<PenulisBloc>()
        .add(GetPenulis());
  }

  Future<void> _refresh() async {
    context.read<PenulisBloc>()
        .add(GetPenulis());
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
              PenulisBloc,
              PenulisState>(
            listenWhen: (p,c)=>
            p.createPenulis !=
                c.createPenulis,

            listener: (context,state){

              final createState =
                  state.createPenulis;

              if(createState
              is ResultLoaded<
                  PenulisMsgResponse>){

                Navigator.pop(context);

                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  SnackBar(
                    content: Text(
                      createState.data.status,
                    ),
                  ),
                );

                context.read<PenulisBloc>()
                  ..add(ResetCreate())
                  ..add(GetPenulis());
              }

              if(createState
              is ResultError<PenulisMsgResponse>){

                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  SnackBar(
                    content:
                    Text(createState.message),
                  ),
                );

                context.read<PenulisBloc>()
                    .add(ResetCreate());
              }
            },
          ),

          // update

          BlocListener<
              PenulisBloc,
              PenulisState>(
            listenWhen: (p,c)=>
            p.updatePenulis !=
                c.updatePenulis,

            listener: (context,state){

              final updateState =
                  state.updatePenulis;

              if(updateState
              is ResultLoaded<
                  PenulisMsgResponse>){

                Navigator.pop(context);

                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  SnackBar(
                    content: Text(
                      updateState.data.status,
                    ),
                  ),
                );

                context.read<PenulisBloc>()
                  ..add(ResetUpdate())
                  ..add(GetPenulis());
              }

              if(updateState
              is ResultError<PenulisMsgResponse>){

                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  SnackBar(
                    content:
                    Text(updateState.message),
                  ),
                );

                context.read<PenulisBloc>()
                    .add(ResetUpdate());
              }
            },
          ),

          // delete
          BlocListener<
              PenulisBloc,
              PenulisState>(
            listenWhen: (p,c)=>
            p.deletePenulis !=
                c.deletePenulis,

            listener: (context,state){

              final deleteState =
                  state.deletePenulis;

              if(deleteState
              is ResultLoaded<
                  PenulisDeleteResponse>){

                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  SnackBar(
                    content: Text(
                      deleteState.data.msg,
                    ),
                  ),
                );

                context.read<PenulisBloc>()
                  ..add(ResetDelete())
                  ..add(GetPenulis());
              }

              if(deleteState
              is ResultError<PenulisDeleteResponse>){

                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  SnackBar(
                    content:
                    Text(deleteState.message),
                  ),
                );

                context.read<PenulisBloc>()
                    .add(ResetDelete());
              }
            },
          ),
        ],

        child: BlocBuilder<
            PenulisBloc,
            PenulisState>(
          builder: (context,state){

            final result =
                state.penulis;

            if(result
            is ResultLoading<PenulisResponse>){

              return const Center(
                child:
                CircularProgressIndicator(),
              );
            }

            if(result
            is ResultError<PenulisResponse>){

              return Center(
                child: Text(
                  result.message,
                ),
              );
            }

            if(result
            is ResultLoaded<
                PenulisResponse>){

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

                  itemCount: items.length,

                  itemBuilder: (_,i){

                    final item =
                    items[i];

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

                        title:
                        Text(item.penulisBuku),

                        subtitle:
                        Text(item.emailPenulis),

                        trailing: Row(
                          mainAxisSize:
                          MainAxisSize.min,

                          children: [

                            IconButton(
                              icon: const Icon(
                                Icons.edit,
                              ),
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
                            ),

                            IconButton(
                              icon: const Icon(
                                Icons.delete,
                              ),
                              onPressed: (){
                                _delete(
                                  item.id,
                                );
                              },
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
          title:
          const Text("Hapus Data"),

          content:
          const Text(
            "Yakin ingin menghapus data ini?",
          ),

          actions: [

            TextButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child:
              const Text("Batal"),
            ),

            ElevatedButton(
              onPressed: (){
                Navigator.pop(context);

                context
                    .read<PenulisBloc>()
                    .add(
                  DeletePenulis(
                    id: id,
                  ),
                );
              },
              child:
              const Text("Hapus"),
            ),
          ],
        );
      },
    );
  }
}