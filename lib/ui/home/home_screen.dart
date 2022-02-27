import 'package:flutter/material.dart';
import 'package:iomere/resources/theme.dart';
import 'package:iomere/ui/home/components/body_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
      darkTheme: darkTheme(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('iOmere'),
        ),
        body: const Body(),
      ),
    );
    // return Scaffold(
    //     appBar: AppBar(
    //       title: const Text('iOmere'),
    //     ),
    //     body: const Body());
  }
}
