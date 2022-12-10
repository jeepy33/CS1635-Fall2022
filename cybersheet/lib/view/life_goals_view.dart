import 'package:flutter/material.dart';
import '../main.dart';
import '../constants.dart';

class LifeGoalsPage extends StatefulWidget {
  const LifeGoalsPage({super.key});

  @override
  State<StatefulWidget> createState() => _LifeGoalsState();
}

class _LifeGoalsState extends State<LifeGoalsPage> {
  List<String> lifeGoalsList = LifeGoals;
  String lifeGoal = LifeGoals[0];

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
                const Text('Life Goals:',
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
                      value: lifeGoal,
                      items: lifeGoalsList
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
                          lifeGoal = newValue!;
                        });
                      },
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
                      if (lifeGoal.isEmpty) {
                        lifeGoal =
                            lifeGoalsList[presenter.rand.nextInt(10) + 1];
                      }
                      presenter.model.character.lifepath.life_goals = lifeGoal;
                    });
                    Navigator.pushNamed(context, statsRoute,
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
