import 'package:flutter/material.dart';
import '../constants.dart';
import '../main.dart';

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
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    _controller.text = presenter.model.character.saveNotes;
  }

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
            controller: _controller,
            maxLines: 30,
            cursorColor: Colors.white,
            style: const TextStyle(
              color: Colors.white,
            ),
            onChanged: (text) {
              presenter.model.character.saveNotes = text;
            },
            decoration: const InputDecoration(
              focusColor: Colors.white,
              filled: true,
              fillColor: buttonRed,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2.0),
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
        ]),
      ),
    );
  }
}
