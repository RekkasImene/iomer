import 'package:flutter/material.dart';

import 'components/body_machine.dart';

class MachineScreen extends StatelessWidget {
  final String text;
<<<<<<< HEAD
  MachineScreen({Key? key,required this.text}) : super(key: key);
=======
  const MachineScreen({
    Key? key,
    required this.text,
  }) : super(key: key);
>>>>>>> tina_branch

  @override
  Widget build(BuildContext context) {

    return Scaffold(
<<<<<<< HEAD
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Maintenance'),
      ),
      body: Body(text: text,)

    );

=======
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Maintenance'),
        ),
        body: const Body());
>>>>>>> tina_branch
  }

}
