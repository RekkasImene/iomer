import 'package:flutter/material.dart';
import 'package:iomer/ui/machine/select_machine.dart';

import 'components/body.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iomere'),
      ),
      body: const Body(),
    );
  }
}
