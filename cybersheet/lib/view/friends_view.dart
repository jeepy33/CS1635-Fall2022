import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import '../main.dart';
import '../constants.dart';

class Friends extends StatefulWidget {
  const Friends({super.key});

  @override
  State<StatefulWidget> createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  num numFriends = 0;
  List<String> relationshipList = FriendRelationship;
  List<String> relationship = ['', '', ''];
  List<bool> friends = [false, false, false];

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
                const Text('Friends:',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                const SizedBox(height: 15),
                Container(
                  color: buttonRed,
                  constraints: const BoxConstraints(maxWidth: 200),
                  child: NumberInputWithIncrementDecrement(
                      decIconColor: Colors.white,
                      incIconColor: Colors.white,
                      incDecBgColor: Colors.white,
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                      controller: TextEditingController(),
                      min: 0,
                      max: 3,
                      onIncrement: (newValue) {
                        setState(() {
                          numFriends = newValue;
                          if (newValue == 0) {
                            friends = [false, false, false];
                          } else if (newValue == 1) {
                            friends = [true, false, false];
                          } else if (newValue == 2) {
                            friends = [true, true, false];
                          } else if (newValue == 3) {
                            friends = [true, true, true];
                          }
                        });
                      },
                      onDecrement: (newValue) {
                        setState(() {
                          numFriends = newValue;
                          if (newValue == 0) {
                            friends = [false, false, false];
                          } else if (newValue == 1) {
                            friends = [true, false, false];
                          } else if (newValue == 2) {
                            friends = [true, true, false];
                          } else if (newValue == 3) {
                            friends = [true, true, true];
                          }
                        });
                      }),
                ),
                const SizedBox(height: 15),
                Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: buttonRed,
                    ),
                    child: DropdownButton<String>(
                      dropdownColor: buttonRed,
                      value: relationship[0],
                      items: relationshipList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white),
                          ),
                        );
                      }).toList(),
                      onChanged: friends[0]
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
                      value: relationship[1],
                      items: relationshipList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white),
                          ),
                        );
                      }).toList(),
                      onChanged: friends[1]
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
                      value: relationship[2],
                      items: relationshipList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white),
                          ),
                        );
                      }).toList(),
                      onChanged: friends[2]
                          ? (String? newValue) {
                              setState(() {
                                relationship[2] = newValue!;
                              });
                            }
                          : null,
                    )),
                const SizedBox(height: 60),
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
                      presenter.model.character.lifepath.friends =
                          numFriends.toInt();
                      presenter.model.character.lifepath.friend_desc =
                          relationship;
                    });
                    Navigator.pushNamed(context, enemiesRoute,
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
