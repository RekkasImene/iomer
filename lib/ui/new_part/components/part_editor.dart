import 'package:flutter/material.dart';

class PartEditor extends StatelessWidget {
  final TextEditingController controllerNpiece ;
  final TextEditingController controllerLibelle ;
  final TextEditingController controllerQte;


  const PartEditor( {Key? key,required this.controllerNpiece, required this.controllerLibelle, required this.controllerQte})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          width: 10,
          height: 10,
        ),
        TextField(
          controller: controllerNpiece,
          decoration: const InputDecoration(
              border: OutlineInputBorder(), labelText: 'N° Pièce :'),
        ),
        const SizedBox(
          width: 10,
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: TextField(
                controller: controllerLibelle,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(20.0),
                    border: OutlineInputBorder(),
                    labelText: 'Libellé pièce :'),
              ),
            ),
            const SizedBox(
              width: 10,
              height: 10,
            ),
            Flexible(
              child: TextField(
                controller: controllerQte,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Quantité :'),
              ),
            )
          ],
        ),
      ],
    );
  }
}
