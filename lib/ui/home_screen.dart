import 'package:flutter/material.dart';
import 'package:iomer/ui/first_screen.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({Key? key}):super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //TODO a remplacer avec données
  final List<String> _texts = [
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
              SizedBox(
                width: double.infinity,

                child: ElevatedButton(
                  //pour griser
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const FirstScreen()),);
                  },
                  child: const Text('Valider'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 20)
                  ),
                ),
              ),
            ],
          ),
      ),
    );
  }
}
