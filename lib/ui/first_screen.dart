/*import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iomer/bloc/matricule/matricule_bloc.dart';
import 'package:iomer/config/injection.dart';
import 'package:iomer/ui/select_machine.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  late MatriculeBloc _matriculeBloc;
  //TODO a remplacer avec données (les memes que pour l'ecran cloture)
  // final List<String> _texts = [
  //   "Jean Michelle",
  //   "Jean Pierre",
  //   "Pierre Jean",
  //   "Jean Marie Cecile",
  //   "Pierre",
  //   "Paul",
  //   "Jack"
  // ];

  late bool? ischecked;
  @override
  void initState() {
    _matriculeBloc = getIt.get<MatriculeBloc>();
    _matriculeBloc..add(FetchMatriculeEvenet());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iomer'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Sélectionner les intervenants :",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),

            expanded permet de remplir la place
            Expanded(
              child: Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  //padding: const EdgeInsets.all(16.0) ,
                  child: BlocProvider(
                    create: (context) => _matriculeBloc,
                    child: BlocBuilder<MatriculeBloc, MatriculeState>(
                      builder: (context, state) {
                        if (state is MatriculeLoaded) {
                          return ListView.builder(
                            itemCount: state.matricule.length,
                            itemBuilder: (context, index) {
                              ischecked = state.matricule[index].CHECKED;
                              log("ischecked = " + ischecked.toString());

                              return CheckboxListTile(
                                title:
                                    Text(state.matricule[index].NOMMATRICULE),
                                //  value: _isChecked[index],
                                value: ischecked,
                                onChanged: (newValue) {
                                  setState(
                                    () {
                                      ischecked = newValue!;

                                      log(ischecked.toString());
                                       _matriculeBloc.add(
                                          CheckedMatriculeEvenet(ischecked!));
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
                              width: 32,
                              height: 32,
                              child: CircularProgressIndicator()),
                        );
                      },
                    ),
                  )),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              //pour griser
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SelectMachine()),
                );
              },
              child: const Text('Valider'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
            ),
          ],
        ),
      ),
    );
  }
}*/
