import 'package:flutter/material.dart';
import 'package:iomere/ui/home/components/site.dart';

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
            child: Text("Selectionner le site :", style: TextStyle(fontSize: 20))
          ),
          /// dans cette vue on implemente le widget SiteWidget
          Expanded(child: SiteWidget()),
        ],
      ),
    );
  }
}
