import 'package:flutter/material.dart';

class ActionScreen extends StatefulWidget {
  const ActionScreen({Key? key}) : super(key: key);

  @override
  _ActionScreenState createState() => _ActionScreenState();
}

class _ActionScreenState extends State<ActionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('IOmere'),
        ),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Actions à réaliser : ",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Container(
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Align(
                        child: Text(
                      "№ OT : OT802011",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )),
                    Align(
                        child: Text(
                      "Maintenance: Action corrective",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ))
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            SizedBox(
              width: double.infinity,
              height: 100,
              child: ElevatedButton(
                //pour griser
                onPressed: () {},
                //onPressed:(),
                child: const Text(
                  'Pièces à changer',
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.green[200],
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 100,
              child: ElevatedButton(
                //pour griser
                onPressed: () {},
                //onPressed:(),
                child: const Text(
                  'Saisir un compte rendu',
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.green[200],
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20)),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 100,
              child: ElevatedButton(
                //pour griser
                onPressed: () {},
                //onPressed:(),
                child: const Text(
                  'Taches à réaliser',
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.green[200],
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20)),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            /*Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(70.0)),
                color: Colors.green[400],
              ),
              height: 80,
              child: const Align(
                child: Text(
                  "Clôturer OT",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            )*/
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                //pour griser
                onPressed: () {},
                //onPressed:(),
                child: const Text(
                  'Clôturer OT',
                  style: TextStyle(fontSize: 25),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.green[400],
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20)),
              ),
            ),
          ]),
        ));
  }
}
