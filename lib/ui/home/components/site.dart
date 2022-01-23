import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iomer/bloc/site/sites_bloc.dart';
import 'package:iomer/config/injection.dart';
import 'package:iomer/models/bdd/iomer_database.dart';

class SiteWidget extends StatefulWidget {
  const SiteWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SiteState();
}

class _SiteState extends State<SiteWidget> {
  late SitesBloc _sitesBloc;
  late Site? chooseValue;

  @override
  void initState() {
    _sitesBloc = getIt.get<SitesBloc>();
    _sitesBloc.add(FetchEventSites());
    chooseValue = null;
  }

  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _sitesBloc,
      child: BlocBuilder<SitesBloc, SitesState>(
        builder: (context, state) {
          if (state is SitesLoaded) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 6),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black, width: 4),
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
    );
  }
}
