import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  final String OtCode;
  final String OtLibelle;
  Info({Key? key,required this.OtCode, required this.OtLibelle}) : super(key: key);

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(40.0)),
      ),
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
                child: Text(
                  widget.OtCode,
              style: TextStyle(fontSize: 20, color: Colors.white),
            )),
            Align(
                child: Text(
              widget.OtLibelle,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ))
          ],
        ),
      ),
    );
  }
}
