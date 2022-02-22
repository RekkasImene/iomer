import 'package:flutter/material.dart';
import 'package:iomer/ui/machine/machine_screen.dart';

import 'package:iomer/ui/matricule/components/matricule.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
          const Expanded(
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: MatriculeWidget()),
          ),
          SizedBox(
            width: double.infinity,
            child: _buildButton(),
          )
        ],
      ),
    );
  }

  Widget _buildButton() {
    return ElevatedButton(
      child: const Text('Valider', style: TextStyle(fontSize: 20)),
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
      onPressed: () => [
        //choosedConfig = myController.text,
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MachineScreen(text: "")),
        )
      ],
    );
  }
}
