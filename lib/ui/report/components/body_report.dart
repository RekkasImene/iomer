
import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iomer/ui/utils/info.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);
  final ImagePicker imgPicker =ImagePicker();
  String imgPath = "";
  StreamController<String> baseString = StreamController();

  openImage() async{
    var pickedFile= await imgPicker.pickImage(source: ImageSource.camera);
    if (pickedFile != null)
    {
      imgPath=pickedFile.path;
      print("imgPath : "+imgPath);
      File imgFile=File(imgPath);
      Uint8List imgbytes= await imgFile.readAsBytes();
      String base64string= base64.encode(imgbytes);
      print("base64string : "+base64string);
      baseString.add(base64string);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Info(),
          ),
          Expanded(
            child: TextFormField(
              minLines: 1,
              maxLines: 100,
              keyboardType: TextInputType.multiline,
              decoration:  InputDecoration(
                hintText: "Saisir un compte rendu",
                hintStyle: const TextStyle(color: Colors.grey),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.camera_alt),
                  onPressed: () => openImage(),
                  iconSize: 40,
                ),
              ),
            ),
          ),
          StreamBuilder<String>(
            stream: baseString.stream,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (!snapshot.hasData) {
                  return const Text("");
                } else {
                  log("snapshoot" +snapshot.data);
                  return Image(
                    image: ResizeImage(MemoryImage(base64.decode(snapshot.data)), width: 50, height: 100),
                  );

                }
              }
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
            ),
          ),
        ],
      ),
    );
  }
}
