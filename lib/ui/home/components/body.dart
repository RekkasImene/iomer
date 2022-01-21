import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iomer/ui/home/components/site.dart';

import '../../first_screen.dart';

class Body extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Selectionner le site :",
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(height: 20),

          const SiteWidget(),

          const Expanded(child: SizedBox()),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FirstScreen()),
                );
              },
              child: const Text('Valider',style: TextStyle(fontSize: 20)),
              style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50, vertical: 20)),
            ),
          ),
        ],
      ),
    );

  }
}