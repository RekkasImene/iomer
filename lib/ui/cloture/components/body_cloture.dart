import 'package:flutter/material.dart';
import 'package:iomer/bloc/matricule/matricule_bloc.dart';
import 'package:iomer/bloc/taches/taches_bloc.dart';
import 'package:iomer/config/injection.dart';
import 'package:iomer/models/bdd/iomer_database.dart';
import 'package:iomer/ui/machine/machine_screen.dart';
import 'package:iomer/ui/utils/info.dart';
import 'package:iomer/ui/matricule/components/matricule.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController dtOpenController = TextEditingController();
  late Matricule selectedMatricule;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Clôture de l'OT :",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Info(),
          ),
          const Expanded(
            child: MatriculeWidget(),
          ),
           Container(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:  [
                  Column(
                    children:  [
                      Text(" Début d'intervention : "),
                      TextField(
                        controller: dtOpenController,
                      )
                    ],
                  ),
                  Column(
                    children: const [
                      Text(" Fin d'intervention : "),
                    ],
                  ),
                  ]
            )
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MachineScreen(text: "")),
                );
              },
              child: const Text('Clôturer OT', style: TextStyle(fontSize: 20)),
              style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
            ),
          ),
        ],
      ),
    );
  }
}
