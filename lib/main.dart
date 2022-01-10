import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:iomer/models/bdd/iomer_database.dart';
import 'package:iomer/webService/services.dart';

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
  late Future<List<Origine>> futureOrigines;
  late Future<List<Matricule>> futureMatricules;
  late Future<List<Equipement>> futureEquipements;
  late Future<List<Categorie>> futureCategories;
  late Future<List<OtData>> futureOTs;
  late Future<List<Tache>> futureOTTaches;
  @override
  void initState()  {
    super.initState();

    IomerDatabase database;
    database = IomerDatabase();
    futureSite=fetchSite();

    futureSite.then((value) {
      value.forEach((e) {
        database.insertSite(SitesCompanion.insert(
          CODESITE: e.CODESITE,
          NOMSITE:  e.NOMSITE,
          ADRESSESITE: e.ADRESSESITE,));
      });
    }).catchError((error){
      log(error);
    });

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