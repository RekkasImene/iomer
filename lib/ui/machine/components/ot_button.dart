import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iomer/bloc/ot/ot_bloc.dart';
import 'package:iomer/ui/machine/components/ot_popup.dart';

class OTButtonWidget extends StatelessWidget {
  const OTButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OtBloc otblc = BlocProvider.of<OtBloc>(context);
    return IconButton(
      icon: const Icon(Icons.add),
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) =>
            BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 10, sigmaY: 10),
              child: OTPopUpWidget(otBloc: otblc),
            ),
      ),
    );
  }

}