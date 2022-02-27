import 'package:flutter/material.dart';
import 'package:iomere/bloc/journal/journal_bloc.dart';
import 'package:iomere/config/injection.dart';
import 'package:iomere/ui/journal/components/list_ot_state.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late JournalBloc _journalBloc;

  @override
  void initState() {
    _journalBloc = getIt.get<JournalBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Expanded(child: ListOtStateWidget(journalbloc: _journalBloc)),
        ],
      ),
    );
  }
}
