import 'package:flutter/material.dart';
import '../main.dart';
import '../constants.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({super.key});

  @override
  State<StatefulWidget> createState() => _StatsState();
}

class _StatsState extends State<StatsPage> {
  String role = presenter.model.character.role.toString();
  final List<bool> _selections = List<bool>.filled(10, false);
  List<List<int>> matrix = [[]];
  List<int> stats = [];

  @override
  Widget build(BuildContext context) {
    switch (presenter.model.character.role[0].type) {
      case RoleType.ROCKERBOY:
        matrix = rockerboyM;
        break;
      case RoleType.EXEC:
        matrix = execM;
        break;
      case RoleType.FIXER:
        matrix = fixerM;
        break;
      case RoleType.LAWMAN:
        matrix = lawmanM;
        break;
      case RoleType.MEDIA:
        matrix = mediaM;
        break;
      case RoleType.MEDTECH:
        matrix = medtechM;
        break;
      case RoleType.NETRUNNER:
        matrix = netrunnerM;
        break;
      case RoleType.NOMAD:
        matrix = nomadM;
        break;
      case RoleType.SOLO:
        matrix = soloM;
        break;
      case RoleType.TECH:
        matrix = techM;
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
                const Text('Stats: ',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                const SizedBox(
                  height: 15,
                ),
                Column(
                  children: [
                    const Text(
                        'INT    REF    DEX    TECH   COOL   WILL   LUCK   MOVE   BODY    EMP',
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    const SizedBox(
                      height: 15,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor:
                              _selections[0] ? buttonRed : Colors.white,
                          backgroundColor:
                              _selections[0] ? Colors.white : buttonRed),
                      onPressed: () {
                        setState(() {
                          _selections.fillRange(0, _selections.length, false);
                          _selections[0] = true;
                          stats = matrix[0];
                        });
                      },
                      child: Text(matrix[0]
                          .toString()
                          .replaceAll(',', '          ')
                          .replaceAll('[', '')
                          .replaceAll(']', '')),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor:
                              _selections[1] ? buttonRed : Colors.white,
                          backgroundColor:
                              _selections[1] ? Colors.white : buttonRed),
                      onPressed: () {
                        setState(() {
                          _selections.fillRange(0, _selections.length, false);
                          _selections[1] = true;
                          stats = matrix[1];
                        });
                      },
                      child: Text(matrix[1]
                          .toString()
                          .replaceAll(',', '          ')
                          .replaceAll('[', '')
                          .replaceAll(']', '')),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor:
                              _selections[2] ? buttonRed : Colors.white,
                          backgroundColor:
                              _selections[2] ? Colors.white : buttonRed),
                      onPressed: () {
                        setState(() {
                          _selections.fillRange(0, _selections.length, false);
                          _selections[2] = true;
                          stats = matrix[2];
                        });
                      },
                      child: Text(matrix[2]
                          .toString()
                          .replaceAll(',', '          ')
                          .replaceAll('[', '')
                          .replaceAll(']', '')),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor:
                              _selections[3] ? buttonRed : Colors.white,
                          backgroundColor:
                              _selections[3] ? Colors.white : buttonRed),
                      onPressed: () {
                        setState(() {
                          _selections.fillRange(0, _selections.length, false);
                          _selections[3] = true;
                          stats = matrix[3];
                        });
                      },
                      child: Text(matrix[3]
                          .toString()
                          .replaceAll(',', '          ')
                          .replaceAll('[', '')
                          .replaceAll(']', '')),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor:
                              _selections[4] ? buttonRed : Colors.white,
                          backgroundColor:
                              _selections[4] ? Colors.white : buttonRed),
                      onPressed: () {
                        setState(() {
                          _selections.fillRange(0, _selections.length, false);
                          _selections[4] = true;
                          stats = matrix[4];
                        });
                      },
                      child: Text(matrix[4]
                          .toString()
                          .replaceAll(',', '          ')
                          .replaceAll('[', '')
                          .replaceAll(']', '')),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor:
                              _selections[5] ? buttonRed : Colors.white,
                          backgroundColor:
                              _selections[5] ? Colors.white : buttonRed),
                      onPressed: () {
                        setState(() {
                          _selections.fillRange(0, _selections.length, false);
                          _selections[5] = true;
                          stats = matrix[5];
                        });
                      },
                      child: Text(matrix[5]
                          .toString()
                          .replaceAll(',', '          ')
                          .replaceAll('[', '')
                          .replaceAll(']', '')),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor:
                              _selections[6] ? buttonRed : Colors.white,
                          backgroundColor:
                              _selections[6] ? Colors.white : buttonRed),
                      onPressed: () {
                        setState(() {
                          _selections.fillRange(0, _selections.length, false);
                          _selections[6] = true;
                          stats = matrix[6];
                        });
                      },
                      child: Text(matrix[6]
                          .toString()
                          .replaceAll(',', '          ')
                          .replaceAll('[', '')
                          .replaceAll(']', '')),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor:
                              _selections[7] ? buttonRed : Colors.white,
                          backgroundColor:
                              _selections[7] ? Colors.white : buttonRed),
                      onPressed: () {
                        setState(() {
                          _selections.fillRange(0, _selections.length, false);
                          _selections[7] = true;
                          stats = matrix[7];
                        });
                      },
                      child: Text(matrix[7]
                          .toString()
                          .replaceAll(',', '          ')
                          .replaceAll('[', '')
                          .replaceAll(']', '')),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor:
                              _selections[8] ? buttonRed : Colors.white,
                          backgroundColor:
                              _selections[8] ? Colors.white : buttonRed),
                      onPressed: () {
                        setState(() {
                          _selections.fillRange(0, _selections.length, false);
                          _selections[8] = true;
                          stats = matrix[8];
                        });
                      },
                      child: Text(matrix[8]
                          .toString()
                          .replaceAll(',', '          ')
                          .replaceAll('[', '')
                          .replaceAll(']', '')),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor:
                              _selections[9] ? buttonRed : Colors.white,
                          backgroundColor:
                              _selections[9] ? Colors.white : buttonRed),
                      onPressed: () {
                        setState(() {
                          _selections.fillRange(0, _selections.length, false);
                          _selections[9] = true;
                          stats = matrix[9];
                        });
                      },
                      child: Text(matrix[9]
                          .toString()
                          .replaceAll(',', '          ')
                          .replaceAll('[', '')
                          .replaceAll(']', '')),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 60,
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
                      if (stats.isEmpty) {
                        stats = matrix[presenter.rand.nextInt(10)];
                      }
                      presenter.model.character.stats.initialize(stats);
                    });
                    Navigator.pushNamed(context, skillsRoute,
                        arguments: 'arguments/chose Templates');
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
