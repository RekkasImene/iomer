import 'package:flutter/material.dart';
import 'package:iomer/ui/utils/info.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Maintenance'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Compte rendu : ",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Info(),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: TextFormField(
                minLines: 1,
                maxLines: 100,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  hintText: "Saisir un compte rendu",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.camera_alt),
                    onPressed: null,
                    iconSize: 40,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                //pour griser
                onPressed: () {},
                //onPressed:(),
                child: const Text(
                  'valider',
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
