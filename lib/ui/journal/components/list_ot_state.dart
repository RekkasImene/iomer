import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iomere/bloc/journal/journal_bloc.dart';
import 'package:iomere/bloc/ot/ot_bloc.dart';
import 'package:iomere/models/bdd/iomere_database.dart';
import 'package:iomere/ui/home/home_screen.dart';

import '../../../bloc/journal/journal_event.dart';


class ListOtStateWidget extends StatefulWidget{
  JournalBloc journalbloc;

  ListOtStateWidget({Key? key, required this.journalbloc}) : super(key: key);

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
          child: BlocProvider(
              create: (context) => widget.journalbloc..add(FetchEventJournal()),
              child: BlocConsumer<JournalBloc, JournalState>(
                listener: (context,state) {
                  if(state is JournalStatePushSuccess) {
                    showToast(state.message);
                  } else if (state is JournalStatePushFail) {
                    showToast(state.message);
                  }
                },
                builder: (context, state) {
                  if(state is JounalStateLoaded){
                    return listOt(state.ots);
                  } else {
                    return const SizedBox() ;
                  }
                }
                ),
          ),
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
              widget.journalbloc.add(JournalEventSynchronisation())
            ],
          ),
        )
      ],
    );
  }


  Widget listOt(List<Ot> listot) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: listot.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(listot[index].LIBELLEOT),
                leading: listot[index].DTCLOSOT == null ? const Icon(Icons.block,color: Colors.red,) : const Icon(Icons.check,color: Colors.green,),
              );
            },
          ),
        ),
      ],
    );
  }
}

void showToast(String message) {
  Fluttertoast.showToast(msg: message);
}