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
  String saveNotes = "";
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage("Cyberwire.png"),
        fit: BoxFit.cover,
      )),
      child: Center(
        child: Column(children: [
          const SizedBox(
            height: 15,
          ),
          const Text('Notes:',
              style: TextStyle(fontSize: 25, color: Colors.white)),
          const SizedBox(height: 15),
          TextField(
            maxLines: 30,
            cursorColor: Colors.white,
            style: TextStyle(
              color: Colors.white,
            ),
            onChanged: (text) {
              print(text);
              saveNotes = text;
            },
            decoration: InputDecoration(
              focusColor: Colors.white,
              filled: true,
              fillColor: buttonRed,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 2.0),
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonRed,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              textStyle: const TextStyle(fontSize: 20, fontFamily: 'Kontakt'),
            ),
            onPressed: () {
              setState(() {});
            },
            child: const Text('Save Notes'),
          ),
        ]),
      ),
    );
  }
}
