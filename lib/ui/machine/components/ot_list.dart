import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iomere/bloc/ot/ot_bloc.dart';
import 'package:iomere/models/bdd/iomer_database.dart';
import 'package:iomere/ui/action/action_screen.dart';
import 'package:iomere/ui/machine/components/ot_button.dart';

class OTListWidget extends StatefulWidget {
  String codeMachine;
  OtBloc otblc;

  OTListWidget({Key? key, required this.codeMachine, required this.otblc})
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
    log("Initialisation Machine List");
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
              create: (context) => widget.otblc,
              child: BlocListener<OtBloc, OtState>(
                  listener: (context, state) {
                    if (state is OtLoaded) {
                      otList.add(state.ots);
                    } else if (state is OtError) {
                      Text(state.message);
                    }
                  },
                  child: Container(
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
                                  return const Center(
                                    child: SizedBox(
                                        width: 32,
                                        height: 32,
                                        child: CircularProgressIndicator()),
                                  );
                                } else {
                                  return listOt(snapshot);
                                }
                              }),
                        ),
                      ],
                    ),
                  ))),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget listOt(AsyncSnapshot snapshot) {
    return Column(
      children: [
        Expanded(
          child:ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemCount: snapshot.data.length,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          title: Text(
                                              snapshot.data[index].LIBELLEOT),

                                          onTap: () {
                                            DateTime now = DateTime.now();
                                            choosedOt = snapshot.data[index];
                                            widget.otblc.add(SetOpenOt(choosedOt.IDOT, now));
                  widget.otblc.add(SetEventOt(choosedOt));
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ActionScreen()),
                  );
                },
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: OTButtonWidget(codeMachine: widget.codeMachine),
            ),
          ],
        ),
      ],
    );
  }
}
