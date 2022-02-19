import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iomer/bloc/ot/ot_bloc.dart';
import 'package:iomer/config/injection.dart';
import 'package:iomer/ui/cloture/cloture_screen.dart';
import 'package:iomer/ui/parts/parts_screen.dart';
import 'package:iomer/ui/report/report_screen.dart';
import 'package:iomer/ui/task/tasks_screen.dart';
import 'package:iomer/ui/utils/info.dart';
import 'package:iomer/ui/utils/nav_button.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late OtBloc _otBloc;

  @override
  void initState() {
    _otBloc = getIt.get<OtBloc>();
    _otBloc.add(SelectEventOt());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
          children: [
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
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                /// affiche un bandeau d'information sur l'ot en cours
                child: Info(),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    /// bouton pour acceder au pieces
                    const NavButton(
                      navDestination: PartsScreen(),
                      navName: "Pièces à changer",
                    ),

                    /// bouton pour editer un cpt rendu
                    const NavButton(
                      navDestination: ReportScreen(),
                      navName: "Saisir un compte rendu",
                    ),

                    /// bouton pour acceder au taches si l'ot est prèvue
                    /// sinon rien ne s'affiche
                    BlocProvider<OtBloc>(
                      create: (context) => _otBloc,
                      child: BlocBuilder<OtBloc, OtState>(
                        builder: (context, state) {
                          if (state is OtSelected) {
                            if (state.ot.CODEOT != "null") {
                              return const NavButton(
                                navDestination: TasksScreen(),
                                navName: "Taches à réaliser",
                              );
                            }
                          }
                          return const Center(child: SizedBox());
                        },
                      ),
                    ),
                  ],
                ),
              ),

    /// bouton pour cloturer l'Ot actif
    const NavButton(
    navDestination: ClotureOtScreen(),
    navName: "Clôturer OT",
    ),
            ],
          ),
        ),
          ]),
    );
  }
}
