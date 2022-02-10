import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iomer/bloc/ot/ot_bloc.dart';
import 'package:iomer/config/injection.dart';
import 'package:iomer/models/bdd/iomer_database.dart';
import 'package:iomer/ui/action/action_screen.dart';
import 'package:iomer/ui/machine/components/ot_button.dart';

class OTListWidget extends StatefulWidget {
  String codeMachine;
  OtBloc otBloc;

  OTListWidget({Key? key, required this.codeMachine, required this.otBloc})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _OTListState();
}

class _OTListState extends State<OTListWidget> {
  late Ot choosedOt;
  StreamController<List<Ot>> otList = StreamController();

  @override
  void initState() {
    choosedOt = Ot(IDOT: 0, CODEOT: "CODEOT", LIBELLEOT: "LIBELLEOT");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0),
          child: Text(
            'Listes des ordres de travaux',
            style: TextStyle(fontSize: 18),
          ),
        ),
        Expanded(
          child: BlocProvider<OtBloc>(
            create: (context) => widget.otBloc,
            child: BlocConsumer<OtBloc, OtState>(
              listener: (context, state) {
                if (state is OtLoaded) {
                  otList.add(state.ots);
                  print("list ot : " + otList.toString());
                }
              },
              builder: (context, state) {
                if (state is OtLoaded) {
                  return Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Column(
                      children: [
                        Expanded(
                          child: StreamBuilder<List<Ot>>(
                              stream: otList.stream,
                              builder: (BuildContext context,
                                  AsyncSnapshot<dynamic> snapshot) {
                                if (!snapshot.hasData) {
                                  return const Text("");
                                } else {
                                  return ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemCount: snapshot.data.length,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        title: Text(
                                            snapshot.data[index].LIBELLEOT),
                                        onTap: () {
                                          choosedOt = snapshot.data[index];
                                          widget.otBloc
                                              .add(SetEventOt(choosedOt));
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ActionScreen()),
                                          );
                                        },
                                      );
                                    },
                                  );
                                }
                              }),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Align(
                              alignment: Alignment.bottomRight,
                              child: OTButtonWidget(
                                  codeMachine: widget.codeMachine),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                } else if (state is OtError) {
                  return Text(state.message);
                }
                return const Center(
                  child: SizedBox(
                      width: 32,
                      height: 32,
                      child: CircularProgressIndicator()),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget BuildList(List<Ot> ots) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: ots.length,
      itemBuilder: (context, index) {
        return ListTile(title: Text(ots[index].LIBELLEOT));
      },
    );
  }
}
