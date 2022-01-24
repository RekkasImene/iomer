import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:iomer/models/bdd/iomer_database.dart';
import 'package:iomer/models/repository/in_repository.dart';
import 'package:iomer/models/repository/local_repository.dart';
import 'package:iomer/ui/home_screen.dart';
import 'config/injection.dart';

void main() {
  configureInjection(Env.prod);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<List<Site>> futureSite;
  @override
  void initState() {
    super.initState();
    InRepository inRepository = getIt.get<InRepository>();
    LocalRepository localRepository = getIt.get<LocalRepository>();

    /*repository.updateSite();
    sleep(const Duration(seconds: 1));
    repository.updateMatricules(12);
    sleep(const Duration(seconds: 1));*/
    // repository.updateOTs(1,12);
    //sleep(const Duration(seconds: 1));
    //   repository.updateOrigines(2);
    //  sleep(const Duration(seconds: 1));
   // repository.updateMatricules(1, "P02");
  //inRepository.updateOTs(1, 12);
   localRepository.addNewOt(115, 10, 13, "reparation");


  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IomereApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
