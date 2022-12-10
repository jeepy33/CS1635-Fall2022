import 'package:flutter/material.dart';
import '../main.dart';
import '../constants.dart';

class FamilyPage extends StatefulWidget {
  const FamilyPage();

  @override
  State<StatefulWidget> createState() => _FamilyState();
}

class _FamilyState extends State<FamilyPage> {
  List<String> backgroundList = FamilyBackground.keys.toList().cast<String>();
  String background = FamilyBackground.keys.toList()[0];

  String backgroundDesc = FamilyBackground[FamilyBackground.keys.toList()[0]];

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
                const Text('Family Background:',
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
                      value: background,
                      items: backgroundList
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
                          background = newValue!;
                          backgroundDesc = FamilyBackground[background];
                        });
                      },
                    )),
                const SizedBox(height: 30),
                Text(
                  backgroundDesc,
                  style: const TextStyle(fontSize: 15, color: Colors.white),
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
                      if (background.isEmpty) {
                        background =
                            backgroundList[presenter.rand.nextInt(10) + 1];
                        backgroundDesc = FamilyBackground[background];
                      }

                      presenter.model.character.lifepath.background =
                          background;
                      presenter.model.character.lifepath.background_desc =
                          backgroundDesc;
                    });
                    Navigator.pushNamed(context, environmentRoute,
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
