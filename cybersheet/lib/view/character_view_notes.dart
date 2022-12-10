import 'package:flutter/material.dart';
import '../constants.dart';

class CharacterNotes extends StatefulWidget {
  const CharacterNotes({super.key});

  @override
  State<StatefulWidget> createState() => _CharacterNotesState();
}

class _CharacterNotesState extends State<CharacterNotes> {
  List<String> environmentList = ChildhoodEnvironment;
  String environment = ChildhoodEnvironment[0];

  List<String> crisisList = FamilyCrisis;
  String crisis = FamilyCrisis[0];
  TextEditingController textarea = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("Cyberwire.png"),
          fit: BoxFit.cover,
        )),
        child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(20),
            child: Column(children: [
              TextField(
                controller: textarea,
                keyboardType: TextInputType.multiline,
                maxLines: 20,
                decoration: InputDecoration(
                    hintText: "Enter Notes",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 3, color: Colors.black26))),
              ),
            ])));
  }
}
