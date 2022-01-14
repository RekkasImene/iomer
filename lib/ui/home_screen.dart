import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iomer/blocs/cities/cities_bloc.dart';
import 'package:iomer/models/repository/in_repository.dart';
import 'package:iomer/ui/first_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late CitiesBloc _citiesBloc;


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iomer'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Site :",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),

            /*expanded permet de remplir la place*/
            Expanded(
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                //padding: const EdgeInsets.all(16.0) ,
                //   child: ListView.builder(
                //     itemCount: _texts.length,
                //     itemBuilder: (context, index) {
                //       return ListTile(
                //         title: Text(_texts[index]),
                //       );
                //       },
                //   ),
                // ),
                child: BlocProvider(
                  create: (context) => _citiesBloc,
                  child : BlocListener(
                    listener: (context,state) {

                    },
                  child: BlocBuilder<CitiesBloc, CitiesState>(
                    builder: (context, state) {
                      if(state is CitiesInitial) {
                        print("Etat inital");
                      }
                      else if (state is CitiesLoading) {
                        print("Etat loading...");
                      }
                      else if (state is CitiesLoaded) {
                        print("Etat loaded...");
                      }
                      else {
                        print("Error...");
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
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              //pour griser
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FirstScreen()),
                );
                // _citiesBloc.add(const GetCities());
              },
              child: const Text('Valider'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
