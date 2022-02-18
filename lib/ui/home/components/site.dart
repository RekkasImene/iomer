import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iomer/bloc/site/sites_bloc.dart';
import 'package:iomer/config/injection.dart';
import 'package:iomer/models/bdd/iomer_database.dart';
import 'package:iomer/ui/matricule/first_screen.dart';

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
    _sitesBloc.add(FetchEventSites());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocProvider(
          create: (context) => _sitesBloc,
          child: BlocBuilder<SitesBloc, SitesState>(
            builder: (context, state) {
              if (state is SitesLoaded) {
                /// affiche un dropdown button avec la liste des sites
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
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
                );
              } else if (state is SitesError) {
                /// affiche un message d'erreur
                return Text(state.message);
              }
              return const Center(
                /// affiche un loading
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(child: CircularProgressIndicator()),
                ),
              );
            },
          ),
        ),

        /// affiche un textfield pour rentrer le nom du service rechercher
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
          : () => [choosedConfig = myController.text, navigation()],
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
      chooseValue=null;
    });
  }

  navigation() {
    setState(() {
      _isLoading = true;
    });
    _sitesBloc.add(ValidateEventSites(chooseValue!, choosedConfig));
    _sitesBloc.nextnav.stream.listen((event) {
      if (event) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const FirstScreen())).then(onGoBack);
      }
    });
  }
}
