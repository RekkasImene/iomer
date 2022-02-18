import 'package:flutter/material.dart';
import 'package:iomer/ui/cloture/components/cloture_matricule.dart';
import 'package:iomer/ui/machine/machine_screen.dart';
import 'package:iomer/ui/utils/info.dart';
import 'package:iomer/ui/matricule/components/matricule.dart';
import 'package:iomer/ui/utils/nav_button.dart';

class Body extends StatelessWidget {

  const Body({Key? key}) : super(key: key);



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
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Info(),
          ),
          const Expanded(
            child: ClotureMatriculeWidget(),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Temps d'intervention :",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          NavButton(
            navDestination: const MachineScreen(),
            navName: "Clôturer OT",
          ),
        ],
      ),
    );
  }
}
