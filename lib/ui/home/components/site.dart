import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iomere/bloc/site/sites_bloc.dart';
import 'package:iomere/config/injection.dart';
import 'package:iomere/models/bdd/iomer_database.dart';
import 'package:iomere/ui/matricule/first_screen.dart';

class SiteWidget extends StatefulWidget {
  const SiteWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SiteState();
}

class _SiteState extends State<SiteWidget> {
  bool _isLoading = false;
  late SitesBloc _sitesBloc;
  late Site? chooseValue;
  late String choosedConfig;
  final myController = TextEditingController();

  @override
  void initState() {
    chooseValue = null;
    choosedConfig = "";
    _sitesBloc = getIt.get<SitesBloc>();
    _sitesBloc.add(FetchEventSites()); //evenement initial
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocProvider(
            create: (context) => _sitesBloc,
            child: BlocConsumer<SitesBloc, SitesState>(
              listener: (context, state) {
                if (state is SitesError) {
                  final snackBar = SnackBar(
                    backgroundColor: Colors.blueGrey,
                    content: Container(
                      height: 60,
                      child: Center(
                        child: Text(
                          state.message,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    action: SnackBarAction(
                      label: 'Réessayer',
                      onPressed: () {
                        _sitesBloc.add(FetchEventSites());

                        // Some code to undo the change.
                      },
                    ),
                    duration: const Duration(days: 365),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  // return const SnackBar(content: Text("data"));
                }

                if (state is NavigationState) {
                  navigation();
                }

                if (state is SitesReload) {
                  log('initial stataaaaaaaaaaaate');
                  _sitesBloc.add(FetchEventSites());
                  _isLoading = false;
                }
              },
              builder: (context, state) {
                if (state is SitesLoaded) {
                  /// affiche un dropdown button avec la liste des sites
                  return Expanded(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey, width: 1),
                          ),
                          child: DropdownButton(
                            value: chooseValue,
                            isExpanded: true,
                            items: state.sites
                                .map((Site valueItem) {
                                  return DropdownMenuItem<Site>(
                                    value: valueItem,
                                    child: Text(
                                      valueItem.NOMSITE,
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                  );
                                })
                                .toSet()
                                .toList(),
                            onChanged: (Site? newvalue) {
                              setState(() {
                                chooseValue = newvalue!;
                              });
                            },
                          ),
                        ),
                        inputService(),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: double.infinity,

                                /// bouton pour valider le site et le service
                                /// navigue a la prochaine étape
                                child: buildButton(),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                } else {
                  return const Center(
                    /// affiche un loading
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SizedBox(child: CircularProgressIndicator()),
                    ),
                  );
                }
              },
            )),
      ],
    );
  }

  Widget inputService() {
    return TextField(
      controller: myController,
      decoration: const InputDecoration(
          border: OutlineInputBorder(), labelText: 'Service :'),
    );
  }

  Widget buildButton() {
    return ElevatedButton.icon(
      icon: _isLoading
          ? const SizedBox(
              height: 20, width: 20, child: CircularProgressIndicator())
          : const Icon(null),
      label: Text(
        _isLoading ? 'Loading...' : 'Valider',
        style: const TextStyle(fontSize: 20),
      ),
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
      onPressed: calculateWhetherDisabledReturnsBool()
          ? null
          : () => [
                choosedConfig = myController.text,
                setState(() {
                  _isLoading = true;
                }),
                _sitesBloc.add(ValidateEventSites(chooseValue!, choosedConfig))
              ],
    );
  }

  calculateWhetherDisabledReturnsBool() {
    if (_isLoading == true) {
      return true;
    }
    if (chooseValue != null) {
      return false; //btn activé
    } else {
      return true;
    }
  }

  FutureOr onGoBack(dynamic value) {
    /// est utilisé pour reinitilaser les parametres après un retour arriere
    setState(() {
      _isLoading = false;
      chooseValue = null;
      _sitesBloc.add(FetchEventSites());
    });
  }

  navigation() {
    Navigator.push(context,
            MaterialPageRoute(builder: (context) => const FirstScreen()))
        .then(onGoBack);
  }

  // void showInSnackBar() {
  //   final snackBar = SnackBar(
  //     content: const Text('Yay! A SnackBar!'),
  //     action: SnackBarAction(
  //       label: 'Undo',
  //       onPressed: () {
  //         // Some code to undo the change.
  //       },
  //     ),
  //   );
  //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
  // }
}
