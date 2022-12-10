import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import '../main.dart';
import '../constants.dart';

class Enemies extends StatefulWidget {
  const Enemies({super.key});

  @override
  State<StatefulWidget> createState() => _EnemiesState();
}

class _EnemiesState extends State<Enemies> {
  num numEnemies = 0;
  List<String> relationship = ['', '', ''];
  List<bool> enemies = [false, false, false];
  List<String> enemiesList = Enemy;
  List<String> cause = ['', '', ''];
  List<String> causeList = EnemyCause;
  List<String> resource = ['', '', ''];
  List<String> resourceList = EnemyResources;

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
                const Text('Enemies:',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  color: buttonRed,
                  constraints: const BoxConstraints(maxWidth: 200),
                  child: NumberInputWithIncrementDecrement(
                      controller: TextEditingController(),
                      decIconColor: Colors.white,
                      incIconColor: Colors.white,
                      incDecBgColor: Colors.white,
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                      min: 0,
                      max: 3,
                      onIncrement: (newValue) {
                        setState(() {
                          numEnemies = newValue;
                          if (newValue == 0) {
                            enemies = [false, false, false];
                          } else if (newValue == 1) {
                            enemies = [true, false, false];
                          } else if (newValue == 2) {
                            enemies = [true, true, false];
                          } else if (newValue == 3) {
                            enemies = [true, true, true];
                          }
                        });
                      },
                      onDecrement: (newValue) {
                        setState(() {
                          numEnemies = newValue;
                          if (newValue == 0) {
                            enemies = [false, false, false];
                          } else if (newValue == 1) {
                            enemies = [true, false, false];
                          } else if (newValue == 2) {
                            enemies = [true, true, false];
                          } else if (newValue == 3) {
                            enemies = [true, true, true];
                          }
                        });
                      }),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 15),
                    Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          color: buttonRed,
                        ),
                        child: DropdownButton<String>(
                          dropdownColor: buttonRed,
                          value: relationship[0],
                          items: enemiesList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                            );
                          }).toList(),
                          onChanged: enemies[0]
                              ? (String? newValue) {
                                  setState(() {
                                    relationship[0] = newValue!;
                                  });
                                }
                              : null,
                        )),
                    const SizedBox(height: 15),
                    Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          color: buttonRed,
                        ),
                        child: DropdownButton<String>(
                          dropdownColor: buttonRed,
                          value: cause[0],
                          items: causeList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                            );
                          }).toList(),
                          onChanged: enemies[0]
                              ? (String? newValue) {
                                  setState(() {
                                    cause[0] = newValue!;
                                  });
                                }
                              : null,
                        )),
                    const SizedBox(height: 15),
                    Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          color: buttonRed,
                        ),
                        child: DropdownButton<String>(
                          dropdownColor: buttonRed,
                          value: resource[0],
                          items: resourceList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                            );
                          }).toList(),
                          onChanged: enemies[0]
                              ? (String? newValue) {
                                  setState(() {
                                    resource[0] = newValue!;
                                  });
                                }
                              : null,
                        )),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 15),
                    Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          color: buttonRed,
                        ),
                        child: DropdownButton<String>(
                          dropdownColor: buttonRed,
                          value: relationship[1],
                          items: enemiesList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                            );
                          }).toList(),
                          onChanged: enemies[1]
                              ? (String? newValue) {
                                  setState(() {
                                    relationship[1] = newValue!;
                                  });
                                }
                              : null,
                        )),
                    const SizedBox(height: 15),
                    Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          color: buttonRed,
                        ),
                        child: DropdownButton<String>(
                          dropdownColor: buttonRed,
                          value: cause[1],
                          items: causeList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                            );
                          }).toList(),
                          onChanged: enemies[1]
                              ? (String? newValue) {
                                  setState(() {
                                    cause[1] = newValue!;
                                  });
                                }
                              : null,
                        )),
                    const SizedBox(height: 15),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        color: buttonRed,
                      ),
                      child: DropdownButton<String>(
                        dropdownColor: buttonRed,
                        value: resource[1],
                        items: resourceList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.white),
                            ),
                          );
                        }).toList(),
                        onChanged: enemies[1]
                            ? (String? newValue) {
                                setState(() {
                                  resource[1] = newValue!;
                                });
                              }
                            : null,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 15),
                    Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          color: buttonRed,
                        ),
                        child: DropdownButton<String>(
                          dropdownColor: buttonRed,
                          value: relationship[2],
                          items: enemiesList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                            );
                          }).toList(),
                          onChanged: enemies[2]
                              ? (String? newValue) {
                                  setState(() {
                                    relationship[2] = newValue!;
                                  });
                                }
                              : null,
                        )),
                    const SizedBox(height: 15),
                    Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          color: buttonRed,
                        ),
                        child: DropdownButton<String>(
                          dropdownColor: buttonRed,
                          value: cause[2],
                          items: causeList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                            );
                          }).toList(),
                          onChanged: enemies[2]
                              ? (String? newValue) {
                                  setState(() {
                                    cause[2] = newValue!;
                                  });
                                }
                              : null,
                        )),
                    const SizedBox(height: 15),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        color: buttonRed,
                      ),
                      child: DropdownButton<String>(
                        dropdownColor: buttonRed,
                        value: resource[2],
                        items: resourceList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.white),
                            ),
                          );
                        }).toList(),
                        onChanged: enemies[2]
                            ? (String? newValue) {
                                setState(() {
                                  resource[2] = newValue!;
                                });
                              }
                            : null,
                      ),
                    )
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
                      presenter.model.character.lifepath.enemies =
                          numEnemies.toInt();
                      presenter.model.character.lifepath.enemy_desc =
                          relationship;
                      presenter.model.character.lifepath.enemy_cause = cause;
                      presenter.model.character.lifepath.enemy_resource =
                          resource;
                    });
                    Navigator.pushNamed(context, lifeGoalsRoute,
                        arguments: 'arguments/chose Templates');
                  },
                  child: const Text('Next'),
                ),
                const SizedBox(height: 10),
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
