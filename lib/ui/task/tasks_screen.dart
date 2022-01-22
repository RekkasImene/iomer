import 'package:flutter/material.dart';
import 'package:iomer/ui/utils/info.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  //TODO a remplacer avec données (les memes que pour l'ecran first_screen)
  bool isChecked = false;

  List parts = [
    {
      'tache': 'verifer ecrou',
    },
    {
      'tache': 'completer le niveau d\'huile',
    },
    {
      'tache': 'changer les pneus',
    },
  ];

  late List<bool> _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = List<bool>.filled(parts.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maintenance'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Listes des taches a effectuer",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),
            Info(),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Liste des taches a effectuer :",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: ListView.builder(
                    itemCount: parts.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          CheckboxListTile(
                            title: Text(parts[index]['tache']),
                            value: _isChecked[index],
                            onChanged: (val) {
                              setState(
                                () {
                                  _isChecked[index] = val!;
                                },
                              );
                            },
                          ),
                        ],
                      );
                    },
                  )),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'valider',
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
