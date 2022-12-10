import 'package:flutter/material.dart';
import '../main.dart';
import '../constants.dart';
import '../model/model.dart';

class SkillsPage extends StatefulWidget {
  const SkillsPage({super.key});

  @override
  State<StatefulWidget> createState() => _SkillsState();
}

class _SkillsState extends State<SkillsPage> {
  String role = presenter.model.character.role.toString();
  Map matrix = rockerboySB;

  @override
  Widget build(BuildContext context) {
    switch (presenter.model.character.role[0].type) {
      case RoleType.ROCKERBOY:
        matrix = rockerboySB;
        break;
      case RoleType.EXEC:
        matrix = execSB;
        break;
      case RoleType.FIXER:
        matrix = fixerSB;
        break;
      case RoleType.LAWMAN:
        matrix = lawmanSB;
        break;
      case RoleType.MEDIA:
        matrix = mediaSB;
        break;
      case RoleType.MEDTECH:
        matrix = medtechSB;
        break;
      case RoleType.NETRUNNER:
        matrix = netrunnerSB;
        break;
      case RoleType.NOMAD:
        matrix = nomadSB;
        break;
      case RoleType.SOLO:
        matrix = soloSB;
        break;
      case RoleType.TECH:
        matrix = techSB;
        break;
      default:
    }
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 120,
          backgroundColor: cyberRed,
          automaticallyImplyLeading: false,
          title: const Image(
            image: AssetImage("Cybersheet_Logo.png"),
            width: 400,
            color: Colors.white,
          ),
        ),
        backgroundColor: cyberRed,
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("Cyberwire.png"),
            fit: BoxFit.cover,
          )),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                //thing
                Text('Skills: $role',
                    style: const TextStyle(fontSize: 20, color: Colors.white)),
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: buttonRed,
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: matrix.entries.map((e) {
                        num number = e.value;
                        var w = Text(e.key + ': $number' + '\n',
                            style: const TextStyle(
                                fontSize: 15, color: Colors.white));
                        return w;
                      }).toList()),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonRed,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    textStyle:
                        const TextStyle(fontSize: 20, fontFamily: 'Kontakt'),
                  ),
                  onPressed: () {
                    setState(() {
                      matrix.forEach((key, value) {
                        presenter.model.character.skills
                            .addSkill(Skill(key, value));
                      });
                    });
                    Navigator.pushNamed(context, inventoryRoute,
                        arguments: 'arguments/chose Templates'); //changing
                  },
                  child: const Text('Next'),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonRed,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    textStyle:
                        const TextStyle(fontSize: 20, fontFamily: 'Kontakt'),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Back'),
                )
              ],
            ),
          ),
        ));
  }
}
