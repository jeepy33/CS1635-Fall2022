import 'package:flutter/material.dart';
import '../constants.dart';

class CharacterCyberware extends StatefulWidget {
  const CharacterCyberware({super.key});

  @override
  State<StatefulWidget> createState() => _CharacterCyberwareState();
}

class _CharacterCyberwareState extends State<CharacterCyberware> {

  final List<TextEditingController> _controller = [
    TextEditingController(), // Fashionware
    TextEditingController(), // Neuralware
    TextEditingController(), // Cyberoptics
    TextEditingController(), // Cyberaudio
    TextEditingController(), // Internal Body Cyberware
    TextEditingController(), // External Body Cyberware
    TextEditingController(), // Cyberlimbs
    TextEditingController(), // Borgware
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage("Cyberwire.png"),
        fit: BoxFit.cover,
      )),
      child: Center(
          child: UnconstrainedBox(
              child: Container(
                  width: 700,
                  height: 800,
                  child: Stack(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 0,
                          right: 0,
                          top: 0,
                          bottom: 0,
                        ),
                        child: Image(
                          image: AssetImage("Body3.png"),
                          width: 700,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 0,
                          right: 0,
                          top: 0,
                          bottom: 0,
                        ),
                        child: Image(
                          image: AssetImage("BodyNoShade.png"),
                          width: 700,
                        ),
                      ),
                      // Fashionware
                      Padding(
                        padding: EdgeInsets.only(
                          left: 250,
                          top: 180,
                        ),
                        child: FloatingActionButton(
                          mini: true,
                          backgroundColor:
                              const Color.fromRGBO(255, 255, 255, 0),
                          foregroundColor: Colors.white,
                          onPressed: () {
                            promptDialog('Fashionware', 0, context);
                          },
                          child: const Icon(Icons.add_circle_outline_rounded),
                        ),
                      ),
                      // Neuralware
                      Padding(
                        padding: EdgeInsets.only(
                          left: 327,
                          top: 70,
                        ),
                        child: FloatingActionButton(
                          mini: true,
                          backgroundColor:
                              const Color.fromRGBO(255, 255, 255, 0),
                          foregroundColor: Colors.white,
                          onPressed: () {
                            promptDialog('Neuralware', 1, context);
                          },
                          child: const Icon(Icons.add_circle_outline_rounded),
                        ),
                      ),
                      // Cyberoptics
                      Padding(
                        padding: EdgeInsets.only(
                          left: 312,
                          top: 105,
                        ),
                        child: FloatingActionButton(
                          mini: true,
                          backgroundColor:
                              const Color.fromRGBO(255, 255, 255, 0),
                          foregroundColor: Colors.white,
                          onPressed: () {
                            promptDialog('Cyberoptics', 2, context);
                          },
                          child: const Icon(Icons.add_circle_outline_rounded),
                        ),
                      ),
                      // Cyberaudio
                      Padding(
                        padding: EdgeInsets.only(
                          left: 360,
                          top: 115,
                        ),
                        child: FloatingActionButton(
                          mini: true,
                          backgroundColor:
                              const Color.fromRGBO(255, 255, 255, 0),
                          foregroundColor: Colors.white,
                          onPressed: () {
                            promptDialog("Cyberaudio", 3, context);
                          },
                          child: const Icon(Icons.add_circle_outline_rounded),
                        ),
                      ),
                      // IBC
                      Padding(
                        padding: EdgeInsets.only(
                          left: 327,
                          top: 240,
                        ),
                        child: FloatingActionButton(
                          mini: true,
                          backgroundColor:
                              const Color.fromRGBO(255, 255, 255, 0),
                          foregroundColor: Colors.white,
                          onPressed: () {
                            promptDialog("Internal Body", 4, context);
                          },
                          child: const Icon(Icons.add_circle_outline_rounded),
                        ),
                      ),
                      // EBC
                      Padding(
                        padding: EdgeInsets.only(
                          left: 450,
                          top: 220,
                        ),
                        child: FloatingActionButton(
                          mini: true,
                          backgroundColor:
                              const Color.fromRGBO(255, 255, 255, 0),
                          foregroundColor: Colors.white,
                          onPressed: () {
                            promptDialog("External Body", 5, context);
                          },
                          child: const Icon(Icons.add_circle_outline_rounded),
                        ),
                      ),
                      // Cyberlimbs Arm
                      Padding(
                        padding: EdgeInsets.only(
                          left: 225,
                          top: 380,
                        ),
                        child: FloatingActionButton(
                          mini: true,
                          backgroundColor:
                              const Color.fromRGBO(255, 255, 255, 0),
                          foregroundColor: Colors.white,
                          onPressed: () {
                            promptDialog('Cyberlimbs Arms', 6, context);
                          },
                          child: const Icon(Icons.add_circle_outline_rounded),
                        ),
                      ),
                      // Cyberlimbs Leg
                      Padding(
                        padding: EdgeInsets.only(
                          left: 300,
                          top: 600,
                        ),
                        child: FloatingActionButton(
                          mini: true,
                          backgroundColor:
                              const Color.fromRGBO(255, 255, 255, 0),
                          foregroundColor: Colors.white,
                          onPressed: () {
                            promptDialog('Cyberlimbs Legs', 7, context);
                          },
                          child: const Icon(Icons.add_circle_outline_rounded),
                        ),
                      )
                    ],
                  )))),
    );
  }

  Future<void> promptDialog(String label, int index, BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('Add $label Cyberware:'),
              content: TextField(
                controller: _controller[index],
                onChanged: (value) {
                  setState(() {});
                },
                style: const TextStyle(fontSize: 35),
              ),
              actions: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.labelMedium),
                  child: const Text('Add'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.labelMedium),
                  child: const Text('Close'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ]);
        });
  }
}
