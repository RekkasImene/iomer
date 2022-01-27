import 'package:flutter/material.dart';

import 'ot_list.dart';

class Body extends StatelessWidget {
  final String text;

  Body({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              initialValue: text,
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(), labelText: 'Code machine'),
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                  border: UnderlineInputBorder(), labelText: 'Nom machine'),
            ),
          ),

          const Expanded(
              child: OTListWidget()),
        ],
      ),
    );
  }
}
