import 'package:flutter/material.dart';

import 'ot_list.dart';

class Body extends StatelessWidget {

  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: const [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Selection de la machine',
              style: TextStyle(fontSize: 24),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                  border: UnderlineInputBorder(), labelText: 'Code machine'),
            ),
          ),

          Padding(
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
            child: OTListWidget()
          ),
        ],
      ),
    );
  }
}

