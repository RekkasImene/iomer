import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iomer/bloc/ot/ot_bloc.dart';
import 'package:iomer/config/injection.dart';
import 'package:iomer/models/bdd/iomer_database.dart';

class OTPopUpWidget extends StatefulWidget {
  OtBloc otBloc;

  OTPopUpWidget({Key? key, required OtBloc this.otBloc}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OTPopupState();
}

class _OTPopupState extends State<OTPopUpWidget> {
  late int? _value;
  late Categorie? chooseValueCategorie;

  @override
  void initState() {
    _value = null;
    chooseValueCategorie = null;
    widget.otBloc.add(FetchEventCategorie());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Column(
            children: [
              BlocProvider(
                create: (context) => widget.otBloc,
                child: BlocBuilder<OtBloc, OtState>(
                  builder: (context, state) {
                    if (state is CategoriesLoaded) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey, width: 1),
                        ),
                        child: DropdownButton(
                          value: chooseValueCategorie,
                          isExpanded: true,
                          items: state.categorie
                              .map((Categorie valueItem) {
                                return DropdownMenuItem<Categorie>(
                                  value: valueItem,
                                  child: Text(
                                    valueItem.LIBELLECATEGORIE,
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                );
                              })
                              .toSet()
                              .toList(),
                          onChanged: (Categorie? newvalue) {
                            setState(() {
                              chooseValueCategorie = newvalue!;
                            });
                          },
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel')),
                  TextButton(
                    onPressed: () =>
                        [Navigator.pop(context, 'OK'), ValidationCreateOT()],
                    child: const Text('OK'),
                  ),
                ],
              ),
            ],
          );
        },
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      title: const Text('Nouvelle Maintenance'),
    );
  }

  ValidationCreateOT() {
    print("Emmettre etat validation.");

    widget.otBloc.add(NewEventOt(chooseValueCategorie!));
  }
}
