import 'package:flutter/material.dart';
import 'package:iomer/ui/report/components/body_report.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Maintenance'),
        ),
        body:  Body(),
    );
  }
}
