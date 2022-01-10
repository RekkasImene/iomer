import 'package:flutter/material.dart';


class SelectMachine extends StatefulWidget{
  const SelectMachine({Key? key}) : super (key : key);

  @override
  State<SelectMachine> createState()  => _SelectMachine();
}


class _SelectMachine extends State<SelectMachine>{
  var isSelected = false;
  var mycolor=Colors.white;


  final List<String> _list = [
    "Révision des 1000%",
    "Action corrective",
    "Parallélisme roues",
    "Révision des 1000%",

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iomer'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(

          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child:
              Text ('Selection de la machine',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8,vertical: 16),
              child:
              TextField
                (decoration: InputDecoration(border: UnderlineInputBorder(),labelText: 'Nom machine'
              ),
              ),

            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8,vertical: 16),
              child: TextField(
                decoration:
                InputDecoration(border: UnderlineInputBorder(),labelText: 'Nom machine'
                ),
              ),
            ),
            const SizedBox(height: 20),

            /*expanded permet de remplir la place*/
            Expanded(
              child: Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                //padding: const EdgeInsets.all(16.0) ,
                child: Column(children:  [
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: _list.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_list[index]),
                      );
                    },

                  ),

                ],
                ),
              ),

            ),
            const SizedBox(height: 20),

          ],
        ),
      ),
    );


  }


/*return Scaffold(
     appBar: AppBar(title: const Text ('Maintenance')

     ),

     body: Container (

    child:
     Column (
       crossAxisAlignment: CrossAxisAlignment.start,
        children:
        <Widget>[

        const Padding(
        padding: EdgeInsets.all(16.0),
        child:
         Text ('Selection de la machine',
       textAlign: TextAlign.center,
       style: TextStyle(fontSize: 20),
       ),
         ),
       const Padding(
         padding: EdgeInsets.symmetric(horizontal: 8,vertical: 16),
          child:
          TextField
          (decoration: InputDecoration(hintText: 'Enter Text'
          ),
          ),

            ),
        const Padding(
         padding: EdgeInsets.symmetric(horizontal: 8,vertical: 16),
          child: TextField(
            decoration:
            InputDecoration(border: UnderlineInputBorder(),labelText: 'Nom machine'),
            ),
            ),

      ListView.builder(itemCount: _texts.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_texts[index]),
                        );
                        },
      ),

      ],

       )

       ),


   );
  }*/


}