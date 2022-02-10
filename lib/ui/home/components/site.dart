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
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
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
                return Text(state.message);
              }
              return const Center(
                child: SizedBox(
                    width: 32, height: 32, child: CircularProgressIndicator()),
              );
            },
          ),
        ),
        TextField(
          controller: myController,
          decoration: const InputDecoration(
              border: OutlineInputBorder(), labelText: 'Service :'),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: double.infinity,
                child: _buildButton(),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildButton() {
    return ElevatedButton(
      child: const Text('Valider', style: TextStyle(fontSize: 20)),
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
      onPressed: calculateWhetherDisabledReturnsBool()
          ? null
          : () => [choosedConfig = myController.text, Navigation()],
    );
  }

  calculateWhetherDisabledReturnsBool() {
    if (chooseValue != null) {
      return false;
    } else {
      return true;
    }
  }

  setConfig() {
    choosedConfig = myController.text;
  }

  Navigation() {
    _sitesBloc.add(ValidateEventSites(chooseValue!, choosedConfig));

    _sitesBloc.nextnav.stream.listen((event) {
      if (event) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const FirstScreen()));
      }
    });
  }
}
