import 'package:flutter/material.dart';
import 'package:iomer/ui/first_screen.dart';
import 'package:iomer/ui/parts_screen.dart';

import 'action_screen.dart';

class NewPartScreen extends StatefulWidget{
  const NewPartScreen({Key? key}):super(key: key);

  @override
  State<NewPartScreen> createState() => _NewPartScreenState();
}

class _NewPartScreenState extends State<NewPartScreen> {
  //TODO a remplacer avec données (les memes que pour l'ecran first_screen)
  bool isChecked = false;




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
                "ajout pièce",style: TextStyle(fontSize: 20),
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
            Container(
              decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),


              child: Column(

                children: const [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("N° Pièce: ",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Libellé pièce : ",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Quantité :",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  )
                ],
              ),

            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){

                },
                child: const Text('Scan Pièce'),
                style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 20)
                ),
              ),
            ),
            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: (){

                },
                child: const Text('Voir'),
                style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 20)
                ),
              ),
            ),
            Expanded(
              child: Container(

              ),
            ),


            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PartsScreen()),);

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
