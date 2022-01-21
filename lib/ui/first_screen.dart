import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iomer/bloc/workers/workers_bloc.dart';
import 'package:iomer/config/injection.dart';
import 'package:iomer/ui/select_machine.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  late WorkersBloc _workersBloc;
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
  late List<bool> _isChecked;

  @override
  void initState() {
    _workersBloc = getIt.get<WorkersBloc>();
    _workersBloc..add(FetchWorkerEvenet());
    super.initState();
    //_isChecked = List<bool>.filled(_texts.length, false);
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

            /*expanded permet de remplir la place*/
            Expanded(
              child: Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  //padding: const EdgeInsets.all(16.0) ,
                  child: BlocProvider(
                    create: (context) => _workersBloc,
                    child: BlocBuilder<WorkersBloc, WorkersState>(
                      builder: (context, state) {
                        if (state is WorkerLoaded) {
                          return ListView.builder(
                            itemCount: state.matricule.length,
                            itemBuilder: (context, index) {
                              _isChecked = List<bool>.filled(
                                  state.matricule[index].NOMMATRICULE.length,
                                  true);
                              return CheckboxListTile(
                                title:
                                    Text(state.matricule[index].NOMMATRICULE),
                                value: _isChecked[index],
                                onChanged: (val) {
                                  setState(
                                    () {
                                      _isChecked[index] = val!;
                                    },
                                  );
                                },
                              );
                            },
                          );
                        } else if (state is WorkerError) {
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
}
