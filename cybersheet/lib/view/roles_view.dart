import 'package:flutter/material.dart';
import '../main.dart';
import '../constants.dart';

class RolesPage extends StatefulWidget {
  const RolesPage({super.key});

  @override
  State<StatefulWidget> createState() => _RoleState();
}

class _RoleState extends State<RolesPage> {
  String template = '';
  final List<bool> _selections = List<bool>.filled(10, false);
  RoleType roleToAdd = RoleType.NONE;

  @override
  Widget build(BuildContext context) {
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
                const Text('Role Selection:',
                    style: TextStyle(fontSize: 30, color: Colors.white)),
                const SizedBox(height: 30),
                ToggleButtons(
                  renderBorder: false,
                  isSelected: _selections,
                  onPressed: (int index) {
                    setState(() {
                      _selections[index] = !_selections[index];
                    });
                  },
                  children: <Widget>[
                    TextButton(
                        style: TextButton.styleFrom(
                            textStyle: const TextStyle(
                                fontSize: 20, fontFamily: 'Kontakt'),
                            padding: const EdgeInsets.all(25.0),
                            foregroundColor:
                                _selections[0] ? buttonRed : Colors.white,
                            backgroundColor:
                                _selections[0] ? Colors.white : buttonRed),
                        onPressed: () {
                          setState(() {
                            roleToAdd = RoleType.ROCKERBOY;
                            template = RoleType.ROCKERBOY.toString();
                            _selections.fillRange(0, _selections.length, false);
                            _selections[0] = true;
                          });
                        },
                        child: const Text('Rockerboy')),
                    TextButton(
                        style: TextButton.styleFrom(
                            textStyle: const TextStyle(
                                fontSize: 20, fontFamily: 'Kontakt'),
                            padding: const EdgeInsets.all(25.0),
                            foregroundColor:
                                _selections[1] ? buttonRed : Colors.white,
                            backgroundColor:
                                _selections[1] ? Colors.white : buttonRed),
                        onPressed: () {
                          setState(() {
                            roleToAdd = RoleType.SOLO;
                            template = RoleType.SOLO.toString();
                            _selections.fillRange(0, _selections.length, false);
                            _selections[1] = true;
                          });
                        },
                        child: const Text('Solo')),
                    TextButton(
                        style: TextButton.styleFrom(
                            textStyle: const TextStyle(
                                fontSize: 20, fontFamily: 'Kontakt'),
                            padding: const EdgeInsets.all(25.0),
                            foregroundColor:
                                _selections[2] ? buttonRed : Colors.white,
                            backgroundColor:
                                _selections[2] ? Colors.white : buttonRed),
                        onPressed: () {
                          setState(() {
                            roleToAdd = RoleType.NETRUNNER;
                            template = RoleType.NETRUNNER.toString();
                            _selections.fillRange(0, _selections.length, false);
                            _selections[2] = true;
                          });
                        },
                        child: const Text('Netrunner')),
                    TextButton(
                        style: TextButton.styleFrom(
                            textStyle: const TextStyle(
                                fontSize: 20, fontFamily: 'Kontakt'),
                            padding: const EdgeInsets.all(25.0),
                            foregroundColor:
                                _selections[3] ? buttonRed : Colors.white,
                            backgroundColor:
                                _selections[3] ? Colors.white : buttonRed),
                        onPressed: () {
                          setState(() {
                            roleToAdd = RoleType.TECH;
                            template = RoleType.TECH.toString();
                            _selections.fillRange(0, _selections.length, false);
                            _selections[3] = true;
                          });
                        },
                        child: const Text('Tech')),
                    TextButton(
                        style: TextButton.styleFrom(
                            textStyle: const TextStyle(
                                fontSize: 20, fontFamily: 'Kontakt'),
                            padding: const EdgeInsets.all(25.0),
                            foregroundColor:
                                _selections[4] ? buttonRed : Colors.white,
                            backgroundColor:
                                _selections[4] ? Colors.white : buttonRed),
                        onPressed: () {
                          setState(() {
                            roleToAdd = RoleType.MEDTECH;
                            template = RoleType.MEDTECH.toString();
                            _selections.fillRange(0, _selections.length, false);
                            _selections[4] = true;
                          });
                        },
                        child: const Text('Medtech')),
                    //wrap here

                    TextButton(
                        style: TextButton.styleFrom(
                            textStyle: const TextStyle(
                                fontSize: 20, fontFamily: 'Kontakt'),
                            padding: const EdgeInsets.all(25.0),
                            foregroundColor:
                                _selections[5] ? buttonRed : Colors.white,
                            backgroundColor:
                                _selections[5] ? Colors.white : buttonRed),
                        onPressed: () {
                          setState(() {
                            roleToAdd = RoleType.MEDIA;
                            template = RoleType.MEDIA.toString();
                            _selections.fillRange(0, _selections.length, false);
                            _selections[5] = true;
                          });
                        },
                        child: const Text('Media')),
                    TextButton(
                        style: TextButton.styleFrom(
                            textStyle: const TextStyle(
                                fontSize: 20, fontFamily: 'Kontakt'),
                            padding: const EdgeInsets.all(25.0),
                            foregroundColor:
                                _selections[6] ? buttonRed : Colors.white,
                            backgroundColor:
                                _selections[6] ? Colors.white : buttonRed),
                        onPressed: () {
                          setState(() {
                            roleToAdd = RoleType.EXEC;
                            template = RoleType.EXEC.toString();
                            _selections.fillRange(0, _selections.length, false);
                            _selections[6] = true;
                          });
                        },
                        child: const Text('Exec')),
                    TextButton(
                        style: TextButton.styleFrom(
                            textStyle: const TextStyle(
                                fontSize: 20, fontFamily: 'Kontakt'),
                            padding: const EdgeInsets.all(25.0),
                            foregroundColor:
                                _selections[7] ? buttonRed : Colors.white,
                            backgroundColor:
                                _selections[7] ? Colors.white : buttonRed),
                        onPressed: () {
                          setState(() {
                            roleToAdd = RoleType.LAWMAN;
                            template = RoleType.LAWMAN.toString();
                            _selections.fillRange(0, _selections.length, false);
                            _selections[7] = true;
                          });
                        },
                        child: const Text('Lawman')),
                    TextButton(
                        style: TextButton.styleFrom(
                            textStyle: const TextStyle(
                                fontSize: 20, fontFamily: 'Kontakt'),
                            padding: const EdgeInsets.all(25.0),
                            foregroundColor:
                                _selections[8] ? buttonRed : Colors.white,
                            backgroundColor:
                                _selections[8] ? Colors.white : buttonRed),
                        onPressed: () {
                          setState(() {
                            roleToAdd = RoleType.FIXER;
                            template = RoleType.FIXER.toString();
                            _selections.fillRange(0, _selections.length, false);
                            _selections[8] = true;
                          });
                        },
                        child: const Text('Fixer')),
                    TextButton(
                        style: TextButton.styleFrom(
                            textStyle: const TextStyle(
                                fontSize: 20, fontFamily: 'Kontakt'),
                            padding: const EdgeInsets.all(25.0),
                            foregroundColor:
                                _selections[9] ? buttonRed : Colors.white,
                            backgroundColor:
                                _selections[9] ? Colors.white : buttonRed),
                        onPressed: () {
                          setState(() {
                            roleToAdd = RoleType.NOMAD;
                            template = RoleType.NOMAD.toString();
                            _selections.fillRange(0, _selections.length, false);
                            _selections[9] = true;
                          });
                        },
                        child: const Text('Nomad')),
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
                    if (template.isEmpty) {
                      setState(() {
                        int r = presenter.rand.nextInt(10);
                        roleToAdd = RoleType.values[r];
                        _selections.fillRange(0, _selections.length, false);
                        _selections[r] = true;
                      });
                    }
                    presenter.addRole(roleToAdd, 4);
                    template = roleToAdd.toString();

                    Navigator.pushNamed(context, templateLifePath,
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
