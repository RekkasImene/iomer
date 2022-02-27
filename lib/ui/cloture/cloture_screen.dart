import 'package:flutter/material.dart';
import 'package:iomere/ui/cloture/components/body_cloture.dart';

class ClotureOtScreen extends StatefulWidget {
  const ClotureOtScreen({Key? key}) : super(key: key);

  @override
  State<ClotureOtScreen> createState() => _ClotureOtScreenState();
}

class _ClotureOtScreenState extends State<ClotureOtScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maintenance'),
      ),
      body:  const Body(),
    );
  }
}
