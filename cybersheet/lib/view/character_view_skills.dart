// ignore_for_file: avoid_print, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:tabbed_view/tabbed_view.dart';
import '../main.dart';
import '../model/model.dart';

class CharacterSkills extends StatefulWidget {
  const CharacterSkills({super.key});
  // ignore: non_constant_identifier_names
  //TabbedViewExample(),

  @override
  State<StatefulWidget> createState() => _CharacterSkillsState();
}

class _CharacterSkillsState extends State<CharacterSkills> {
  List<String> environmentList = ChildhoodEnvironment;
  String environment = ChildhoodEnvironment[0];
  Map<String, String> itemMap = awarenessSkills;
  late TabbedViewController _controller;
  final key = 'someKey';
  final controller = TextEditingController();
  List<Widget> widgets = [];

// Loop through the keys in the map
// for (String key in rangedWeaponSkills.keys) {
//   // Create a TextField for each key in the map
//   widgets.add(
//     TextField(
//       // Bind the value of the TextField to the corresponding value in the map
//       controller: TextEditingController(text: rangedWeaponSkills[key]),
//       textAlign: TextAlign.left,
//       onChanged: (value) {
//         // Update the value of the item in the map when the user changes the value in the TextField
//         setState(() {
//           rangedWeaponSkills[key] = value;
//         });
//       },
//     ),
//   );
// }

  List<String> crisisList = FamilyCrisis;

  String crisis = FamilyCrisis[0];

  @override
  void initState() {
    super.initState();
    List<TabData> tabs = [];

    tabs.add(TabData(
        text: 'Awareness',
        content: Padding(
            padding: const EdgeInsets.all(8),
            child: Text(mapToString(awarenessSkills)))));
    tabs.add(TabData(
        closable: false,
        // keepAlive: true,
        text: 'Body',
        content: Padding(
            padding: const EdgeInsets.all(8),
            child: Text(mapToString(bodySkills)))));
    tabs.add(TabData(
        text: 'Control',
        content: const Padding(
            child: TextField(
                decoration: InputDecoration(
                    isDense: true, border: OutlineInputBorder())),
            padding: EdgeInsets.all(8)),
        keepAlive: true));
    tabs.add(TabData(
        text: 'Education',
        content: Padding(
            padding: const EdgeInsets.all(8),
            child: Text(mapToString(educationSkills)))));
    tabs.add(TabData(
        text: 'Fighting',
        content: Padding(
            padding: const EdgeInsets.all(8),
            child: Text(mapToString(fightingSkills)))));
    tabs.add(TabData(
        text: 'Preformance',
        content: Padding(
            padding: const EdgeInsets.all(8),
            child: Text(mapToString(performanceSkills)))));

    Set<Widget> widgets = {
      for (String key in rangedWeaponSkills.keys)
        TextField(
          controller: TextEditingController(text: rangedWeaponSkills[key]),
          textAlign: TextAlign.left,
          onChanged: (value) {
            setState(() {
              rangedWeaponSkills[key] = value;
            });
          },
        ),
    };

    tabs.add(
      TabData(
        text: 'Ranged Weapon',
        content: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(children: <Widget>[
            ...widgets,
            Text(
              mapToString(rangedWeaponSkills),
              textAlign: TextAlign.left,
            ),
          ]),
        ),
      ),
    );

    tabs.add(TabData(
        text: 'Technique',
        content: Padding(
            padding: const EdgeInsets.all(8),
            child: Text(mapToString(techniqueSkills)))));

    _controller = TabbedViewController(tabs);
  }

  @override
  Widget build(BuildContext context) {
    TabbedView tabbedView = TabbedView(controller: _controller);
    Widget w =
        TabbedViewTheme(child: tabbedView, data: TabbedViewThemeData.mobile());
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage("Cyberwire.png"),
        fit: BoxFit.cover,
      )),
      child: w,
      padding: EdgeInsets.all(32),
    );
  }

  String mapToString(Map<String, String> map) {
    String dex = presenter.model.character.stats.DEX.toString();
    String hum = presenter.model.character.stats.HUM.toString();
    String cool = presenter.model.character.stats.COOL.toString();
    String will = presenter.model.character.stats.WILL.toString();
    String tech = presenter.model.character.stats.DEX.toString();
    String luck = presenter.model.character.stats.LUCK.toString();
    String emp = presenter.model.character.stats.EMP.toString();
    String ref = presenter.model.character.stats.REF.toString();
    String int = presenter.model.character.stats.INT.toString();
    String result = "";
    map.forEach((key, value) {
      if (map[key] == 'DEX') result += "$key: $dex\n";
      if (map[key] == 'HUM') result += "$key: $hum\n";
      if (map[key] == 'COOL') result += "$key: $cool\n";
      if (map[key] == 'EMP') result += "$key: $emp\n";
      if (map[key] == 'LUCK') result += "$key: $luck\n";
      if (map[key] == 'WILL') result += "$key: $will\n";
      if (map[key] == 'TECH') result += "$key: $tech\n";
      if (map[key] == 'REF') result += "$key: $ref\n";
      if (map[key] == 'INT') result += "$key: $int\n";
    });
    return result;
  }
}
