import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iomer/ui/machine/select_machine.dart';
import 'package:iomer/ui/utils/info.dart';
import 'package:iomer/ui/utils/matricule.dart';

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
          const SizedBox(height: 20),
          Info(),
          const SizedBox(height: 20),
          const Expanded(
            child: Matricule(),
          ),
          const SizedBox(height: 20),
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Temps d'intervention :",
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SelectMachine()),
                );
              },
              child: const Text('Clôturer OT', style: TextStyle(fontSize: 20)),
              style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
            ),
          ),
        ],
      ),
    );
  }
}
