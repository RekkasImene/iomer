import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget{
  const FirstScreen({Key? key}):super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  //TODO a remplacer avec données (les memes que pour l'ecran cloture)
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
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iomer'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Sélectionner les intervenants :",style: TextStyle(fontSize: 20),
              ),

            ),
            const SizedBox(height: 20),

            /*expanded permet de remplir la place*/
            Expanded(
              child: Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                  //padding: const EdgeInsets.all(16.0) ,
                  child: ListView.builder(
                    itemCount: _texts.length,
                    itemBuilder: (context, index) {
                      return CheckboxListTile(
                        title: Text(_texts[index]),
                        value: _isChecked[index],
                        onChanged: (val) {
                          setState(() {
                            _isChecked[index] = val!;
                          },
                          );
                        },
                      );
                    },
                  )
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              //pour griser
              onPressed: null,
              //onPressed:(),
              child: const Text('Valider'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 20)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
