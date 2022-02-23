import 'package:flutter/material.dart';
import 'package:iomere/ui/home/components/body_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Iomere'),
        ),
        body: const Body());
  }
}
