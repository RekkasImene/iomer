import 'package:flutter/material.dart';

import 'components/body_action.dart';

class ActionScreen extends StatefulWidget {
  final int OtId;
  ActionScreen({Key? key,required this.OtId}) : super(key: key);

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
        body: Body(OtId: widget.OtId));
  }
}
