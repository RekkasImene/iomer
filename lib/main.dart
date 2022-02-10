import 'package:flutter/material.dart';
import 'package:iomer/ui/debug_screens.dart';
import 'config/injection.dart';
<<<<<<< HEAD
import 'models/repository/local_repository.dart';
=======
>>>>>>> 222ebcd85234aea310f5c819def8e30bde42567e

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
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blueGrey,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          //onPrimary: Colors.yellow,
          primary: Colors.blueGrey,
        )),
      ),
      home: const DebugScreen(),
    );
  }
}
