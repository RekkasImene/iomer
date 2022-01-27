import 'package:flutter/material.dart';

class TaskList extends StatefulWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
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
    return Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
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
        ));
  }
}
