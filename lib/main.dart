import 'package:flutter/material.dart';
import 'package:iomer/resources/theme.dart';
import 'package:iomer/ui/debug_screens.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IomereApp',
      theme: darkTheme(),
      darkTheme: darkTheme(),
      home: const DebugScreen(),
    );
  }
}
