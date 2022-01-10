import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:iomer/models/bdd/iomer_database.dart';
import 'package:iomer/models/bdd/site.dart';
import 'package:iomer/models/repository/in_repository.dart';
import 'package:iomer/webService/categories.dart';
import 'package:iomer/webService/equipements.dart';
import 'package:iomer/webService/matricules.dart';
import 'package:iomer/webService/origines.dart';
import 'package:iomer/webService/ot_taches.dart';
import 'package:iomer/webService/ots.dart';
import 'package:iomer/webService/services.dart';

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
    InRepository repository = getIt.get<InRepository>();
    repository.updateSite();
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
