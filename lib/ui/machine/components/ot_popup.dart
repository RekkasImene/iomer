import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iomer/bloc/categorie/categorie_bloc.dart';
import 'package:iomer/bloc/ot/ot_bloc.dart';
import 'package:iomer/config/injection.dart';
import 'package:iomer/models/bdd/iomer_database.dart';

class OTPopUpWidget extends StatefulWidget {
  OtBloc otBloc;

  OTPopUpWidget({Key? key, required this.otBloc}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OTPopupState();
}

class _OTPopupState extends State<OTPopUpWidget> {
  late int? _value;
  late Categorie? chooseValueCategorie;
  late CategorieBloc _categorieBloc;


  @override
  void initState() {
    _value = null;
    chooseValueCategorie = null;
    _categorieBloc = getIt.get<CategorieBloc>();
    _categorieBloc.add(FetchEventCategorie());
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
                create: (context) => _categorieBloc,
                child: BlocBuilder<CategorieBloc, CategorieState>(
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
                          items: state.categorie.map((Categorie valueItem) {
                                return DropdownMenuItem<Categorie>(
                                  value: valueItem,
                                  child: Text(
                                    valueItem.LIBELLECATEGORIE,
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                );
                              },
                          ).toSet().toList(),
                          onChanged: (Categorie? newvalue) {
                            setState(() { chooseValueCategorie = newvalue!;},
                            );
                          },
                        ),
                      );
                    } else if (state is CategorieError) {
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
                      onPressed: () => [
                            Navigator.pop(context, 'Cancel'),
                            widget.otBloc.add(FetchEventOt())
                          ],
                      child: const Text('Cancel')),
                  TextButton(
                    onPressed: () => [ValidationCreateOT(), Navigator.pop(context, 'OK') ],
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
    print("ValidationCreateOT : ");
    widget.otBloc.add(NewEventOt(chooseValueCategorie!, ));
  }

}
