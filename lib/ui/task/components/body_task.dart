import 'package:flutter/material.dart';
import 'package:iomer/ui/task/components/task_list.dart';
import 'package:iomer/ui/utils/info.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Listes des taches a effectuer :",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Info(OtCode: "widget.OtCode", OtLibelle: "widget.OtLibelle",),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: TaskList(),
            ),
          ),
          SizedBox(
            width: double.maxFinite,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text(
                'valider',
                style: TextStyle(fontSize: 20),
              ),
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
