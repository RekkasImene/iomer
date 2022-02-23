import 'package:flutter/material.dart';
import 'package:iomer/ui/machine/machine_screen.dart';

import 'package:iomer/ui/matricule/components/matricule.dart';
import 'package:iomer/ui/utils/nav_button.dart';

import '../../../models/bdd/iomer_database.dart';

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
        children: const [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Selectionner les intervenants :",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Expanded(
            child: MatriculeWidget(),
          ),
          NavButton(
            navDestination: MachineScreen(),
            navName: "Valider",
          ),
        ],
      ),
    );
  }
}
