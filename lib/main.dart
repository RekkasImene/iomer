import 'dart:async';
import 'package:flutter/material.dart';
import 'package:iomer/webService/site.dart';
import 'package:iomer/webService/site_service.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Site> futureSite;

  @override
  void initState() {
    super.initState();
    futureSite = fetchSite();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Site>(
            future: futureSite,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.nomsite);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}