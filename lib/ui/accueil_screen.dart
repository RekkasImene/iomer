import 'package:flutter/material.dart';
import 'package:iomer/ui/first_screen.dart';

class AccueilScreen extends StatefulWidget{
  const AccueilScreen({Key? key}):super(key: key);

  @override
  State<AccueilScreen> createState() => _AccueilScreenState();
}

class _AccueilScreenState extends State<AccueilScreen> {
  //TODO a remplacer avec données
  List<String> _texts = [
    "Lille",
    "Paris",
    "st germain",
    "Marseille",
    "Lyon",
    "Toulouse",
    "St lazare",
    "Rouen",
    "Chalons"
  ];


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
                    "Site :",style: TextStyle(fontSize: 20),
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
                        return ListTile(
                          title: Text(_texts[index]),
                        );
                        },
                    ),
                  ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                //pour griser
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FirstScreen()),);
                },
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
