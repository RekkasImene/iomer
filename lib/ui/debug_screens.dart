import 'package:flutter/material.dart';
import 'package:iomere/ui/action/action_screen.dart';
import 'package:iomere/ui/cloture/cloture_screen.dart';
import 'package:iomere/ui/home/home_screen.dart';
import 'package:iomere/ui/machine/machine_screen.dart';
import 'package:iomere/ui/new_part/new_part_screen.dart';
import 'package:iomere/ui/parts/parts_screen.dart';
import 'package:iomere/ui/report/report_screen.dart';
import 'package:iomere/ui/scan/scan_screen.dart';
import 'package:iomere/ui/task/tasks_screen.dart';
import 'package:iomere/ui/utils/nav_button.dart';

import 'journal/journal_screen.dart';
import 'matricule/first_screen.dart';

class DebugScreen extends StatelessWidget {
  const DebugScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('iOmere'),
      ),
      body: ListView(
        children: const [
          NavButton(navDestination: ActionScreen(), navName: 'ActionScreen'),
          NavButton(navDestination: ClotureOtScreen(), navName: 'ClotureOtScreen'),
          NavButton(navDestination: HomeScreen(), navName: 'HomeScreen'),
          NavButton(navDestination: MachineScreen(), navName: 'MachineScreen'),
          NavButton(navDestination: FirstScreen(), navName: 'FirstScreen (matricule)'),
          NavButton(navDestination: NewPartScreen(), navName: 'NewPartScreen'),
          NavButton(navDestination: PartsScreen(), navName: 'PartsScreen'),
          NavButton(navDestination: ReportScreen(), navName: 'ReportScreen'),
          NavButton(navDestination: TasksScreen(), navName: 'TasksScreen'),
          NavButton(navDestination: ScanScreen(), navName: 'ScanScreen'),
          NavButton(navDestination: JournalScreen(), navName: 'JournalScreen'),

        ],
      ),
    );
  }
}
