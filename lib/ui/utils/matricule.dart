import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iomer/bloc/matricule/matricule_bloc.dart';
import 'package:iomer/config/injection.dart';
import 'package:iomer/models/bdd/iomer_database.dart';

class MatriculeWidget extends StatefulWidget {
  const MatriculeWidget({Key? key}) : super(key: key);

  @override
  State<MatriculeWidget> createState() => _MatriculeState();
}

class _MatriculeState extends State<MatriculeWidget> {
  late MatriculeBloc _matriculeBloc;
  late Matricule selectedMatricule;

  @override
  void initState() {
    _matriculeBloc = getIt.get<MatriculeBloc>();
    _matriculeBloc.add(FetchMatriculeEvenet());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        //padding: const EdgeInsets.all(16.0) ,
        child: BlocProvider(
          create: (context) => _matriculeBloc,
          child: BlocBuilder<MatriculeBloc, MatriculeState>(
            builder: (context, state) {
              if (state is MatriculeLoaded) {
                return ListView.builder(
                  itemCount: state.matricules.length,
                  itemBuilder: (context, index) {
                    selectedMatricule = state.matricules[index];
                    log("ischecked = " + selectedMatricule.toString());

                    return CheckboxListTile(
                      title: Text(state.matricules[index].NOMMATRICULE),
                      //  value: _isChecked[index],
                      value: selectedMatricule.CHECKED,
                      onChanged: (bool? newValue) {
                        setState(
                          () {
                            // ischecked = newValue!;
                            log("la valeur de ischecked" +
                                selectedMatricule.CHECKED.toString());

                            _matriculeBloc.add(CheckedMatriculeEvenet(state
                                .matricules[index]
                                .copyWith(CHECKED: newValue)));

                            log(newValue.toString());
                          },
                        );
                      },
                    );
                  },
                );
              } else if (state is CheckMatriculeUpdated) {
                return ListView.builder(
                  itemCount: state.matricules.length,
                  itemBuilder: (context, index) {
                    selectedMatricule = state.matricules[index];

                    return CheckboxListTile(
                      title: Text(state.matricules[index].NOMMATRICULE),
                      //  value: _isChecked[index],
                      value: selectedMatricule.CHECKED,
                      onChanged: (bool? newValue) {
                        setState(
                          () {
                            // ischecked = newValue!;

                            _matriculeBloc.add(CheckedMatriculeEvenet(state
                                .matricules[index]
                                .copyWith(CHECKED: newValue)));
                          },
                        );
                      },
                    );
                  },
                );
              } else if (state is MatriculeError) {
                return Text(state.message);
              }
              return const Center(
                child: SizedBox(
                    width: 32, height: 32, child: CircularProgressIndicator()),
              );
            },
          ),
        ));
  }
}
