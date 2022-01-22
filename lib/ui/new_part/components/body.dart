import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iomer/ui/parts/parts_screen.dart';
import 'package:iomer/ui/utils/info.dart';

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
              "ajout pièce",
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 20),
          Info(),
          const SizedBox(height: 20),
          Container(
            decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: const [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "N° Pièce: ",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Libellé pièce : ",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Quantité :",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Scan Pièce', style: TextStyle(fontSize: 20)),
              style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Voir', style: TextStyle(fontSize: 20)),
              style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
            ),
          ),
          Expanded(
            child: Container(),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PartsScreen()),
                );
              },
              child: const Text('Valider', style: TextStyle(fontSize: 20)),
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
