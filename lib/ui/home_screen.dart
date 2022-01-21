import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iomer/bloc/site/sites_bloc.dart';
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
  late Site? chooseValue;

  @override
  void initState() {
    _sitesBloc = getIt.get<SitesBloc>();
    _sitesBloc.add(FetchEventSites());
    chooseValue = null;
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
                "Selectionner le site :",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),

<<<<<<< HEAD
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
                        return DropdownButton<Site>(
                          value: chooseSiteValue,
                          items: state.sites.map((Site valueItem) {
                            return DropdownMenuItem<Site>(
                              value: valueItem,
                              child: Text(valueItem.NOMSITE),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
=======
            BlocProvider(
              create: (context) => _sitesBloc,
              child: BlocBuilder<SitesBloc, SitesState>(
                builder: (context, state) {
                  if (state is SitesLoaded) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color:Colors.black,width: 4),
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
                            print(newvalue.toString());
                            chooseValue = newvalue!;

                            print(chooseValue.toString());
                          });
                        },
                      ),
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
            const Expanded(child: SizedBox()),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FirstScreen()),
                  );
                },
                child: const Text('Valider',style: TextStyle(fontSize: 20)),
                style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20)),
              ),
>>>>>>> 1b12525ee0773d2312780455cb32b2a60222487f
            ),
          ],
        ),
      ),
    );
  }
}
