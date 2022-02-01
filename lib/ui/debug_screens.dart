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
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ActionScreen(OtCode: '', OtLibelle: '',)),
                  );
                },
                child: const Text('ActionScreen', style: TextStyle(fontSize: 20)),
                style: ElevatedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ClotureOtScreen()),
                  );
                },
                child:
                    const Text('ClotureOtScreen', style: TextStyle(fontSize: 20)),
                style: ElevatedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                child: const Text('HomeScreen', style: TextStyle(fontSize: 20)),
                style: ElevatedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MachineScreen(text: "",)),
                  );
                },
                child:
                    const Text('MachineScreen', style: TextStyle(fontSize: 20)),
                style: ElevatedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FirstScreen()),
                  );
                },
                child: const Text('FirstScreen (matricule)',
                    style: TextStyle(fontSize: 20)),
                style: ElevatedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NewPartScreen()),
                  );
                },
                child:
                    const Text('NewPartScreen', style: TextStyle(fontSize: 20)),
                style: ElevatedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PartsScreen()),
                  );
                },
                child: const Text('PartsScreen', style: TextStyle(fontSize: 20)),
                style: ElevatedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ReportScreen()),
                  );
                },
                child: const Text('ReportScreen', style: TextStyle(fontSize: 20)),
                style: ElevatedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TasksScreen()),
                  );
                },
                child: const Text('TasksScreen', style: TextStyle(fontSize: 20)),
                style: ElevatedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
              ),
            ),



            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ScanScreen()),
                  );
                },
                child: const Text('ScanScreen', style: TextStyle(fontSize: 20)),
                style: ElevatedButton.styleFrom(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
              ),
            ),

          ],
        ),
    );
  }
}
