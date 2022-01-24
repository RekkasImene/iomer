import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:iomer/models/bdd/iomer_database.dart';
import 'package:iomer/models/repository/in_repository.dart';
import 'package:iomer/ui/action/action_screen.dart';
import 'package:iomer/ui/cloture/cloture_screen.dart';
import 'package:iomer/ui/debug_screens.dart';
import 'package:iomer/ui/home/home_screen.dart';
import 'package:iomer/ui/new_part/new_part_screen.dart';
import 'package:iomer/ui/parts/parts_screen.dart';
import 'package:iomer/ui/report/report_screen.dart';
import 'package:iomer/ui/task/tasks_screen.dart';
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
    //InRepository repository = getIt.get<InRepository>();
    //repository.updateSite();
    //repository.updateMatricules(14);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IomereApp',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const DebugScreen(),
    );
  }
}
