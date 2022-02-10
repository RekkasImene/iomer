import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iomer/bloc/parts/parts_bloc.dart';
import 'package:iomer/config/injection.dart';

class ListParts extends StatefulWidget {
  const ListParts({Key? key}) : super(key: key);

  @override
  State<ListParts> createState() => _ListPartsState();
}

class _ListPartsState extends State<ListParts> {
  //TODO a remplacer avec données (les memes que pour l'ecran first_screen)
  bool isChecked = false;
  final TextEditingController eCtrl = new TextEditingController();
  late TextEditingController myController;
  late PartsBloc _partsBloc;
  @override
  void initState() {
    myController=TextEditingController();
    _partsBloc = getIt.get<PartsBloc>();
    _partsBloc.add(FetchEventParts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      child: BlocProvider<PartsBloc>(
        create: (context) => _partsBloc,
        child: BlocConsumer<PartsBloc, PartsState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is PartsLoaded) {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.reservation.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ListTile(
                                title: Text(state.reservation[index].CODEARTICLE
                                    .toString()),
                                subtitle: Text(
                                    state.reservation[index].LIBELLEARTICLE),
                                trailing: SizedBox(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: const Icon(
                                          Icons.remove,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 75,
                                        height: 40,
                                        child: TextField(
                                          controller: eCtrl,
                                          maxLength: null,
                                          keyboardType: TextInputType.number,
                                          decoration: const InputDecoration(
                                              border: OutlineInputBorder()),
                                        ),
                                      ),
                                      Text(state.reservation[index].QTEARTICLE
                                          .toString()),
                                      InkWell(
                                        onTap: () {},
                                        child: const Icon(Icons.add),
                                      ),
                                      /*
                                      InkWell(
                                        onTap: () {},
                                        child: const Icon(Icons.refresh),
                                      ),

                                       */
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                );
              } else if (state is PartsError) {
                return Text(state.message);
              }
              return const Center(
                child: SizedBox(
                    width: 32, height: 32, child: CircularProgressIndicator()),
              );
            }),
      ),
    );
  }
}
