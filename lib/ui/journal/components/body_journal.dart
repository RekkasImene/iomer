import 'package:flutter/material.dart';
import 'package:iomer/bloc/ot/ot_bloc.dart';
import 'package:iomer/config/injection.dart';
import 'package:iomer/ui/home/components/site.dart';
import 'package:iomer/ui/journal/components/list_ot_state.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late OtBloc _otBloc;

  @override
  void initState() {
    _otBloc = getIt.get<OtBloc>();
    _otBloc.add(CodeEventMachine("S01.EQ0001"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Expanded(child: ListOtStateWidget(codeMachine: "S01.EQ0001", otblc: _otBloc)),
        ],
      ),
    );
  }
}
