import 'package:flutter/material.dart';
import '../constants.dart';

class CharacterCyberware extends StatefulWidget {
  const CharacterCyberware({super.key});

  @override
  State<StatefulWidget> createState() => _CharacterCyberwareState();
}

class _CharacterCyberwareState extends State<CharacterCyberware> {
  List<String> environmentList = ChildhoodEnvironment;
  String environment = ChildhoodEnvironment[0];

  List<String> crisisList = FamilyCrisis;
  String crisis = FamilyCrisis[0];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage("Cyberwire.png"),
        fit: BoxFit.cover,
      )),
      child: Center(),
    );
  }
}
