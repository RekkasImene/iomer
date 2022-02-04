import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iomer/bloc/machine/machine_bloc.dart';
import 'package:iomer/ui/scan/scan_screen.dart';

import 'ot_list.dart';

class Body extends StatelessWidget {
  final _codeController = TextEditingController();
  final _nameController = TextEditingController();
  final String text;
  final _codeFocusNode = FocusNode();
  late MachineBloc _machineBloc;
  Body({Key? key, required this.text}) : super(key: key);

  @override
  @override
  void initState() {
    //super.initState();
    _codeController.addListener(this.onCodeChange);
  }

  onCodeChange(String name) {
    if (_codeFocusNode.hasFocus) {
      if (_codeController.text != null) {
        _nameController.value = TextEditingValue(text: name);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: BlocProvider(
        create: (context) => _machineBloc,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Selection de la machine',
                style: TextStyle(fontSize: 24),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                controller: _codeController,
                initialValue: text,
                decoration: InputDecoration(
                  border: const UnderlineInputBorder(),
                  labelText: 'Code machine',
                  suffixIcon: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ScanScreen()),
                        );
                      },
                      icon: const Icon(Icons.camera_alt)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: BlocBuilder<MachineBloc, MachineState>(
                builder: (context, state) {
                  return TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Nom machine'),
                  );
                },
              ),
            ),
            const Expanded(child: OTListWidget()),
          ],
        ),
      ),
    );
  }
}
