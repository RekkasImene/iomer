import 'package:flutter/material.dart';

class PartsScreen extends StatefulWidget{
  const PartsScreen({Key? key}):super(key: key);

  @override
  State<PartsScreen> createState() => _PartsScreenState();
}

class _PartsScreenState extends State<PartsScreen> {
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
  Widget build(BuildContext context){
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
                "Pièces a changer",style: TextStyle(fontSize: 20),
              ),

            ),
            const SizedBox(height: 20),

            Container(
              decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),


              child: Column(

                children: const [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("N° OT: ",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Maintenance :",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  )
                ],
              ),

            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Liste des taches a effectuer :",style: TextStyle(fontSize: 20),
              ),

            ),
            const SizedBox(height: 20),

            Expanded(
              child: Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                  //padding: const EdgeInsets.all(16.0) ,
                  child: ListView.builder(
                    itemCount: parts.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Column(
                          children: [
                            CheckboxListTile(
                              title:Text (parts[index]['code']),
                              subtitle:Text (parts[index]['quantite']+"x "+parts[index]['libelle']) ,
                              //secondary: Text (parts[index]['quantite'],

                              value: _isChecked[index],
                              onChanged: (val) {
                                setState(() {
                                  _isChecked[index] = val!;

                                  },
                                );
                                },
                            ),
                            Row(
                              children:<Widget>[
                              ElevatedButton(onPressed: (){

                            },
                              child: const Text('-'),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.green,
                                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10)
                              ),
                            ),
                              ElevatedButton(onPressed: (){

                              },
                                child: const Text('+'),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.green,
                                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10)
                                ),
                              ),
                              ]
                            ),



                          ],
                        ),
                      );

                    },
                  )
              ),
            ),


            const SizedBox(height: 10),
          Row(
            children: [
              Expanded(child: SizedBox()),
              Align(
                child: ElevatedButton(
                  onPressed: (){

                  },
                  child: const Text('Ajout'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10)
                  ),
                ),
              ),
            ],

),
            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: (){

              },
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
