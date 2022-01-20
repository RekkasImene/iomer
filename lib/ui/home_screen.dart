import 'package:flutter/material.dart';
import 'package:iomer/ui/first_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  //TODO a remplacer avec données
  String dropdown_value_site = '';
  String dropdown_value_services = '';
  var site_items = [
    '',
    'Paris',
    'Rouen',
    'Chalon'
  ];


  var service_items=[
    '',
    'Electricien',
    'Mecanicien',
    'Plombier'
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
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Selectionner le Site et le Service :",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      const Text("Site : "),
                      DropdownButton(
                        value: dropdown_value_site,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: site_items.map((String items) {
                          return DropdownMenuItem(value: items, child: Text(items));
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdown_value_site =newValue!;
                          });
                        },
                      ),
                    ],
                  ),
                ),

                Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      const Text("Service : "),

                      DropdownButton(
                        value: dropdown_value_services,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: service_items.map((String items) {
                          return DropdownMenuItem(value: items, child: Text(items));
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdown_value_services =newValue!;
                          });
                        },
                      ),
                    ],
                  ),
                )

              ],
            ),

            /*expanded permet de remplir la place*/
const Expanded(child: SizedBox()),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                //pour griser
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FirstScreen()),
                  );
                },
                child: const Text('Valider'),
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
