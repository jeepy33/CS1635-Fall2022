import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:html' as webFile;

import 'package:cybersheet/view/character_view_cyberware.dart';
import 'package:cybersheet/view/character_view_equipment.dart';
import 'package:cybersheet/view/character_view_lifepath.dart';
import 'package:cybersheet/view/character_view_notes.dart';
import 'package:cybersheet/view/character_view_overview.dart';
import 'package:cybersheet/view/character_view_skills.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import '../constants.dart';

class EditChar extends StatefulWidget {
  const EditChar({super.key});
  @override
  State<StatefulWidget> createState() => _EditChar();
}

class _EditChar extends State<EditChar> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 8, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 6,
        child: Scaffold(
            appBar: AppBar(
              actions: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonRed,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      textStyle:
                          const TextStyle(fontSize: 20, fontFamily: 'Kontakt'),
                    ),
                    onPressed: (() {
                      setState(() {
                        _writeSelectedFile(context);
                      });
                    }),
                    child: const Text('Save Edgerunner'))
              ],
              toolbarHeight: 120,
              backgroundColor: cyberRed,
              automaticallyImplyLeading: false,
              title: const Image(
                image: AssetImage("Cybersheet_Logo.png"),
                width: 400,
                color: Colors.white,
              ),
              bottom: const TabBar(indicatorColor: Colors.white, tabs: [
                Tab(icon: Icon(Icons.badge_sharp)),
                Tab(icon: Icon(Icons.construction_outlined)),
                Tab(icon: Icon(Icons.sports_martial_arts_sharp)),
                Tab(icon: Icon(Icons.account_tree_outlined)),
                Tab(icon: Icon(Icons.people_outlined)),
                Tab(icon: Icon(Icons.note_outlined)),
              ]),
            ),
            backgroundColor: cyberRed,
            body: const TabBarView(children: [
              CharacterOverview(),
              CharacterSkills(),
              CharacterEquipment(),
              CharacterCyberware(),
              CharacterLifepath(),
              CharacterNotes(),
            ])));
  }

  _writeSelectedFile(context) async {
    // final List<int> codeUnits = jsonEncode(presenter.model).codeUnits;
    // Uint8List uint8list = Uint8List.fromList(codeUnits);
    // print(uint8list);
    // print(jsonEncode(presenter.model));

    var blob = webFile.Blob(
        [jsonEncode(presenter.model)], 'application/json', 'native');
    var anchorElement = webFile.AnchorElement(
      href: webFile.Url.createObjectUrlFromBlob(blob).toString(),
    )
      ..setAttribute("download", "${presenter.model.character.name}.json")
      ..click();
  }
}
//         Container(
//             decoration: const BoxDecoration(
//                 image: DecorationImage(
//               image: AssetImage("Cyberwire.png"),
//               fit: BoxFit.cover,
//             )),
//             child: Center(
//                 child: Column(children: <Widget>[
//               TabBar(
//                   controller: _tabController,
//                   labelColor: Colors.white,
//                   indicatorColor: Colors.black,
//                   tabs: const <Widget>[
//                     Tab(icon: Icon(Icons.badge_sharp)),
//                     Tab(
//                         icon: Icon(Icons
//                             .construction_outlined)), // or build_outline, cinstruction
//                     Tab(
//                         icon:
//                             Icon(Icons.sports_martial_arts_sharp)), // sport mma
//                     Tab(icon: Icon(Icons.shield_moon_outlined)),
//                     //Tab(icon: Icon(Icons.auto_fix_high_sharp)),
//                     Tab(icon: Icon(Icons.account_tree_outlined)),
//                     Tab(icon: Icon(Icons.nightlife_outlined)),
//                     Tab(icon: Icon(Icons.people_outlined)),
//                     Tab(icon: Icon(Icons.note_outlined)),
//                   ]),
//               Text(
//                 presenter.model.character.name,
//                 style: const TextStyle(fontSize: 30),
//                 textAlign: TextAlign.left,
//                 selectionColor: Colors.white,
//               ),
//               //DropdownButton(items: numbers, onChanged: onChanged)
//               // DropdownButtonFormField(items: items, onChanged: onChanged)
//               Text(
//                   '${presenter.model.character.role[0]}: ${presenter.model.character.role[0].rank}',
//                   textAlign: TextAlign.left),
//               Text(
//                   'HP: ${presenter.model.character.stats.HP}/${presenter.model.character.stats.HP}',
//                   textAlign: TextAlign.left),

