import 'package:flutter/material.dart';
import 'package:iomer/bloc/site/sites_bloc.dart';
import 'package:iomer/ui/home/components/site.dart';
import 'package:iomer/ui/matricule/first_screen.dart';

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
          Expanded(child: SiteWidget()),
        ],
      ),
    );
  }
}
