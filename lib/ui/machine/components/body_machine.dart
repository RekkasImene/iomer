import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iomere/bloc/ot/ot_bloc.dart';
import 'package:iomere/config/injection.dart';
import 'package:iomere/ui/journal/journal_screen.dart';
import 'package:iomere/ui/scan/scan_screen.dart';

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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: BlocProvider(
        create: (context) => _otBloc,
        child: BlocConsumer<OtBloc, OtState>(
          listener: (context, state) {
            if (state is CodeMachineLoaded) {
              /// recupère le code machine après scan
              _controllerNom.text = state.nomMachine;
            }
          },
          builder: (context, state) {
            if (state is CodeMachineLoaded || state is OtLoaded) {
              /// affiche la page entiere si l'ot est chargé
              return Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Selection de la machine',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),

                  /// input du code machine
                  /// avec un bouton QR code (fonctionne aussi avec barcode)
                  inputCodeMachine(),

                  /// input du nom de la machine
                  inputNameMachine(),

                  Expanded(
                    child:

                        /// affiche la liste des Ot en fonction de la machine
                        OTListWidget(
                            codeMachine: _controllerCode.text, otblc: _otBloc),
                  ),
                  SizedBox(
                    width: double.infinity,

                    /// bouton pour actualiser la page et préremplir les champs
                    child: ElevatedButton(
                      child:
                          const Text('Journal', style: TextStyle(fontSize: 20)),
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 20)),
                      onPressed: () => [
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const JournalScreen()),
                        )
                      ],
                    ),
                  )
                ],
              );
            } else if (state is OtError) {
              /// affiche message d'erreur
              return Text(state.message);
            }
            return const Center(
              child: SizedBox(

                  /// affiche loading
                  width: 32,
                  height: 32,
                  child: CircularProgressIndicator()),
            );
          },
        ),
      ),
    );
  }

  Widget inputCodeMachine() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: TextFormField(
        controller: _controllerCode,
        onChanged: (value) {
          _otBloc.add(CodeEventMachine(_controllerCode.text));
        },
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          labelText: 'Code machine',
          suffixIcon: Align(
            widthFactor: 1.0,
            heightFactor: 1.0,
            child: Theme(
              data: Theme.of(context),
              child: IconButton(
                  icon: const Icon(Icons.qr_code_scanner_outlined),
                  onPressed: () {
                    /// lance le scan pour récuperer un code machine
                    _navigateAndRetrieveCode(context);
                  }),
            ),
          ),
        ),
      ),
    );
  }

  Widget inputNameMachine() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: TextField(
        controller: _controllerNom,
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Nom machine',
        ),
      ),
    );
  }

  _navigateAndRetrieveCode(BuildContext context) async {
    final String nextPageValues = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const ScanScreen()),
    );
    setState(() {
      _controllerCode.text = nextPageValues; //first element is stored at the 0th index for a list
      _otBloc.add(CodeEventMachine(_controllerCode.text));
    });
  }
}
