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
  bool isChecked = false;
  List<TextEditingController> _controller = [];
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
            listener: (context, state) {
              if (state is PartsLoaded) {
                for (int i = 0; i < state.reservation.length; i++) {
                  _controller.add(TextEditingController());
                  _controller[i].text =state.reservation[i].QTEARTICLE.toString();
                }
    }
            },
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
                                        onTap: () {
                                          _controller[index].text=(double.parse(_controller[index].text)-1).toString() ;
                                        },
                                        child: const Icon(
                                          Icons.remove,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 100,
                                        child: TextField(
                                          controller: _controller[index],

                                          keyboardType: TextInputType.number,
                                          decoration: const InputDecoration(
                                              border: OutlineInputBorder()),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          _controller[index].text=(double.parse(_controller[index].text)+1).toString() ;
                                        },
                                        child: const Icon(Icons.add),
                                      ),
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
