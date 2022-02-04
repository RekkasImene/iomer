import 'package:flutter/material.dart';
import 'package:images_picker/images_picker.dart';
import 'package:iomer/ui/machine/machine_screen.dart';
import 'package:scan/scan.dart';

class QrScanner extends StatefulWidget {

  QrScanner({Key? key}) : super(key: key);

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  ScanController controller = ScanController();

  String qrcode = 'Unknown';

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
              setState(() {
                qrcode = data;
              });

              (context as Element).markNeedsBuild();
              Navigator.pop(context, qrcode);
            },
          ),
        ),
        ElevatedButton(
          onPressed: () {
            controller.toggleTorchMode();
          },
          child: const Icon(Icons.flash_on),
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(20),
          ),
        )
      ],
    );
  }
}
