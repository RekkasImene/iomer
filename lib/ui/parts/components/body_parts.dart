import 'package:flutter/material.dart';
import 'package:iomer/ui/action/action_screen.dart';
import 'package:iomer/ui/new_part/new_part_screen.dart';
import 'package:iomer/ui/parts/components/list_parts.dart';
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
              "Pièces a changer",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Info(),
          ),
          const Expanded(
            child: ListParts(),
          ),
          Row(
            children: [
              const Expanded(child: SizedBox()),
              Align(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NewPartScreen()),
                    );
                  },
                  child: const Text('Ajout'),
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10)),
                ),
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Valider', style: TextStyle(fontSize: 20)),
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
