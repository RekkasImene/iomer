import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:iomer/models/bdd/iomer_database.dart';
import 'package:iomer/models/repository/in_repository.dart';
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

   /*repository.updateSite();
    sleep(const Duration(seconds: 1));
    repository.updateMatricules(12);
    sleep(const Duration(seconds: 1));*/
   // repository.updateOTs(1,12);
    //sleep(const Duration(seconds: 1));
 //   repository.updateOrigines(2);
  //  sleep(const Duration(seconds: 1));
    repository.updateTaches(101);
    sleep(const Duration(seconds: 1));
    



    
    

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
