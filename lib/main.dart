
import 'package:flutter/material.dart';
import 'package:iomer/models/repository/in_repository.dart';
import 'package:iomer/ui/debug_screens.dart';
import 'config/injection.dart';
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
    InRepository repository = getIt.get<InRepository>();
    //repository.updateSite();
    //repository.updateMatricules(14);
    repository.pushDB(1,"P02");
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
