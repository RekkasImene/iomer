import 'package:flutter/material.dart';
import 'package:images_picker/images_picker.dart';
import 'package:iomer/ui/machine/machine_screen.dart';
import 'package:scan/scan.dart';

class QrScanner extends StatelessWidget {
  ScanController controller = ScanController();
  String qrcode = 'Unknown';

  QrScanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 400,
          child: ScanView(
            controller: controller,
            scanAreaScale: .7,
            scanLineColor: Colors.green,
            onCapture: (data) {
              qrcode = data;
              (context as Element).markNeedsBuild();
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MachineScreen(
                          text: qrcode,
                        )),
              );
            },
          ),
        ),
        ElevatedButton(
          onPressed: () {
            controller.toggleTorchMode();
          },
          child: Icon(Icons.flash_on),
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(20),
            //primary: Colors.blue, // <-- Button color
            //onPrimary: Colors.red, // <-- Splash color
          ),
        )
      ],
    );
  }
}
