import 'dart:async';
import 'dart:developer';
import 'package:drift/drift.dart';
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

void main() {

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<List<Site>> futureSite;
  late Future<Origines> futureOrigines;
  late Future<Matricules> futureMatricules;
  late Future<Equipements> futureEquipements;
  late Future<Categories> futureCategories;
  late Future<OTs> futureOTs;
  late Future<OTTaches> futureOTTaches;

  @override
  void initState()  {
    super.initState();

    IomerDatabase database;
    database = IomerDatabase();
    final site = SitesCompanion.insert(
        CODESITE: 'iiii',
        NOMSITE:  'ssss',
        ADRESSESITE: 'hh',
    );
    database.insertSite(site);
    futureSite=fetchSite();

    futureSite.then((value) {value.map((e) {

        database.insertSite(SitesCompanion.insert(
          CODESITE: e.CODESITE,
          NOMSITE:  e.NOMSITE,
          ADRESSESITE: e.ADRESSESITE,));

        log('site e : '+e.NOMSITE);}
    );

    }).catchError((error){
      log('notre erreur------'+error);
    });
    /*fetchSite().then((value) {futureSite = value;}
    ).catchError((error){
      print('notre erreur------'+error);
    });*/
    /*futureOrigines = fetchOrigines(idSite);
    futureMatricules=fetchMatricules(idOrigine);
    futureEquipements=fetchEquipements(idSite);
    futureCategories=fetchCategories(idSite);
    futureOTs=fetchOTs(idSite, idOrigine);
    futureOTTaches=fetchOTTaches(idOT);*/






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

        ),
    );
  }
}