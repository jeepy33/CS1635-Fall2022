// ignore_for_file: avoid_print, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import '../constants.dart';
import 'package:tabbed_view/tabbed_view.dart';
import '../constants.dart';
import '../constants.dart';
import '../main.dart';
import '../model/model.dart';
import '../presenter/presenter.dart';

//import 'package:flutter/services.dart';

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

    Set<Widget> widgetAware = {};
    tabs.add(
      TabData(
        text: 'Awareness',
        content: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(children: <Widget>[
            ...widgetAware,
            for (String key in awarenessSkills.keys)
              Row(
                children: [
                  Text(key), // Display the key
                  SizedBox(
                      width:
                          8), // Add some space between the key and the text field
                  Expanded(
                    child: TextField(
                      // inputFormatters: [
                      //   TextInputFormatter(RegExp("^[0-9]$|^10$")),
                      // ],
                      controller: TextEditingController(
                          text: "${mapKeys(awarenessSkills, key)}"),
                      decoration: InputDecoration(
                        hintText: "Value must be in the range 0-10",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              4), // Set the border radius to make the text field smaller
                        ),
                      ),
                      onChanged: (value) {
                        if (int.tryParse(value) != null &&
                            int.parse(value) >= 0 &&
                            int.parse(value) <= 10) {
                          setState(() {
                            awarenessSkills[key] = value;
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
          ]),
        ),
      ),
    );
    Set<Widget> widgetBody = {};
    tabs.add(
      TabData(
        text: 'Body',
        content: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(children: <Widget>[
            ...widgetBody,
            for (String key in bodySkills.keys)
              Row(
                children: [
                  Text(key), // Display the key
                  const SizedBox(
                      width:
                          8), // Add some space between the key and the text field
                  Expanded(
                    child: TextField(
                      // inputFormatters: [
                      //   TextInputFormatter(RegExp("^[0-9]$|^10$")),
                      // ],
                      controller: TextEditingController(
                          text: "${mapKeys(bodySkills, key)}"),
                      decoration: InputDecoration(
                        hintText: "Value must be in the range 0-10",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              4), // Set the border radius to make the text field smaller
                        ),
                      ),
                      onChanged: (value) {
                        if (int.tryParse(value) != null &&
                            int.parse(value) >= 0 &&
                            int.parse(value) <= 10) {
                          setState(() {
                            bodySkills[key] = value;
                            setState(() {});
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
          ]),
        ),
      ),
    );
    Set<Widget> widgetCon = {};
    tabs.add(
      TabData(
        text: 'Control',
        content: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(children: <Widget>[
            ...widgetCon,
            for (String key in controlSkills.keys)
              Row(
                children: [
                  Text(key), // Display the key
                  SizedBox(
                      width:
                          8), // Add some space between the key and the text field
                  Expanded(
                    child: TextField(
                      // inputFormatters: [
                      //   TextInputFormatter(RegExp("^[0-9]$|^10$")),
                      // ],
                      controller: TextEditingController(
                          text: "${mapKeys(controlSkills, key)}"),
                      decoration: InputDecoration(
                        hintText: "Value must be in the range 0-10",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              4), // Set the border radius to make the text field smaller
                        ),
                      ),
                      onChanged: (value) {
                        if (int.tryParse(value) != null &&
                            int.parse(value) >= 0 &&
                            int.parse(value) <= 10) {
                          setState(() {
                            controlSkills[key] = value;
                            setState(() {});
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
          ]),
        ),
      ),
    );

///////////////////////////////////
    Set<Widget> widgetEd = {};
    tabs.add(
      TabData(
        text: 'Education',
        content: Padding(
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              ...widgetEd,
              for (String key in educationSkills.keys)
                Row(
                  children: [
                    Text(key), // Display the key
                    SizedBox(
                        width:
                            8), // Add some space between the key and the text field
                    Expanded(
                      child: TextField(
                        // inputFormatters: [
                        //   TextInputFormatter(RegExp("^[0-9]$|^10$")),
                        // ],
                        controller: TextEditingController(
                            text: "${mapKeys(educationSkills, key)}"),
                        decoration: InputDecoration(
                          hintText: "Value must be in the range 0-10",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                4), // Set the border radius to make the text field smaller
                          ),
                        ),
                        onChanged: (value) {
                          if (int.tryParse(value) != null &&
                              int.parse(value) >= 0 &&
                              int.parse(value) <= 10) {
                            setState(() {
                              educationSkills[key] = value;
                              setState(() {});
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
            ]),
          ),
        ),
      ),
    );

////////////////////////////
    Set<Widget> widgetFight = {};
    tabs.add(
      TabData(
        text: 'Fighting',
        content: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(children: <Widget>[
            ...widgetFight,
            for (String key in fightingSkills.keys)
              Row(
                children: [
                  Text(key), // Display the key
                  SizedBox(
                      width:
                          8), // Add some space between the key and the text field
                  Expanded(
                    child: TextField(
                      // inputFormatters: [
                      //   TextInputFormatter(RegExp("^[0-9]$|^10$")),
                      // ],
                      controller: TextEditingController(
                          text: "${mapKeys(fightingSkills, key)}"),
                      decoration: InputDecoration(
                        hintText: "Value must be in the range 0-10",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              4), // Set the border radius to make the text field smaller
                        ),
                      ),
                      onChanged: (value) {
                        if (int.tryParse(value) != null &&
                            int.parse(value) >= 0 &&
                            int.parse(value) <= 10) {
                          setState(() {
                            fightingSkills[key] = value;
                            setState(() {});
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
          ]),
        ),
      ),
    );
///////////////////////////////////////
    Set<Widget> widgetPerform = {};
    tabs.add(
      TabData(
        text: 'Performance',
        content: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(children: <Widget>[
            ...widgetPerform,
            for (String key in performanceSkills.keys)
              Row(
                children: [
                  Text(key), // Display the key
                  SizedBox(
                      width:
                          8), // Add some space between the key and the text field
                  Expanded(
                    child: TextField(
                      // inputFormatters: [
                      //   TextInputFormatter(RegExp("^[0-9]$|^10$")),
                      // ],
                      controller: TextEditingController(
                          text: "${mapKeys(performanceSkills, key)}"),
                      decoration: InputDecoration(
                        hintText: "Value must be in the range 0-10",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              4), // Set the border radius to make the text field smaller
                        ),
                      ),
                      onChanged: (value) {
                        if (int.tryParse(value) != null &&
                            int.parse(value) >= 0 &&
                            int.parse(value) <= 10) {
                          setState(() {
                            performanceSkills[key] = value;
                            setState(() {});
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
          ]),
        ),
      ),
    );
///////////////////////////////////////////////
    Set<Widget> widgetRanged = {};
    tabs.add(
      TabData(
        text: 'Ranged Weapons',
        content: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(children: <Widget>[
            ...widgetRanged,
            for (String key in rangedWeaponSkills.keys)
              Row(
                children: [
                  Text(key), // Display the key
                  SizedBox(
                      width:
                          8), // Add some space between the key and the text field
                  Expanded(
                    child: TextField(
                      // inputFormatters: [
                      //   TextInputFormatter(RegExp("^[0-9]$|^10$")),
                      // ],
                      controller: TextEditingController(
                          text: "${mapKeys(rangedWeaponSkills, key)}"),
                      decoration: InputDecoration(
                        hintText: "Value must be in the range 0-10",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              4), // Set the border radius to make the text field smaller
                        ),
                      ),
                      onChanged: (value) {
                        if (int.tryParse(value) != null &&
                            int.parse(value) >= 0 &&
                            int.parse(value) <= 10) {
                          setState(() {
                            rangedWeaponSkills[key] = value;
                            setState(() {});
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
          ]),
        ),
      ),
    );
///////////////////////////////////////////
    Set<Widget> widgetTech = {};
    tabs.add(
      TabData(
        text: 'Technique',
        content: Padding(
          padding: const EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              ...widgetTech,
              for (String key in techniqueSkills.keys)
                Row(
                  children: [
                    Text(key), // Display the key
                    SizedBox(
                        width:
                            8), // Add some space between the key and the text field
                    Expanded(
                      child: TextField(
                        // inputFormatters: [
                        //   TextInputFormatter(RegExp("^[0-9]$|^10$")),
                        // ],
                        controller: TextEditingController(
                            text: "${mapKeys(techniqueSkills, key)}"),
                        decoration: InputDecoration(
                          hintText: "Value must be in the range 0-10",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                4), // Set the border radius to make the text field smaller
                          ),
                        ),
                        onChanged: (value) {
                          if (int.tryParse(value) != null &&
                              int.parse(value) >= 0 &&
                              int.parse(value) <= 10) {
                            setState(() {
                              techniqueSkills[key] = value;
                              setState(() {});
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
            ]),
          ),
        ),
      ),
    );

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

  String mapKeys(Map<String, String> map, String key) {
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
    // map.forEach((key, value) {
    if (map[key] == 'DEX') result += "$dex";
    if (map[key] == 'HUM') result += "$hum";
    if (map[key] == 'COOL') result += "$cool\n";
    if (map[key] == 'EMP') result += "$emp";
    if (map[key] == 'LUCK') result += "$luck";
    if (map[key] == 'WILL') result += "$will";
    if (map[key] == 'TECH') result += "$tech";
    if (map[key] == 'REF') result += "$ref";
    if (map[key] == 'INT') result += "$int";
    // });
    return result;
  }
}
