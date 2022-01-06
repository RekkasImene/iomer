import 'package:flutter/material.dart';
import 'package:iomer/ui/first_screen.dart';

class NewOtScreen extends StatefulWidget{
  const NewOtScreen({Key? key}):super(key: key);

  @override
  State<NewOtScreen> createState() => _NewOtScreenState();
}

class _NewOtScreenState extends State<NewOtScreen> {
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
                "Nouvelle maintenance :",style: TextStyle(fontSize: 20),
              ),

            ),
            const SizedBox(height: 20),

            /*expanded permet de remplir la place*/

              Container(
                height: 150.0,
                width: 300.0,
                color: Colors.transparent,
                child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: const Center(
                      child: Text("N° OT: ",
                        style: TextStyle(color: Colors.white, fontSize: 22),
                        textAlign: TextAlign.center
                      ),
                    )
                ),
              ),
            const Expanded(
              child: SizedBox(),
            ),


            const SizedBox(height: 20),
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








/*
Container(
height: 150.0,
width: 300.0,
color: Colors.transparent,
child: Container(
decoration: BoxDecoration(
color: Colors.green,
borderRadius: BorderRadius.all(Radius.circular(10.0))),
child: new Center(
child: new Text("Rounded Corner Rectangle Shape",
style: TextStyle(color: Colors.white, fontSize: 22),
textAlign: TextAlign.center,),
)),
),

 */