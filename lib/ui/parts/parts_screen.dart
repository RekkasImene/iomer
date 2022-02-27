import 'package:flutter/material.dart';
import 'package:iomere/ui/parts/components/body_parts.dart';

class PartsScreen extends StatefulWidget {
  const PartsScreen({Key? key}) : super(key: key);

  @override
  State<PartsScreen> createState() => _PartsScreenState();
}

class _PartsScreenState extends State<PartsScreen> {
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
