import 'package:flutter/material.dart';
import 'package:iomere/resources/theme.dart';
import 'package:iomere/ui/debug_screens.dart';

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
      title: 'iOmereApp',
      theme: lightTheme(),
      darkTheme: darkTheme(),
      home: const DebugScreen(),
    );
  }
}
