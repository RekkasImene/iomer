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
      'code': 'test1',
      'libelle': 'test3 NU315',
      'quantite': '2',
    },
    {
      'code': 'test2',
      'libelle': 'test3 YT20',
      'quantite': '5',
    },
    {
      'code': 'test3',
      'libelle': 'test3 PT150',
      'quantite': '1',
    },
    {
      'code': 'test4',
      'libelle': 'test3 NU315',
      'quantite': '2',
    },
  ];

  @override
  void initState() {
    super.initState();
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
              ListTile(
                title: Text(parts[index]['code']),
                subtitle: Text(parts[index]['libelle']),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.remove,
                      ),
                    ),
                    Text(parts[index]['quantite']),
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.add,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.refresh,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
