import 'package:flutter/material.dart';
import 'package:iomer/ui/new_part/components/part_editor.dart';
import 'package:iomer/ui/parts/parts_screen.dart';
import 'package:iomer/ui/scan/scan_screen.dart';
import 'package:iomer/ui/utils/info.dart';

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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "ajout pièce :",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              children: [
                Info(),
                PartEditor(controller: _controller,),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _navigateAndRetriveCode(context);
                },
                child: const Text('Scan Pièce', style: TextStyle(fontSize: 20)),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20)),
              ),
            ),
          ),
          Expanded(
            child: Container(),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PartsScreen()),
                );
              },
              child: const Text('Valider', style: TextStyle(fontSize: 20)),
              style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
            ),
          ),
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
