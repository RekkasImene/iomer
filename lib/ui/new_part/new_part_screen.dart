import 'package:flutter/material.dart';
import 'package:iomer/ui/new_part/components/body_new_part.dart';

class NewPartScreen extends StatefulWidget {
  const NewPartScreen({Key? key}) : super(key: key);

  @override
  State<NewPartScreen> createState() => _NewPartScreenState();
}

class _NewPartScreenState extends State<NewPartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maintenance'),
      ),
      body: const Body(),
    );
  }
}
