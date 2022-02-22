

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iomer/bloc/ot/ot_bloc.dart';
import 'package:iomer/models/bdd/iomer_database.dart';
import 'package:iomer/ui/home/home_screen.dart';

import '../journal_screen.dart';

class ListOtStateWidget extends StatefulWidget{
  String codeMachine;
  OtBloc otblc;

  ListOtStateWidget({Key? key, required this.codeMachine, required this.otblc})
      : super(key: key);



  @override
  State<ListOtStateWidget> createState() => _ListOtStateWidgetState();
}

class _ListOtStateWidgetState extends State<ListOtStateWidget> {
  late Ot choosedOt;
  bool _isDone= false;
  StreamController<List<Ot>> otList = StreamController();


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0),
          child: Text(
            'Listes des ordres de travaux',
            style: TextStyle(fontSize: 18),
          ),
        ),
        Expanded(
          child: BlocProvider<OtBloc>(
              create: (context) => widget.otblc,
              child: BlocListener<OtBloc, OtState>(
                  listener: (context, state) {
                    if (state is OtLoaded) {
                      otList.add(state.ots);
                    } else if (state is OtError) {
                      Text(state.message);
                    }
                  },
                  child: Container(
                    decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Column(
                      children: [
                        Expanded(
                          child: StreamBuilder<List<Ot>>(
                              stream: otList.stream,
                              builder: (BuildContext context,
                                  AsyncSnapshot<dynamic> snapshot) {
                                if (!snapshot.hasData) {
                                  return const Center(
                                    child: SizedBox(
                                        width: 32,
                                        height: 32,
                                        child: CircularProgressIndicator()),
                                  );
                                } else {
                                  return listOt(snapshot);
                                }
                              }),
                        ),
                      ],
                    ),
                  ))),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,

          /// bouton pour actualiser la page et préremplir les champs
          child: ElevatedButton(
            child:
            const Text('Synchroniser', style: TextStyle(fontSize: 20)),
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    horizontal: 50, vertical: 20)),
            onPressed: () => [
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const HomeScreen()),
              )
            ],
          ),
        )
      ],
    );
  }


  Widget listOt(AsyncSnapshot snapshot) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(snapshot.data[index].LIBELLEOT),
                leading: _isDone ? Icon(Icons.block,color: Colors.red,) : Icon(Icons.check,color: Colors.green,),
              );
            },
          ),
        ),
      ],
    );
  }
}