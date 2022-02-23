import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iomere/bloc/ot/ot_bloc.dart';
import 'package:iomere/ui/machine/components/ot_popup.dart';

class OTButtonWidget extends StatelessWidget {
  String codeMachine;

  OTButtonWidget({Key? key, required this.codeMachine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OtBloc otblc = BlocProvider.of<OtBloc>(context);
    /// bouton ouvrant une pop up pour ajouter un Ot
    return IconButton(
      icon: const Icon(Icons.add),
      onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: OTPopUpWidget(otBloc: otblc, codeMachine: codeMachine),
              )),
    );
  }
}