//               Row(children: const [
//                 Icon(Icons.lightbulb_outline),
//                 Text('INT', style: TextStyle(fontWeight: FontWeight.bold)),
//                 // SizedBox(width: 12),
//                 DropButtonINT(),
//                 //SizedBox(width: 12),
//                 Icon(Icons.sports_martial_arts),
//                 Text('REF', style: TextStyle(fontWeight: FontWeight.bold)),
//                 //SizedBox(width: 12),
//                 DropButtonREF(),
//                 //SizedBox(width: 12),
//                 Icon(Icons.lightbulb_outline),
//                 Text('DEX', style: TextStyle(fontWeight: FontWeight.bold)),
//                 //SizedBox(width: 12),
//                 DropButtonDEX(),
//                 //SizedBox(width: 12),
//                 Icon(Icons.construction),
//                 Text('TECH', style: TextStyle(fontWeight: FontWeight.bold)),
//                 // SizedBox(width: 12),
//                 DropButtonTECH(),
//                 //SizedBox(width: 12),
//                 Icon(Icons.snowing),
//                 Text('COOL', style: TextStyle(fontWeight: FontWeight.bold)),
//                 //SizedBox(width: 12),
//                 DropButtonCOOL(),
//                 // SizedBox(width: 12),
//                 Icon(Icons.lightbulb_outline),
//                 Text('WILL', style: TextStyle(fontWeight: FontWeight.bold)),
//                 // SizedBox(width: 12),
//                 DropButtonWILL(),
//                 //SizedBox(width: 12),
//                 Icon(Icons.lightbulb_circle),
//                 Text('LUCK', style: TextStyle(fontWeight: FontWeight.bold)),
//                 // SizedBox(width: 12),
//                 DropButtonLUCK(),
//                 //SizedBox(width: 12),
//                 Icon(Icons.lightbulb_outline),
//                 Text('DEX', style: TextStyle(fontWeight: FontWeight.bold)),
//                 SizedBox(width: 12),
//                 DropButtonMOVE(),
//                 //SizedBox(width: 12),
//                 Icon(Icons.lightbulb_outline),
//                 Text('BODY', style: TextStyle(fontWeight: FontWeight.bold)),
//                 //SizedBox(width: 12),
//                 // DropButtonBODY(),
//                 // //SizedBox(width: 12),
//                 // Icon(Icons.lightbulb_outline),
//                 // Text('EMP', style: TextStyle(fontWeight: FontWeight.bold)),
//                 // // SizedBox(width: 12),
//                 // DropButtonEMP(),
//                 // //SizedBox(width: 12),
//                 // Icon(Icons.lightbulb_outline),
//                 // Text('Humanity', style: TextStyle(fontWeight: FontWeight.bold)),
//                 // //SizedBox(width: 12),
//                 // DropButtonHumanity(),
//               ]),
//               Text('Initiative: +${presenter.model.character.stats.REF}',
//                   textAlign: TextAlign.left),
//               Column(
//                   children: presenter.model.character.skills
//                       .getMap()
//                       .entries
//                       .map((e) {
//                 num number = e.value;
//                 var w = Text('${e.key}: $number',
//                     style: const TextStyle(fontSize: 10),
//                     textAlign: TextAlign.left);
//                 return w;
//               }).toList()),
//               TextButton(
//                 style: TextButton.styleFrom(
//                   textStyle: const TextStyle(fontSize: 20),
//                 ),
//                 onPressed: () {
//                   Navigator.pushNamed(context, homeRoute,
//                       arguments: 'arguments/chose Templates');
//                 },
//                 child: const Text('Home'),
//               ),
//             ]))));
//   }
// }

