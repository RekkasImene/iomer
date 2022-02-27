import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iomere/bloc/taches/taches_bloc.dart';
import 'package:iomere/config/injection.dart';
import 'package:iomere/models/bdd/iomere_database.dart';

class TaskList extends StatefulWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  bool isChecked = false;
  late TachesBloc _tachesBloc;
  late Tache selectedTache;

  @override
  void initState() {
    _tachesBloc = getIt.get<TachesBloc>();
    _tachesBloc.add(FetchTachesEvenet());
    log("Initialisation Task");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: BlocProvider(
          create: (context) => _tachesBloc,
          child: BlocBuilder<TachesBloc, TachesState>(builder: (context, state) {
            if (state is TachesLoaded) {
              return ListView.builder(
                itemCount: state.taches.length,
                itemBuilder: (context, index) {
                  selectedTache = state.taches[index];
                  log("ischecked = " + selectedTache.toString());
                  return CheckboxListTile(
                    title: Text(state.taches[index].LIBELLETACHE),
                    value: selectedTache.STATUTTACHE == 1,
                    onChanged: (bool? newValue) {
                      setState(
                        () {
                          log("la valeur de ischecked" +
                              selectedTache.STATUTTACHE.toString());

                          _tachesBloc.add(CheckedTachesEvenet(state
                              .taches[index]
                              .copyWith(STATUTTACHE: newValue! ? 1 : 0)));

                          log(newValue.toString());
                        },
                      );
                    },
                  );
                },
              );
            } else if (state is CheckTacheUpdated) {
              return ListView.builder(
                itemCount: state.taches.length,
                itemBuilder: (context, index) {
                  selectedTache = state.taches[index];
                  log("ischecked = " + selectedTache.toString());
                  return CheckboxListTile(
                    title: Text(state.taches[index].LIBELLETACHE),
                    value: selectedTache.STATUTTACHE == 1,
                    onChanged: (bool? newValue) {
                      setState(
                        () {
                          //log("la valeur de ischecked" + selectedTache.STATUTTACHE.toString());
                          _tachesBloc.add(CheckedTachesEvenet(state.taches[index].copyWith(STATUTTACHE: newValue! ? 1 : 0)));
                          //log(newValue.toString());
                        },
                      );
                    },
                  );
                },
              );
            } else if (state is TachesError) {
              return Text(state.message);
            }
            return const Center(
              child: SizedBox(
                  width: 32, height: 32, child: CircularProgressIndicator()),
            );
          }),
        ));
  }
}
