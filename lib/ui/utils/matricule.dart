import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Matricule extends StatefulWidget {
  const Matricule({Key? key}) : super(key: key);

  @override
  State<Matricule> createState() => _MatriculeState();
}

class _MatriculeState extends State<Matricule> {
  late List<bool> _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = List<bool>.filled(_texts.length, false);
  }

  //TODO a remplacer avec données (les memes que pour l'ecran first_screen)

  List<String> _texts = [
    "Jean Michelle",
    "Jean Pierre",
    "Pierre Jean",
    "Jean Marie Cecile",
    "Pierre",
    "Paul",
    "Jack"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        //padding: const EdgeInsets.all(16.0) ,
        child: ListView.builder(
          itemCount: _texts.length,
          itemBuilder: (context, index) {
            return CheckboxListTile(
              title: Text(_texts[index]),
              value: _isChecked[index],
              onChanged: (val) {
                setState(
                  () {
                    _isChecked[index] = val!;
                  },
                );
              },
            );
          },
        ));
  }
}
