import 'package:flutter/material.dart';
import '../constants.dart';

class CharacterSkills extends StatefulWidget {
  const CharacterSkills({super.key});

  @override
  State<StatefulWidget> createState() => _CharacterSkillsState();
}

class _CharacterSkillsState extends State<CharacterSkills> {
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
