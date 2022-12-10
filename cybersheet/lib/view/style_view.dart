import 'package:flutter/material.dart';
import '../main.dart';
import '../constants.dart';

class StylePage extends StatefulWidget {
  const StylePage({super.key});

  @override
  State<StatefulWidget> createState() => _StylePageState();
}

class _StylePageState extends State<StylePage> {
  List<String> clothingStyle = ClothingStyle;
  String style = ClothingStyle[0];

  List<String> hairstyle = Hairstyle;
  String hair = Hairstyle[0];

  List<String> affecation = Affectation;
  String item = Affectation[0];

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
                const Text('Clothing Style:',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                const SizedBox(height: 15),
                Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: buttonRed,
                    ),
                    child: DropdownButton<String>(
                      dropdownColor: buttonRed,
                      value: style,
                      items: clothingStyle
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
                          style = newValue!;
                        });
                      },
                    )),
                const SizedBox(height: 15),
                const Text('Hairstyle:',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                const SizedBox(height: 15),
                Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: buttonRed,
                    ),
                    child: DropdownButton<String>(
                      dropdownColor: buttonRed,
                      value: hair,
                      items: hairstyle
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
                          hair = newValue!;
                        });
                      },
                    )),
                const SizedBox(height: 15),
                const Text('Affecation You Are Never Without:',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                const SizedBox(height: 15),
                Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: buttonRed,
                    ),
                    child: DropdownButton<String>(
                      dropdownColor: buttonRed,
                      value: item,
                      items: affecation
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
                          item = newValue!;
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
                      if (style.isEmpty) {
                        style = clothingStyle[presenter.rand.nextInt(10) + 1];
                      }

                      if (hair.isEmpty) {
                        hair = hairstyle[presenter.rand.nextInt(10) + 1];
                      }

                      if (item.isEmpty) {
                        item = affecation[presenter.rand.nextInt(10) + 1];
                      }

                      presenter.model.character.lifepath.clothing_style = style;
                      presenter.model.character.lifepath.hairstyle = hair;
                      presenter.model.character.lifepath
                          .affectation_you_are_never_without = item;
                    });
                    Navigator.pushNamed(context, motivationsRoute,
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
