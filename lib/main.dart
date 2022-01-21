import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:iomer/models/bdd/iomer_database.dart';
import 'package:iomer/models/repository/in_repository.dart';
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
  @override
  void initState() {
    super.initState();
<<<<<<< HEAD
    //InRepository repository = getIt.get<InRepository>();

    /*repository.updateSite();
    sleep(const Duration(seconds: 1));
    repository.updateMatricules(12);
    sleep(const Duration(seconds: 1));*/
    // repository.updateOTs(1,12);
    //sleep(const Duration(seconds: 1));
    //   repository.updateOrigines(2);
    //  sleep(const Duration(seconds: 1));
    //repository.updateTaches(203);
    //sleep(const Duration(seconds: 1));
=======
    InRepository repository = getIt.get<InRepository>();
    repository.updateSite();
    repository.updateMatricules(14);
>>>>>>> tina_branch
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IomereApp',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomeScreen(),
    );
  }
}