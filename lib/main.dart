import 'dart:async';
import 'package:flutter/material.dart';
import 'package:iomer/models/bdd/iomer_database.dart';
import 'package:iomer/models/repository/in_repository.dart';
import 'package:iomer/ui/home_screen.dart';
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

    //repository.updateSite();
    //repository.updateCategories(1);

    // those are test to interact with the local database
    /*
    postOt(101,"teston Encore une nouvelle fois avec espace ",12,"1");//VALIDE
    postOtTache(103,"1","ttt");//VALIDE
    postOtArticle(100020,61);//VALIDE mais les chiffres a virgule non
    postMatricule(111,1);//VALIDE
    postAttachment(101,"debug_attachement");//Incertain
    createOtArticle(101,3,9);//VALIDE
    createOt(101,11,11,"debug2 create ot 2");//VALIDE
    print("fin");

     */
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Iomere',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomeScreen(),
    );
  }
}
