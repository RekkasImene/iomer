import 'package:flutter/material.dart';

import 'components/body_journal.dart';

class JournalScreen extends StatelessWidget {
  const JournalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Iomere'),
        ),
        body: const Body());
  }
}
