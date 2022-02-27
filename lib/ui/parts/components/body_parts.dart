import 'package:flutter/material.dart';
import 'package:iomere/ui/parts/components/list_parts.dart';
import 'package:iomere/ui/utils/info.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: const [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Pièces a changer",
              style: TextStyle(fontSize: 20),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Info(),
          ),

          Expanded(
            child: ListParts(),
          ),
        ],
      ),
    );
  }
}
