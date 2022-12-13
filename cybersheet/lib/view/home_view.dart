import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:cybersheet/main.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../model/model.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: cyberRed,
        body: Center(
          child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("Cyberwire.png"),
                fit: BoxFit.cover,
              )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Image(
                          image: AssetImage("Cybersheet_Logo.png"),
                          width: 1000)),
                  const Padding(
                      padding: EdgeInsets.only(bottom: 0),
                      child: Text(
                        'Home',
                        style: TextStyle(fontSize: 35, color: Colors.white),
                      )),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: buttonRed,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 60, vertical: 25),
                          textStyle: const TextStyle(
                              fontSize: 20, fontFamily: 'Kontakt'),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, newCharRoute,
                              arguments: 'arguments/chose NEW');
                        },
                        child: const Text('New Edgerunner'),
                      ),
                      const SizedBox(height: 20, width: 30),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: buttonRed,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 60, vertical: 25),
                          textStyle: const TextStyle(
                              fontSize: 20, fontFamily: 'Kontakt'),
                        ),
                        onPressed: () {
                          _readSelectedFile(context);
                        },
                        child: const Text('Edit Edgerunner'),
                      )
                    ],
                  ),
                ],
              )),
        ));
  }

  _readSelectedFile(context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        dialogTitle: 'Select .json file for character',
        allowMultiple: false,
        allowCompression: false,
        type: FileType.custom,
        allowedExtensions: ['json']);

    print(1);

    if (result != null) {
      print(2);
      Uint8List uint8list = result.files.single.bytes!;
      print(3);
      String s = String.fromCharCodes(uint8list);
      print(4);
      print(s);
      print(5);
      Map<String, dynamic> userMap = jsonDecode(s);
      print(userMap['name']);
      print(6);
      presenter.model = Model.fromJson(userMap);
      print(7);
      Navigator.pushNamed(context, editCharRoute,
          arguments: 'arguments/chose EDIT');
    } else {
      print('result is null');
    }
  }
}
