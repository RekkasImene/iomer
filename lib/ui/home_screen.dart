import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iomer/bloc/sites_bloc.dart';
import 'package:iomer/config/injection.dart';
import 'package:iomer/models/bdd/iomer_database.dart';
import 'package:iomer/ui/first_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late SitesBloc _sitesBloc;
  late Site? chooseSiteValue;

  @override
  void initState() {
    _sitesBloc = getIt.get<SitesBloc>();
    _sitesBloc.add(FetchEventSites());
    chooseSiteValue = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iomere'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Selectionner le site et le Service",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),

            /*expanded permet de remplir la place*/
            Row(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                ),
                 BlocProvider(
                  create: (context) => _sitesBloc,
                  child: BlocBuilder<SitesBloc, SitesState>(
                    builder: (context, state) {
                      if (state is SitesLoaded) {
                        return DropdownButton<Site> (
                          value: chooseSiteValue,
                          items: state.sites.map((Site valueItem) {
                            return DropdownMenuItem<Site> (
                              value: valueItem, child: Text(valueItem.NOMSITE),
                            );
                          }).toList(),
                          onChanged: (Site? newvalue) {
                            setState(() {
                              print(newvalue.toString());
                              chooseSiteValue = newvalue!;
                              print(chooseSiteValue.toString());
                            });
                          },
                        );
                      } else if (state is SitesError) {
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
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FirstScreen()),
                );
              },
              child: const Text('Valider'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50, vertical: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
