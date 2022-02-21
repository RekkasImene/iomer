import 'package:flutter/material.dart';

class NavButton extends StatefulWidget {
  final Widget navDestination;
  final String navName;
  const NavButton({Key? key, required this.navDestination, required this.navName}) : super(key: key);

  @override
  State<NavButton> createState() => _NavButtonState();
}


class _NavButtonState extends State<NavButton> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => widget.navDestination),
          );
        },
        child: Text(
          widget.navName,
          style: const TextStyle(fontSize: 20),
        ),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(20.0),
        ),
      ),
    );
  }
}
