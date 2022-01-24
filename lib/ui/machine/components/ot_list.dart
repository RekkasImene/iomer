import 'package:flutter/material.dart';
import 'package:iomer/ui/machine/components/ot_button.dart';

class OTListWidget extends StatefulWidget {
  const OTListWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OTListState();
}

class _OTListState extends State<OTListWidget> {
  static const List<String> _list = [
    "Révision des 1000%",
    "Action corrective",
    "Parallélisme roues",
    "Révision des 1000%",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0),
          child: Text(
            'Listes des ordres de travaux',
            style: TextStyle(fontSize: 18),
          ),
        ),
        Expanded(
          child: Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: _list.length,
                      itemBuilder: (context, index) {
                        return ListTile(title: Text(_list[index]));
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: OTButtonWidget(),
                      ),
                    ],
                  ),
                ],
              )),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Scan machine'),
            style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
          ),
        )
      ],
    );
  }
}
