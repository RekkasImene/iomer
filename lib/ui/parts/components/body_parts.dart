import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iomer/config/injection.dart';
import 'package:iomer/ui/new_part/new_part_screen.dart';
import 'package:iomer/ui/parts/components/list_parts.dart';
import 'package:iomer/ui/utils/info.dart';

import '../../../bloc/parts/parts_bloc.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [

          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Pièces a changer",
              style: TextStyle(fontSize: 20),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Info(),
          ),

          const Expanded(
            child: ListParts(),
          ),





        ],
      ),
    );
  }
}
