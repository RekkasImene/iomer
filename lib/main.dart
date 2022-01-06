import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:iomer/models/bdd/iomer_database.dart';
import 'package:iomer/webService/categories.dart';
import 'package:iomer/webService/equipements.dart';
import 'package:iomer/webService/matricules.dart';
import 'package:iomer/webService/origines.dart';
import 'package:iomer/webService/ot_taches.dart';
import 'package:iomer/webService/ots.dart';
import 'package:iomer/webService/services.dart';
import 'package:iomer/webService/sites.dart';


void main() async {
  runApp(const MyApp());

  Site unsite  = await fetchSite();
  log("Uuuuuuuuuuuuuuuuuuuuuuuuuuu --- "+unsite.toString());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  //late Future<Sites> futureSite;
  //late Future<Origines> futureOrigines;
  //late Future<Matricules> futureMatricules;
  //late Future<Equipements> futureEquipements;
  //late Future<Categories> futureCategories;
  //late Future<OTs> futureOTs;
  //late Future<OTTaches> futureOTTaches;


  @override
  void initState() {
    super.initState();

    int idsite =2;
    int idorigine =21;
    int idOT=203;

    //futureOrigines = fetchOrigines(idSite);
    //futureMatricules=fetchMatricules(idOrigine);
    //futureEquipements=fetchEquipements(idSite);
    //futureCategories=fetchCategories(idSite);
    //futureOTs=fetchOTs(idSite, idOrigine);
    //futureOTTaches=fetchOTTaches(idOT);

    IomerDatabase database = IomerDatabase();

    final site = Site(
      NOMSITE: 'azerty', CODESITE: 'zero', ADRESSESITE: 'klklkl', IDSITE: 2
    );

    //database.insertSite(site);
    //database.insertSite(site2);
  }


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Site>(

            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.NOMSITE);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}