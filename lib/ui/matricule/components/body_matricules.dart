import 'package:flutter/material.dart';
import 'package:iomer/ui/machine/machine_screen.dart';
import 'package:iomer/ui/matricule/components/matricule.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: const [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Sélectionner les intervenants :",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Expanded(
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: MatriculeWidget()),
          ),
        ],
      ),
    );
  }
}
