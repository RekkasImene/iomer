import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:iomer/ui/machine/components/ot_popup.dart';

class OTButtonWidget extends StatelessWidget {
  const OTButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add),
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) =>
            BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 10, sigmaY: 10),
              child: const OTPopUpWidget(),
            ),
      ),
    );
  }

}