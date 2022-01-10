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
        title: const Text('Maintenance'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          
          

          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child:
              Text ('Selection de la machine',
               style: TextStyle(fontSize: 24),
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8,vertical: 16),
              child:
              TextField
                (decoration: InputDecoration(border: UnderlineInputBorder(),labelText: 'Code machine'
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
            
           // const SizedBox(height: 20),

            /*expanded permet de remplir la place*/
            Expanded(
                   //padding: const EdgeInsets.all(16.0) ,
                child: Column(
                
                  crossAxisAlignment: CrossAxisAlignment.start,
        //                                                                                                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
               
               
          children:  [
        
         const Padding(
              padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0),
            
              child:
              Text ('Listes des ordres de travaux',
                style: TextStyle(fontSize: 18),
              ),
            ),
                   Expanded(child:
                   Container (
                  decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                  child : Column(children: [ Expanded(child: 
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: _list.length,
                    itemBuilder: (context, index) {
                     return ListTile(

                       onTap: (){
                         },
                    title: Text(_list[index])
                    );
                    },
                  ),
                  ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children:  [
                   Align(
                     alignment: Alignment.bottomRight,
                     child: ClipRRect(
                
                child: Container(
    height: 30.0,
    width: 30.0,
    color: const Color(0xFFB9F6CA),
    
    child: const Icon(Icons.add, color: Colors.white, size: 18.0),
  ),
                
               
              ),
                   ),
                 ],
                 ),
               
                  ],
                
                
                  )
                   ),
                   ),
                   const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ ElevatedButton(onPressed: (){}, child: 
                 const Text('Scan machine'),
                 style: ButtonStyle (backgroundColor: MaterialStateProperty.all(Colors.green),
                 
                
                
                textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 15)),
              
                
                ),
                 ),],)
            
                ],
                ),
              

            ),
            
          
           
          ],
        ),
      ),
    );


  }
}