// class DropButtonINT extends StatefulWidget {
//   const DropButtonINT({super.key});

//   @override
//   State<DropButtonINT> createState() => _DropButtonINTState();
// }

// class _DropButtonINTState extends State<DropButtonINT> {
//   int dropdownValue = presenter.model.character.stats.INT;

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<int>(
//       // text: "INT";
//       value: dropdownValue,
//       icon: const Icon(Icons.arrow_downward),
//       elevation: 16,
//       style: const TextStyle(color: Colors.yellow),
//       underline: Container(
//         height: 2,
//         color: Colors.yellowAccent,
//       ),
//       onChanged: (int? value) {
//         // This is called when the user selects an item.
//         setState(() {
//           dropdownValue = value!;
//         });
//       },
//       items: numbers.map<DropdownMenuItem<int>>((int value) {
//         return DropdownMenuItem<int>(
//           value: value,
//           child: Text("$value"),
//         );
//       }).toList(),
//       // text: "INT";
//       //child: [\Text("Int"),
//     );
//   }
// }

// class DropButtonREF extends StatefulWidget {
//   const DropButtonREF({super.key});

//   @override
//   State<DropButtonREF> createState() => _DropButtonREFState();
// }

// class _DropButtonREFState extends State<DropButtonREF> {
//   int dropdownValue = presenter.model.character.stats.REF;

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<int>(
//       // text: "INT";
//       value: dropdownValue,
//       icon: const Icon(Icons.arrow_downward),
//       elevation: 16,
//       style: const TextStyle(color: Colors.yellow),
//       underline: Container(
//         height: 2,
//         color: Colors.yellowAccent,
//       ),
//       onChanged: (int? value) {
//         // This is called when the user selects an item.
//         setState(() {
//           dropdownValue = value!;
//         });
//       },
//       items: numbers.map<DropdownMenuItem<int>>((int value) {
//         return DropdownMenuItem<int>(
//           value: value,
//           child: Text("$value"),
//         );
//       }).toList(),
//       // text: "INT";
//       //child: [\Text("Int"),
//     );
//   }
// }

// class DropButtonDEX extends StatefulWidget {
//   const DropButtonDEX({super.key});

//   @override
//   State<DropButtonDEX> createState() => _DropButtonDEXState();
// }

// class _DropButtonDEXState extends State<DropButtonDEX> {
//   int dropdownValue = presenter.model.character.stats.DEX;

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<int>(
//       // text: "INT";
//       value: dropdownValue,
//       icon: const Icon(Icons.arrow_downward),
//       elevation: 16,
//       style: const TextStyle(color: Colors.yellow),
//       underline: Container(
//         height: 2,
//         color: Colors.yellowAccent,
//       ),
//       onChanged: (int? value) {
//         // This is called when the user selects an item.
//         setState(() {
//           dropdownValue = value!;
//         });
//       },
//       items: numbers.map<DropdownMenuItem<int>>((int value) {
//         return DropdownMenuItem<int>(
//           value: value,
//           child: Text("$value"),
//         );
//       }).toList(),
//       // text: "INT";
//       //child: [\Text("Int"),
//     );
//   }
// }

// class DropButtonTECH extends StatefulWidget {
//   const DropButtonTECH({super.key});

//   @override
//   State<DropButtonTECH> createState() => _DropButtonTECHState();
// }

// class _DropButtonTECHState extends State<DropButtonTECH> {
//   int dropdownValue = presenter.model.character.stats.TECH;

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<int>(
//       // text: "INT";
//       value: dropdownValue,
//       icon: const Icon(Icons.arrow_downward),
//       elevation: 16,
//       style: const TextStyle(color: Colors.yellow),
//       underline: Container(
//         height: 2,
//         color: Colors.yellowAccent,
//       ),
//       onChanged: (int? value) {
//         // This is called when the user selects an item.
//         setState(() {
//           dropdownValue = value!;
//         });
//       },
//       items: numbers.map<DropdownMenuItem<int>>((int value) {
//         return DropdownMenuItem<int>(
//           value: value,
//           child: Text("$value"),
//         );
//       }).toList(),
//       // text: "INT";
//       //child: [\Text("Int"),
//     );
//   }
// }

// class DropButtonCOOL extends StatefulWidget {
//   const DropButtonCOOL({super.key});

//   @override
//   State<DropButtonCOOL> createState() => _DropButtonCOOLState();
// }

// class _DropButtonCOOLState extends State<DropButtonCOOL> {
//   int dropdownValue = presenter.model.character.stats.COOL;

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<int>(
//       // text: "INT";
//       value: dropdownValue,
//       icon: const Icon(Icons.arrow_downward),
//       elevation: 16,
//       style: const TextStyle(color: Colors.yellow),
//       underline: Container(
//         height: 2,
//         color: Colors.yellowAccent,
//       ),
//       onChanged: (int? value) {
//         // This is called when the user selects an item.
//         setState(() {
//           dropdownValue = value!;
//         });
//       },
//       items: numbers.map<DropdownMenuItem<int>>((int value) {
//         return DropdownMenuItem<int>(
//           value: value,
//           child: Text("$value"),
//         );
//       }).toList(),
//       // text: "INT";
//       //child: [\Text("Int"),
//     );
//   }
// }

// class DropButtonWILL extends StatefulWidget {
//   const DropButtonWILL({super.key});

//   @override
//   State<DropButtonWILL> createState() => _DropButtonWILLState();
// }

// class _DropButtonWILLState extends State<DropButtonWILL> {
//   int dropdownValue = presenter.model.character.stats.WILL;

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<int>(
//       // text: "INT";
//       value: dropdownValue,
//       icon: const Icon(Icons.arrow_downward),
//       elevation: 16,
//       style: const TextStyle(color: Colors.yellow),
//       underline: Container(
//         height: 2,
//         color: Colors.yellowAccent,
//       ),
//       onChanged: (int? value) {
//         // This is called when the user selects an item.
//         setState(() {
//           dropdownValue = value!;
//         });
//       },
//       items: numbers.map<DropdownMenuItem<int>>((int value) {
//         return DropdownMenuItem<int>(
//           value: value,
//           child: Text("$value"),
//         );
//       }).toList(),
//       // text: "INT";
//       //child: [\Text("Int"),
//     );
//   }
// }

// class DropButtonLUCK extends StatefulWidget {
//   const DropButtonLUCK({super.key});

//   @override
//   State<DropButtonLUCK> createState() => _DropButtonLUCKState();
// }

// class _DropButtonLUCKState extends State<DropButtonLUCK> {
//   int dropdownValue = presenter.model.character.stats.LUCK;

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<int>(
//       // text: "INT";
//       value: dropdownValue,
//       icon: const Icon(Icons.arrow_downward),
//       elevation: 16,
//       style: const TextStyle(color: Colors.yellow),
//       underline: Container(
//         height: 2,
//         color: Colors.yellowAccent,
//       ),
//       onChanged: (int? value) {
//         // This is called when the user selects an item.
//         setState(() {
//           dropdownValue = value!;
//         });
//       },
//       items: numbers.map<DropdownMenuItem<int>>((int value) {
//         return DropdownMenuItem<int>(
//           value: value,
//           child: Text("$value"),
//         );
//       }).toList(),
//       // text: "INT";
//       //child: [\Text("Int"),
//     );
//   }
// }

// class DropButtonMOVE extends StatefulWidget {
//   const DropButtonMOVE({super.key});

//   @override
//   State<DropButtonMOVE> createState() => _DropButtonMOVEState();
// }

// class _DropButtonMOVEState extends State<DropButtonMOVE> {
//   int dropdownValue = presenter.model.character.stats.MOVE;

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<int>(
//       // text: "INT";
//       value: dropdownValue,
//       icon: const Icon(Icons.arrow_downward),
//       elevation: 16,
//       style: const TextStyle(color: Colors.yellow),
//       underline: Container(
//         height: 2,
//         color: Colors.yellowAccent,
//       ),
//       onChanged: (int? value) {
//         // This is called when the user selects an item.
//         setState(() {
//           dropdownValue = value!;
//         });
//       },
//       items: numbers.map<DropdownMenuItem<int>>((int value) {
//         return DropdownMenuItem<int>(
//           value: value,
//           child: Text("$value"),
//         );
//       }).toList(),
//       // text: "INT";
//       //child: [\Text("Int"),
//     );
//   }
// }

// class DropButtonBODY extends StatefulWidget {
//   const DropButtonBODY({super.key});

//   @override
//   State<DropButtonBODY> createState() => _DropButtonBODYState();
// }

// class _DropButtonBODYState extends State<DropButtonBODY> {
//   int dropdownValue = presenter.model.character.stats.BODY;

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<int>(
//       // text: "INT";
//       value: dropdownValue,
//       icon: const Icon(Icons.arrow_downward),
//       elevation: 16,
//       style: const TextStyle(color: Colors.yellow),
//       underline: Container(
//         height: 2,
//         color: Colors.yellowAccent,
//       ),
//       onChanged: (int? value) {
//         // This is called when the user selects an item.
//         setState(() {
//           dropdownValue = value!;
//         });
//       },
//       items: numbers.map<DropdownMenuItem<int>>((int value) {
//         return DropdownMenuItem<int>(
//           value: value,
//           child: Text("$value"),
//         );
//       }).toList(),
//       // text: "INT";
//       //child: [\Text("Int"),
//     );
//   }
// }

// class DropButtonEMP extends StatefulWidget {
//   const DropButtonEMP({super.key});

//   @override
//   State<DropButtonEMP> createState() => _DropButtonEMPState();
// }

// class _DropButtonEMPState extends State<DropButtonEMP> {
//   int dropdownValue = presenter.model.character.stats.REF;

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<int>(
//       // text: "INT";
//       value: dropdownValue,
//       icon: const Icon(Icons.arrow_downward),
//       elevation: 16,
//       style: const TextStyle(color: Colors.yellow),
//       underline: Container(
//         height: 2,
//         color: Colors.yellowAccent,
//       ),
//       onChanged: (int? value) {
//         // This is called when the user selects an item.
//         setState(() {
//           dropdownValue = value!;
//         });
//       },
//       items: numbers.map<DropdownMenuItem<int>>((int value) {
//         return DropdownMenuItem<int>(
//           value: value,
//           child: Text("$value"),
//         );
//       }).toList(),
//       // text: "INT";
//       //child: [\Text("Int"),
//     );
//   }
// }

// class DropButtonHumanity extends StatefulWidget {
//   const DropButtonHumanity({super.key});

//   @override
//   State<DropButtonHumanity> createState() => _DropButtonHumanityState();
// }

// class _DropButtonHumanityState extends State<DropButtonHumanity> {
//   int dropdownValue = presenter.model.character.stats.HUM;

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton<int>(
//       // text: "INT";
//       value: dropdownValue,
//       icon: const Icon(Icons.arrow_downward),
//       elevation: 16,
//       style: const TextStyle(color: Colors.yellow),
//       underline: Container(
//         height: 2,
//         color: Colors.yellowAccent,
//       ),
//       onChanged: (int? value) {
//         // This is called when the user selects an item.
//         setState(() {
//           dropdownValue = value!;
//         });
//       },
//       items: numbers.map<DropdownMenuItem<int>>((int value) {
//         return DropdownMenuItem<int>(
//           value: value,
//           child: Text("$value"),
//         );
//       }).toList(),
//       // text: "INT";
//       //child: [\Text("Int"),
//     );
//   }
// }
