import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iomere/bloc/parts/parts_bloc.dart';
import 'package:iomere/config/injection.dart';
import 'package:iomere/ui/scan/scan_screen.dart';

class PartEditor extends StatefulWidget {
  final TextEditingController controllerNpiece;

  final TextEditingController controllerLibelle;

  final TextEditingController controllerQte;

  const PartEditor(
      {Key? key,
      required this.controllerNpiece,
      required this.controllerLibelle,
      required this.controllerQte})
      : super(key: key);

  @override
  State<PartEditor> createState() => _PartEditorState();
}

class _PartEditorState extends State<PartEditor> {
  final TextEditingController _controllerArticle=TextEditingController();
  late PartsBloc _partsBloc;
  late TextEditingController controllerLibelle;
  late TextEditingController controllerNpiece;

  @override
  void initState() {
    _partsBloc = getIt.get<PartsBloc>();
    controllerNpiece=TextEditingController();
    controllerLibelle = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _partsBloc,
      child: BlocListener<PartsBloc, PartsState>(
        listener: (context, state) {
          if (state is StateArticleFind) {
            widget.controllerNpiece.text=state.npiece;
            widget.controllerLibelle.text  = state.libelle;
          }
        },
        child: Column(
          children: [
            const SizedBox(
              width: 10,
              height: 10,
            ),
            TextFormField(
              controller: widget.controllerNpiece,
              onEditingComplete: () {
                _partsBloc.add(CodeEventPart(widget.controllerNpiece.text));
              },
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'N° Pièce :',
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
            const SizedBox(
              width: 10,
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: TextField(
                    controller: widget.controllerLibelle,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(20.0),
                        border: OutlineInputBorder(),
                        labelText: 'Libellé pièce :'),
                  ),
                ),
                const SizedBox(
                  width: 10,
                  height: 10,
                ),
                Flexible(
                  child: TextField(
                    controller: widget.controllerQte,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Quantité :'),
                  ),
                ),
              ],
            ),
          ],
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
      _controllerArticle.text = nextPageValues; //first element is stored at the 0th index for a list
      _partsBloc.add(CodeEventPart(_controllerArticle.text));
    });
  }
}
