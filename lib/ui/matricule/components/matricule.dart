import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iomere/bloc/matricule/matricule_bloc.dart';
import 'package:iomere/config/injection.dart';
import 'package:iomere/models/bdd/iomer_database.dart';

class MatriculeWidget extends StatefulWidget {
  const MatriculeWidget({Key? key}) : super(key: key);

  @override
  State<MatriculeWidget> createState() => _MatriculeState();
}

class _MatriculeState extends State<MatriculeWidget> {
  bool isChecked = false;
  late MatriculeBloc _matriculeBloc;
  late Matricule selectedMatricule;

  @override
  void initState() {
    _matriculeBloc = getIt.get<MatriculeBloc>();
    _matriculeBloc.add(FetchMatriculeEvenet());
    log("Initialisation : Matricule");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //SizedBox(height: 10,),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.black)),


                child: BlocProvider(
                  create: (context) => _matriculeBloc,
                  child: BlocBuilder<MatriculeBloc, MatriculeState>(
                    builder: (context, state) {

                      if (state is MatriculeLoaded) {
                        return ListView.builder(
                          itemCount: state.matricules.length,
                          itemBuilder: (context, index) {
                            selectedMatricule = state.matricules[index];
                            return CheckboxListTile(
                              title: Text(state.matricules[index].NOMMATRICULE),
                              value: selectedMatricule.CHECKED==1,
                              onChanged: (bool? newValue) {
                                    log("la valeur de ischecked" +
                                        selectedMatricule.CHECKED.toString());

                                    _matriculeBloc.add(CheckedMatriculeEvenet(
                                        state.matricules[index].copyWith(
                                            CHECKED: newValue! ? 1 : 0)));

                                    log(newValue.toString());
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
                              value: selectedMatricule.CHECKED == 1,
                              onChanged: (bool? newValue) {
                                    _matriculeBloc.add(CheckedMatriculeEvenet(
                                        state.matricules[index].copyWith(CHECKED: newValue! ? 1 : 0)));
                              },
                            );
                          },
                        );
                      } else if (state is MatriculeError) {
                        return Text(state.message);
                      }
                      return const Center(
                        child: SizedBox(
                            width: 32,
                            height: 32,
                            child: CircularProgressIndicator()),
                      );
                    },
                  ),
                )),
          ),
        ),
      ],
    );
  }
}

