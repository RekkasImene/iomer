import 'package:flutter/material.dart';

import 'components/body_action.dart';

class ActionScreen extends StatefulWidget {
  final String OtCode;
  final String OtLibelle;
  ActionScreen({Key? key,required this.OtCode,required this.OtLibelle}) : super(key: key);

  @override
  _ActionScreenState createState() => _ActionScreenState();
}

class _ActionScreenState extends State<ActionScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('IOmere'),
        ),
        body: Body(OtCode: widget.OtCode, OtLibelle: widget.OtLibelle,));
  }
}
