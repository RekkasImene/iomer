

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OTPopUpWidget extends StatefulWidget {
  const OTPopUpWidget({Key? key}) : super(key: key);

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
                MainAxisAlignment
                    .center,
                children: [
                  DropdownButton(
                    value: _value,
                    items: const [
                      DropdownMenuItem(
                        child: Text(
                            "Preventive"),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text(
                            "Corrective"),
                        value: 2,
                      )
                    ],
//onChanged: (value)=> _value=value as int?,

                    onChanged:
                        (int? value) {
                      setState(() {
                        _value = value!;
                        log(_value.toString());
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment:
                MainAxisAlignment
                    .spaceBetween,
                children: [
                  TextButton(
                    onPressed: () =>
                        Navigator.pop(
                            context,
                            'Cancel'),
                    child: const Text(
                        'Cancel'),
                  ),
                  TextButton(
                    onPressed: () =>
                        Navigator.pop(
                            context, 'OK'),
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
}