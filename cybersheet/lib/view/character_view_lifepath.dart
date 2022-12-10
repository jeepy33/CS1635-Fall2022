import 'package:flutter/material.dart';
import '../constants.dart';

class CharacterLifepath extends StatefulWidget {
  const CharacterLifepath({super.key});

  @override
  State<StatefulWidget> createState() => _CharacterLifepathState();
}

class _CharacterLifepathState extends State<CharacterLifepath> {
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
