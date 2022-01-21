import 'package:flutter/material.dart';
import 'package:iomer/ui/select_machine.dart';

class ClotureOtScreen extends StatefulWidget {
  const ClotureOtScreen({Key? key}) : super(key: key);

  @override
  State<ClotureOtScreen> createState() => _ClotureOtScreenState();
}

class _ClotureOtScreenState extends State<ClotureOtScreen> {
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

  late List<bool> _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = List<bool>.filled(_texts.length, false);
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
                "Clôture de l'OT :",
                style: TextStyle(fontSize: 20),
              ),
            ),
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
                      "N° OT: ",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Maintenance :",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
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
                  )),
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
                child: const Text('Clôturer OT'),
                style: ElevatedButton.styleFrom(
                    primary: Colors.green,
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
