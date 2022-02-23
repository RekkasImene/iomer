import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iomere/bloc/parts/parts_bloc.dart';
import 'package:iomere/config/injection.dart';

class PartEditor extends StatefulWidget {
  final TextEditingController controllerNpiece;

  final TextEditingController controllerLibelle;

  final TextEditingController controllerQte;


  const PartEditor(
      {Key? key, required this.controllerNpiece, required this.controllerLibelle, required this.controllerQte})
      : super(key: key);

  @override
  State<PartEditor> createState() => _PartEditorState();
}

class _PartEditorState extends State<PartEditor> {
  late TextEditingController _controllerArticle;
  late TextEditingController _controllerLibelle;
  late PartsBloc _partsBloc;

  @override
  void initState() {
_partsBloc = getIt.get<PartsBloc>();
_controllerArticle= TextEditingController();
_controllerLibelle= TextEditingController();
_partsBloc.add(CodeEventPart(_controllerLibelle.text));
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _partsBloc,
      child: BlocConsumer<PartsBloc, PartsState>(
        listener: (context, state) {
          if(state is CodePartLoaded){
            _controllerLibelle.text=state.libellePart;
          }

        },
        builder: (context, state) {
          if (state is CodePartLoaded){
            return Column(
              children: [
                const SizedBox(
                  width: 10,
                  height: 10,
                ),
                TextField(
                  controller: widget.controllerNpiece,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'N° Pièce :'),
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
                            border: OutlineInputBorder(),
                            labelText: 'Quantité :'),
                      ),
                    )
                  ],
                ),
              ],
            );
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
    );
  }
}
