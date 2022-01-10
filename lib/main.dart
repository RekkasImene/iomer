import 'dart:async';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:iomer/models/bdd/iomer_database.dart';
import 'package:iomer/ui/accueil_screen.dart';
import 'package:iomer/ui/action_screen.dart';
import 'package:iomer/ui/report_screen.dart';
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
  late Future<Sites> futureSite;
  late Future<Origines> futureOrigines;
  late Future<Matricules> futureMatricules;
  late Future<Equipements> futureEquipements;
  late Future<Categories> futureCategories;
  late Future<OTs> futureOTs;
  late Future<OTTaches> futureOTTaches;
  @override
  void initState() {
    super.initState();
    int idSite = 2;
    int idOrigine = 21;
    int idOT = 203;
    futureSite = fetchSite();
    futureOrigines = fetchOrigines(idSite);
    futureMatricules = fetchMatricules(idOrigine);
    futureEquipements = fetchEquipements(idSite);
    futureCategories = fetchCategories(idSite);
    futureOTs = fetchOTs(idSite, idOrigine);
    futureOTTaches = fetchOTTaches(idOT);

    IomerDatabase database;
    database = IomerDatabase();
    final site = Site(
      nomSite: 'azerty',
      codeSite: 'zero',
      adresseSite: 'klklkl',
      idSite: 1,
    );

    database.insertSite(site);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IOmere',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: const ReportScreen(),
    );
  }
}
