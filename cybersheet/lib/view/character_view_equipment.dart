import 'package:flutter/material.dart';
import '../constants.dart';

class CharacterEquipment extends StatefulWidget {
  const CharacterEquipment({super.key});

  @override
  State<StatefulWidget> createState() => _CharacterEquipmentState();
}

class _CharacterEquipmentState extends State<CharacterEquipment> {
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
