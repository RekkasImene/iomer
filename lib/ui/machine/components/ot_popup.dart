import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iomer/bloc/ot/ot_bloc.dart';
import 'package:iomer/config/injection.dart';

class OTPopUpWidget extends StatefulWidget {
  OtBloc otBloc;

  OTPopUpWidget({Key? key, required this.otBloc}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OTPopupState();
}

class _OTPopupState extends State<OTPopUpWidget> {
  late int? _value;

  @override
  void initState() {
    _value = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: StatefulBuilder(
        builder: (BuildContext context,
            StateSetter setState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment:
                MainAxisAlignment.center,
                children: [
                  DropdownButton(
                    value: _value,
                    items: const [
                      DropdownMenuItem(
                        child: Text("Preventive"),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text("Corrective"),
                        value: 2,
                      )
                    ],

                    onChanged: (int? value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed:  () =>
                          Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel')),
                  TextButton(
                    onPressed: () => [

                      Navigator.pop(context, 'OK'),
                      ValidationCreateOT()
                    ],
                    child: const Text('OK'),
                  ),
                ],
              ),
            ],
          );
        },
      ),
      shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(15.0)),
      title: const Text(
          'Nouvelle Maintenance'),
    );
  }


  ValidationCreateOT() {
    print("Emmettre etat validation.");
    widget.otBloc.add(NewEventOt(_value!));
  }
}