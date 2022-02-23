import 'package:flutter/material.dart';
import 'package:iomere/ui/home/components/body_home.dart';

class NewPartScreen extends StatefulWidget {
  const NewPartScreen({Key? key}) : super(key: key);

  @override
  State<NewPartScreen> createState() => _NewPartScreenState();
}

class _NewPartScreenState extends State<NewPartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Maintenance'),
      ),
      body: const Body(),
    );
  }
}
