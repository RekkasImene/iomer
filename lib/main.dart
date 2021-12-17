import 'dart:async';
import 'package:flutter/material.dart';
import 'package:iomer/webService/categories.dart';
import 'package:iomer/webService/equipements.dart';
import 'package:iomer/webService/matricules.dart';
import 'package:iomer/webService/origines.dart';
import 'package:iomer/webService/ot_taches.dart';
import 'package:iomer/webService/ots.dart';
import 'package:iomer/webService/services.dart';
import 'package:iomer/webService/site.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Site> futureSite;
  late Future<Origines> futureOrigines;
  late Future<Matricules> futureMatricules;
  late Future<Equipements> futureEquipements;
  late Future<Categories> futureCategories;
  late Future<OTs> futureOTs;
  late Future<OTTaches> futureOTTaches;
  @override
  void initState() {
    super.initState();
    int idSite =2;
    int idOrigine =21;
    int idOT=203;
    futureSite = fetchSite();
    futureOrigines = fetchOrigines(idSite);
    futureMatricules=fetchMatricules(idOrigine);
    futureEquipements=fetchEquipements(idSite);
    futureCategories=fetchCategories(idSite);
    futureOTs=fetchOTs(idSite, idOrigine);
    futureOTTaches=fetchOTTaches(idOT);


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
            future: futureSite,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.nomsite);
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