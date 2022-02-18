import 'package:flutter/material.dart';
import 'package:iomer/ui/action/action_screen.dart';
import 'package:iomer/ui/cloture/cloture_screen.dart';
import 'package:iomer/ui/home/home_screen.dart';
import 'package:iomer/ui/machine/machine_screen.dart';
import 'package:iomer/ui/new_part/new_part_screen.dart';
import 'package:iomer/ui/parts/parts_screen.dart';
import 'package:iomer/ui/report/report_screen.dart';
import 'package:iomer/ui/scan/scan_screen.dart';
import 'package:iomer/ui/task/tasks_screen.dart';
import 'package:iomer/ui/utils/nav_button.dart';

import 'matricule/first_screen.dart';

class DebugScreen extends StatelessWidget {
  const DebugScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iomere'),
      ),
      body: ListView(
        children: [
          NavButton(navDestination: const ActionScreen(), navName: 'ActionScreen'),
          NavButton(navDestination: const ClotureOtScreen(), navName: 'ClotureOtScreen'),
          NavButton(navDestination: const HomeScreen(), navName: 'HomeScreen'),
          NavButton(navDestination: const MachineScreen(), navName: 'MachineScreen'),
          NavButton(navDestination: const FirstScreen(), navName: 'FirstScreen (matricule)'),
          NavButton(navDestination: const NewPartScreen(), navName: 'NewPartScreen'),
          NavButton(navDestination: const PartsScreen(), navName: 'PartsScreen'),
          NavButton(navDestination: const ReportScreen(), navName: 'ReportScreen'),
          NavButton(navDestination: const TasksScreen(), navName: 'TasksScreen'),
          NavButton(navDestination: const ScanScreen(), navName: 'ScanScreen'),
        ],
      ),
    );
  }
}
