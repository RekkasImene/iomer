import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iomer/bloc/sites_bloc.dart';
import 'package:iomer/config/injection.dart';
import 'package:iomer/models/repository/in_repository.dart';
import 'package:iomer/ui/first_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late SitesBloc _sitesBloc;

  @override
  void initState() {
    _sitesBloc = getIt.get<SitesBloc>();
    _sitesBloc.add(FetchEventSites());
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
                  child: Text(
                    "Site :",
                    style: TextStyle(fontSize: 20),

                  ),
                ),

                BlocProvider(
                  create: (context) => _sitesBloc,
                  child: BlocBuilder<SitesBloc, SitesState>(
                    builder: (context, state) {
                      if (state is SitesLoaded) {
                        return DropdownButton(
                          value: state.sites[0],
                          items: state.sites.map((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem, child: Text(valueItem.NOMSITE),
                            );
                          }).toList(), onChanged: (newValue) {
                            setState(() {
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
