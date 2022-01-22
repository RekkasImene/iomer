import 'package:flutter/material.dart';
import 'package:iomer/ui/matricule/first_screen.dart';
import 'package:iomer/ui/new_part/components/body.dart';
import 'package:iomer/ui/parts/parts_screen.dart';
import 'package:iomer/ui/utils/info.dart';

import '../action/action_screen.dart';

class NewPartScreen extends StatefulWidget {
  const NewPartScreen({Key? key}) : super(key: key);

  @override
  State<NewPartScreen> createState() => _NewPartScreenState();
}

class _NewPartScreenState extends State<NewPartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maintenance'),
      ),
      body: const Body(),
    );
  }
}
