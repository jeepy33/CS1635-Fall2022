import 'package:flutter/material.dart';
import '../constants.dart';
import '../main.dart';

class OriginPage extends StatefulWidget {
  const OriginPage({super.key});

  @override
  State<StatefulWidget> createState() => _OriginPageState();
}

class _OriginPageState extends State<OriginPage> {
  List<String> originList = CulturalRegion.keys.toList().cast<String>();
  String origin = CulturalRegion.keys.toList()[0];

  List<String> languages =
      CulturalRegion[CulturalRegion.keys.toList()[0]].split(',');
  String language =
      CulturalRegion[CulturalRegion.keys.toList()[0]].split(',')[0];

  String personality = Personality[0];
  List<String> personalityList = Personality;

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
                const Text('Cultural Origins:',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                const SizedBox(height: 15),
                Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: buttonRed,
                    ),
                    child: DropdownButton<String>(
                      dropdownColor: buttonRed,
                      value: origin,
                      items: originList
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
                          origin = newValue!;
                          languages = CulturalRegion[origin].split(',');
                          language = languages[0];
                        });
                      },
                    )),
                const SizedBox(height: 15),
                const Text('Language:',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                const SizedBox(height: 15),
                Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: buttonRed, //<-- SEE HERE
                    ),
                    child: DropdownButton<String>(
                      dropdownColor: buttonRed,
                      value: language,
                      items: languages
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
                          language = newValue!;
                        });
                      },
                    )),
                const SizedBox(height: 15),
                const Text('What Are You Like?:',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                const SizedBox(height: 15),
                Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: buttonRed, //<-- SEE HERE
                    ),
                    child: DropdownButton<String>(
                      dropdownColor: buttonRed,
                      value: personality,
                      items: personalityList
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
                          personality = newValue!;
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
                      if (origin.isEmpty) {
                        origin = originList[presenter.rand.nextInt(10) + 1];
                        languages = CulturalRegion[origin].split(',');
                        language = languages[0];
                      }

                      if (personality.isEmpty) {
                        personality =
                            Personality[presenter.rand.nextInt(10) + 1];
                      }

                      presenter.model.character.lifepath.region = origin;
                      if (!presenter.model.character.lifepath.languages
                          .contains(language)) {
                        presenter.model.character.lifepath.languages
                            .add(language);
                      }
                      presenter.model.character.lifepath.what_are_you_like =
                          personality;
                    });
                    Navigator.pushNamed(context, styleRoute,
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
