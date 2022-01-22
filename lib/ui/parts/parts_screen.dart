import 'package:flutter/material.dart';
import 'package:iomer/ui/action/action_screen.dart';
import 'package:iomer/ui/new_part/new_part_screen.dart';
import 'package:iomer/ui/parts/components/body.dart';
import 'package:iomer/ui/utils/info.dart';

class PartsScreen extends StatefulWidget {
  const PartsScreen({Key? key}) : super(key: key);

  @override
  State<PartsScreen> createState() => _PartsScreenState();
}

class _PartsScreenState extends State<PartsScreen> {
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
