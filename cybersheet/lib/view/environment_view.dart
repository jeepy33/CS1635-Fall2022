import 'package:flutter/material.dart';
import '../main.dart';
import '../constants.dart';

class EnvironmentPage extends StatefulWidget {
  const EnvironmentPage();

  @override
  State<StatefulWidget> createState() => _EnvironmentPageState();
}

class _EnvironmentPageState extends State<EnvironmentPage> {
  List<String> environmentList = ChildhoodEnvironment;
  String environment = ChildhoodEnvironment[0];

  List<String> crisisList = FamilyCrisis;
  String crisis = FamilyCrisis[0];

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
                const Text('Childhood Environment:',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                const SizedBox(
                  height: 15,
                ),
                Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: buttonRed,
                    ),
                    child: DropdownButton<String>(
                      dropdownColor: buttonRed,
                      value: environment,
                      items: environmentList
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
                          environment = newValue!;
                        });
                      },
                    )),
                const SizedBox(
                  height: 15,
                ),
                const Text('Family Crisis:',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                const SizedBox(
                  height: 15,
                ),
                Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: buttonRed,
                    ),
                    child: DropdownButton<String>(
                      dropdownColor: buttonRed,
                      value: crisis,
                      items: crisisList
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
                          crisis = newValue!;
                        });
                      },
                    )),
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
                      if (environment.isEmpty) {
                        environment =
                            environmentList[presenter.rand.nextInt(10) + 1];
                      }

                      if (crisis.isEmpty) {
                        crisis = crisisList[presenter.rand.nextInt(10) + 1];
                      }

                      presenter.model.character.lifepath.childhood_environment =
                          environment;
                      presenter.model.character.lifepath.family_crisis = crisis;
                    });
                    Navigator.pushNamed(context, friendsRoute,
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
