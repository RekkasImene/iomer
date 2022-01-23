import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  const Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.all(Radius.circular(40.0)),
      ),
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Align(
                child: Text(
              "№ OT : OT802011",
              style: TextStyle(fontSize: 20, color: Colors.white),
            )),
            Align(
                child: Text(
              "Maintenance: Action corrective",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ))
          ],
        ),
      ),
    );
  }
}
