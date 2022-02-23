import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:iomere/bloc/parts/parts_bloc.dart';
import 'package:iomere/config/injection.dart';
import 'package:iomere/ui/new_part/components/part_editor.dart';
import 'package:iomere/ui/scan/scan_screen.dart';
import 'package:iomere/ui/utils/info.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController _controllerPiece = TextEditingController();
  final TextEditingController _controllerLibelle = TextEditingController();
  final TextEditingController _controllerQte = TextEditingController();
  late PartsBloc _partsBloc;

  @override
  void initState() {
    _partsBloc = getIt.get<PartsBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _partsBloc,
      child: BlocListener<PartsBloc, PartsState>(
        listener: (context, state) {

          if (state is StatePartsInternetInterrupt) {
            showToast(state.message);
          }

          if(state is StatePartsNoArticle){
            showToast(state.message);
          }

          if(state is PartsStateAddArticle) {
            Navigator.pop(context);
          }
        },
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "ajout pièce :",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  children: [
                    Info(),
                    PartEditor(
                        controllerNpiece: _controllerPiece,
                        controllerLibelle: _controllerLibelle,
                        controllerQte: _controllerQte),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      _navigateAndRetriveCode(context);
                    },
                    child:
                    const Text('Scan Pièce', style: TextStyle(fontSize: 20)),
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20)),
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _partsBloc.add(AddPieceEventParts(_controllerPiece.text,
                        _controllerLibelle.text, _controllerQte.text));
                    //Navigator.push(context, MaterialPageRoute(builder: (_) => const PartsScreen()),);
                    //Navigator.pop(context);
                  },
                  child: const Text('Valider', style: TextStyle(fontSize: 20)),
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 20)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _navigateAndRetriveCode(BuildContext context) async {
    final String nextPageValues = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const ScanScreen()),
    );
    setState(() {
      _controllerPiece.text =
          nextPageValues; //first element is stored at the 0th index for a list
      _partsBloc.add(CodeEventPart(_controllerPiece.text));
    });
  }

  void showToast(String message) {
    Fluttertoast.showToast(msg: message);
  }

}
