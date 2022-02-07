import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iomer/bloc/ot/ot_bloc.dart';
import 'package:iomer/config/injection.dart';
import 'package:iomer/ui/cloture/cloture_screen.dart';
import 'package:iomer/ui/parts/parts_screen.dart';
import 'package:iomer/ui/report/report_screen.dart';
import 'package:iomer/ui/task/tasks_screen.dart';
import 'package:iomer/ui/utils/info.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late OtBloc _otBloc;

  @override
  void initState() {
    _otBloc = getIt.get<OtBloc>();
    _otBloc.add(SelectEventOt()); /////////////////////incertain
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(children: [
        const Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Actions à réaliser : ",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Info(),
              ),
              Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PartsScreen()),
                            );
                          },
                          child: const Text(
                            'Pièces à changer',
                            style: TextStyle(fontSize: 20),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(20.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ReportScreen()),
                            );
                          },
                          child: const Text(
                            'Saisir un compte rendu',
                            style: TextStyle(fontSize: 20),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(20.0),
                          ),
                        ),
                      ),
                      BlocProvider<OtBloc>(
                        create: (context) => _otBloc,
                        child: BlocBuilder<OtBloc, OtState>(
                          builder: (context, state) {
                            if (state is OtSelected) {
                              if (state.ot.CODEOT != "null") {
                                return SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const TasksScreen()),
                                      );
                                    },
                                    //onPressed:(),
                                    child: const Text(
                                      'Taches à réaliser',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.all(20.0),
                                    ),
                                  ),
                                );
                              }
                            }
                            return const Center(
                              child: SizedBox()
                            );
                          },
                        ),
                      ),
                    ]),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ClotureOtScreen()),
                    );
                  },
                  child: const Text(
                    'Clôturer OT',
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
