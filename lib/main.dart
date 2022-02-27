import 'package:flutter/material.dart';
import 'package:iomere/resources/theme.dart';
import 'package:iomere/ui/home/home_screen.dart';
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
    return GestureDetector(
        onTap: ()=>FocusManager.instance.primaryFocus?.unfocus(),
        onVerticalDragEnd: (DragEndDetails details) => FocusManager.instance.primaryFocus?.unfocus(),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'iOmere',
            theme: lightTheme(),
            darkTheme: darkTheme(),
            home: const HomeScreen(),
        )
    );
  }

}
