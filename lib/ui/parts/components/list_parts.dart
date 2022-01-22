import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListParts extends StatefulWidget {
  const ListParts({Key? key}) : super(key: key);

  @override
  State<ListParts> createState() => _ListPartsState();
}

class _ListPartsState extends State<ListParts> {
  //TODO a remplacer avec données (les memes que pour l'ecran first_screen)
  bool isChecked = false;

  List parts = [
    {
      'code': '1600315NU',
      'libelle': 'Roulement NU315',
      'quantite': '2',
    },
    {
      'code': '173529DT',
      'libelle': 'phare YT20',
      'quantite': '5',
    },
    {
      'code': '07362836YHl',
      'libelle': 'rouage PT150',
      'quantite': '1',
    },
    {
      'code': '1600315NU',
      'libelle': 'Roulement NU315',
      'quantite': '2',
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
        //padding: const EdgeInsets.all(16.0) ,
        child: ListView.builder(
          itemCount: parts.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                CheckboxListTile(
                  title: Text(parts[index]['code']),
                  subtitle: Text(parts[index]['libelle']),
                  //secondary: Text (parts[index]['quantite'],

                  value: _isChecked[index],
                  onChanged: (val) {
                    setState(
                      () {
                        _isChecked[index] = val!;
                      },
                    );
                  },
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.remove,
                        size: 16,
                      )),
                  Text(parts[index]['quantite']),
                  InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.add,
                        size: 16,
                      )),
                ]),
              ],
            );
          },
        ));
  }
}
