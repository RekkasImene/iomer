import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:iomer/models/repository/in_repository.dart';
import 'package:iomer/ui/debug_screens.dart';
import 'config/injection.dart';
import 'package:intl/intl.dart';

import 'models/repository/local_repository.dart';


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

    InRepository inRepository = getIt.get<InRepository>();
    LocalRepository localRepository = getIt.get<LocalRepository>();

  

    


  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IomereApp',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blueGrey,
        elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
        //onPrimary: Colors.yellow,
        primary: Colors.blueGrey,
    )
          ),

      ),
      home: const DebugScreen(),
    );
  }
}
