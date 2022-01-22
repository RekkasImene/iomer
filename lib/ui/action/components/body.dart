import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iomer/ui/utils/info.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Info(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  //pour griser
                  onPressed: () {},
                  //onPressed:(),
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
                  //pour griser
                  onPressed: () {},
                  //onPressed:(),
                  child: const Text(
                    'Saisir un compte rendu',
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
                  //pour griser
                  onPressed: () {},
                  //onPressed:(),
                  child: const Text(
                    'Taches à réaliser',
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
                  onPressed: () {},
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
