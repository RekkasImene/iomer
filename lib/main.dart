
import 'package:flutter/material.dart';


import 'package:iomer/ui/select_machine.dart';


void main() {
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
    

  
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IOmere',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: const SelectMachine(),
    );
  }
}