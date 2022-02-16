import 'package:flutter/material.dart';

class PartEditor extends StatelessWidget {
  final TextEditingController controller;
  const PartEditor( {Key? key,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          width: 10,
          height: 10,
        ),
        TextField(
          controller: controller,
          decoration: const InputDecoration(
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
                keyboardType: TextInputType.number,
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
