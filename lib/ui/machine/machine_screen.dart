import 'package:flutter/material.dart';

import 'components/body_machine.dart';

class MachineScreen extends StatelessWidget {
  final String text;
  MachineScreen({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Maintenance'),
      ),
      body: Body()

    );
  }

}
