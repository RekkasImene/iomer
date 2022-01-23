import 'package:flutter/material.dart';

import 'components/body.dart';

class MachineScreen extends StatelessWidget {
  const MachineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Maintenance'),
      ),
      body: const Body()
    );
  }
}
