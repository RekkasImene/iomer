import 'package:flutter/material.dart';

class PartEditor extends StatelessWidget {
  const PartEditor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          width: 10,
          height: 10,
        ),
        const TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(), labelText: 'N° Pièce :'),
        ),
        const SizedBox(
          width: 10,
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Flexible(
              child: TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(20.0),
                    border: OutlineInputBorder(),
                    labelText: 'Libellé pièce :'),
              ),
            ),
            SizedBox(
              width: 10,
              height: 10,
            ),
            Flexible(
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Quantité :'),
              ),
            )
          ],
        ),
      ],
    );
  }
}
