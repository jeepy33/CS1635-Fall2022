import 'package:flutter/material.dart';
import '../main.dart';
import '../constants.dart';

class MotivationsPage extends StatefulWidget {
  const MotivationsPage({super.key});

  @override
  State<StatefulWidget> createState() => _MotivationsState();
}

class _MotivationsState extends State<MotivationsPage> {
  List<String> whatValueList = WhatValue;
  String whatValue = WhatValue[0];

  List<String> mostPeopleList = MostPeople;
  String mostPeople = MostPeople[0];

  List<String> whoValueList = WhoValue;
  String whoValue = WhoValue[0];

  List<String> valuedPossessionList = ValuedPossession;
  String possession = ValuedPossession[0];

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
                const Text('What Do You Value Most?: ',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                const SizedBox(height: 15),
                Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: buttonRed,
                    ),
                    child: DropdownButton<String>(
                      dropdownColor: buttonRed,
                      value: whatValue,
                      items: whatValueList
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
                      onChanged: (String? newValue) {
                        setState(() {
                          whatValue = newValue!;
                        });
                      },
                    )),
                const SizedBox(
                  height: 15,
                ),
                const Text('How Do You Feel About Most People?: ',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                const SizedBox(height: 15),
                Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: buttonRed,
                    ),
                    child: DropdownButton<String>(
                      dropdownColor: buttonRed,
                      value: mostPeople,
                      items: mostPeopleList
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
                      onChanged: (String? newValue) {
                        setState(() {
                          mostPeople = newValue!;
                        });
                      },
                    )),
                const SizedBox(
                  height: 15,
                ),
                const Text('Most Valued Person in Your Life?: ',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                const SizedBox(height: 15),
                Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: buttonRed,
                    ),
                    child: DropdownButton<String>(
                      dropdownColor: buttonRed,
                      value: whoValue,
                      items: whoValueList
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
                      onChanged: (String? newValue) {
                        setState(() {
                          whoValue = newValue!;
                        });
                      },
                    )),
                const SizedBox(
                  height: 15,
                ),
                const Text('Most Valued Possession You Own?:',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                const SizedBox(height: 15),
                Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: buttonRed,
                    ),
                    child: DropdownButton<String>(
                      dropdownColor: buttonRed,
                      value: possession,
                      items: valuedPossessionList
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
                      onChanged: (String? newValue) {
                        setState(() {
                          possession = newValue!;
                        });
                      },
                    )),
                const SizedBox(
                  height: 15,
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
                      if (whatValue.isEmpty) {
                        whatValue =
                            whatValueList[presenter.rand.nextInt(10) + 1];
                      }

                      if (mostPeople.isEmpty) {
                        mostPeople =
                            mostPeopleList[presenter.rand.nextInt(10) + 1];
                      }

                      if (whoValue.isEmpty) {
                        whoValue = whoValueList[presenter.rand.nextInt(10) + 1];
                      }

                      if (possession.isEmpty) {
                        possession = valuedPossessionList[
                            presenter.rand.nextInt(10) + 1];
                      }

                      presenter.model.character.lifepath
                          .what_do_you_value_most = whatValue;
                      presenter.model.character.lifepath
                          .how_do_you_feel_about_most_people = mostPeople;
                      presenter.model.character.lifepath.most_valued_person =
                          whoValue;
                      presenter.model.character.lifepath
                          .most_valued_possession = possession;
                    });
                    Navigator.pushNamed(context, familyRoute,
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
