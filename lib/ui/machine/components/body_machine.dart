import 'package:flutter/material.dart';
import 'package:iomer/ui/scan/scan_screen.dart';

import 'ot_list.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController _controller = TextEditingController();



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
              controller: _controller,
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
          const Expanded(child: OTListWidget()),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                _navigateAndRetriveCode(context);
              },
              child: Text('Scan machine '),
              style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
            ),
          )
        ],
      ),
    );
  }
  _navigateAndRetriveCode(BuildContext context) async {
    final String nextPageValues = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const ScanScreen()),
    );
    setState(() {
      _controller.text =
          nextPageValues; //first element is stored at the 0th index for a list
    });
  }
}
