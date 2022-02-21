
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iomer/bloc/report/report_bloc.dart';
import 'package:iomer/config/injection.dart';
import 'package:iomer/ui/utils/info.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);
  final ImagePicker imgPicker = ImagePicker();
  String imgPath = "";
  StreamController<List<Uint8List>> baseString = StreamController();
  List<Uint8List> listDocuments = [];

  final ReportBloc _reportBloc = getIt.get<ReportBloc>();
  final textfieldController = TextEditingController();

  openImage() async {
    var pickedFile = await imgPicker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      imgPath = pickedFile.path;
      File imgFile = File(imgPath);
      Uint8List imgbytes = await imgFile.readAsBytes();
      listDocuments.add(imgbytes);
      //String base64string= base64.encode(imgbytes);
      //print("base64string : "+base64string);
      baseString.add(listDocuments);
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
              controller: textfieldController,
              minLines: 1,
              maxLines: 100,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
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
          StreamBuilder<List<Uint8List>>(
              stream: baseString.stream,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (!snapshot.hasData) {
                  return const Text("");
                } else {
                  return SizedBox(
                      height: 300,
                      child: ListView.builder(
                          itemCount: snapshot.data.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Image(
                              image: ResizeImage(
                                  MemoryImage(snapshot.data[index]),
                                  height: 280,
                                  width: 200),
                            );
                          }));
                }
              }),
          SizedBox(
            width: double.maxFinite,
            child: ElevatedButton(
              onPressed: () {
                _reportBloc.add(
                    ValidateReport(listDocuments, textfieldController.text));
                Navigator.pop(
                  context,
                );
              },
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
