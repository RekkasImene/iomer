import 'package:flutter/material.dart';
import 'package:iomer/webService/services.dart';

class SelectMachine extends StatefulWidget {
  const SelectMachine({Key? key}) : super(key: key);

  @override
  State<SelectMachine> createState() => _SelectMachine();
}

class _SelectMachine extends State<SelectMachine> {
  var isSelected = false;
  var mycolor = Colors.white;

  final List<String> _list = [
    "Révision des 1000%",
    "Action corrective",
    "Parallélisme roues",
    "Révision des 1000%",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Maintenance'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Selection de la machine',
                style: TextStyle(fontSize: 24),
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                decoration: InputDecoration(
                    border: UnderlineInputBorder(), labelText: 'Nom machine'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                decoration: InputDecoration(
                    border: UnderlineInputBorder(), labelText: 'Nom machine'),
              ),
            ),

            // const SizedBox(height: 20),

            /*expanded permet de remplir la place*/
            Expanded(
              //padding: const EdgeInsets.all(16.0) ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //                                                                                                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0),
                    child: Text(
                      'Listes des ordres de travaux',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: _list.length,
                                itemBuilder: (context, index) {
                                  return ListTile(title: Text(_list[index]));
                                },
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Scan machine'),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green),
                          textStyle: MaterialStateProperty.all(
                              const TextStyle(fontSize: 15)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
