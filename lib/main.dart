import 'dart:async';
import 'package:flutter/material.dart';
import 'package:iomer/models/bdd/iomer_database.dart';
import 'package:iomer/models/repository/in_repository.dart';
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
    postOt(101,"teston Encore une nouvelle fois avec espace ",12,"1");
    print("finnnnnnnnnnnnnnnnnnnnn");
    //http://localhost:8080/datasnap/rest/TServerMethodsIOmere/SetOt/101/testont%20ot%20encore/12/1
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
