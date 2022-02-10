import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:iomer/ui/scan/scan_screen.dart';

import '../../../bloc/ot/ot_bloc.dart';
import '../../../config/injection.dart';
import 'ot_list.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late TextEditingController _controllerCode;

  late TextEditingController _controllerNom;

  late OtBloc _otBloc;
  bool isButtonActive = false;

  @override
  void initState() {
    _otBloc = getIt.get<OtBloc>();

    _controllerCode = TextEditingController();
    _controllerNom = TextEditingController();

    _otBloc.add(CodeEventMachine(_controllerCode.text));

    _controllerCode.addListener(() {
      final isButtonActive = _controllerCode.text.isNotEmpty;
      setState(() => this.isButtonActive = isButtonActive);
    });

    super.initState();
  }

  @override
  void dispose() {
    _controllerCode.dispose();
    _controllerNom.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _otBloc,
      child: BlocConsumer< OtBloc, OtState>(
        listener: (context, state) {
          if (state is CodeMachineLoaded) {
            _controllerNom.text = state.nomMachine;
          }
        },
        builder: (context, state) {
            if (state is CodeMachineLoaded || state is OtLoaded) {
              return Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Selection de la machine',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      controller: _controllerCode,
                      decoration: InputDecoration(
                        border: const UnderlineInputBorder(),
                        labelText: 'Code machine',
                        suffixIcon: Align(
                          widthFactor: 1.0,
                          heightFactor: 1.0,
                          child: IconButton(
                              icon: const Icon(Icons.qr_code_scanner_outlined),
                              onPressed: () {
                                _navigateAndRetrieveCode(context);
                              }),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextField(
                      controller: _controllerNom,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Nom machine',
                      ),
                    ),
                  ),
                  Expanded(child: OTListWidget(codeMachine: _controllerCode.text, otblc: _otBloc),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: isButtonActive
                          ? () {
                        _otBloc.add(CodeEventMachine(_controllerCode.text));
                        setState(() => [
                          isButtonActive = true,
                        ]);
                      }
                          : null,
                      child: Text('Actualiser'),
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 20)),
                    ),
                  )
                ],
              );
            }

            else if (state is OtError) {
              return Text(state.message);
            }

            return const Center(
              child: SizedBox(
                  width: 32, height: 32, child: CircularProgressIndicator()),
            );


        },
      ),
    );
  }

  _navigateAndRetrieveCode(BuildContext context) async {
    final String nextPageValues = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const ScanScreen()),
    );
    setState(() {
      _controllerCode.text =
          nextPageValues; //first element is stored at the 0th index for a list
    });
  }
}
