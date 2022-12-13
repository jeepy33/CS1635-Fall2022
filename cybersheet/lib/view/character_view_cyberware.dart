import 'package:flutter/material.dart';
import '../constants.dart';

class CharacterCyberware extends StatefulWidget {
  const CharacterCyberware({super.key});

  @override
  State<StatefulWidget> createState() => _CharacterCyberwareState();
}

class _CharacterCyberwareState extends State<CharacterCyberware> {
  List<String> environmentList = ChildhoodEnvironment;
  String environment = ChildhoodEnvironment[0];

  List<String> crisisList = FamilyCrisis;
  String crisis = FamilyCrisis[0];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage("Cyberwire.png"),
        fit: BoxFit.cover,
      )),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Image(
              image: AssetImage("Body3.png"),
              width: 300,
              height: 250,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
            child: Image(
              image: AssetImage("BodyNoShade.png"),
              width: 300,
              height: 250,
            ),
          ),
          Positioned(
            left: 820,
            bottom: 700,
            child: FloatingActionButton(
              mini: true,
              backgroundColor: Color.fromRGBO(255, 255, 255, 0),
              foregroundColor: Colors.white,
              onPressed: () {
                // Handle the button press
              },
              child: Icon(Icons.add_circle_outline_rounded),
            ),
          ),
          Positioned(
            left: 750,
            bottom: 600,
            child: FloatingActionButton(
              mini: true,
              backgroundColor: Color.fromRGBO(255, 255, 255, 0),
              foregroundColor: Colors.white,
              onPressed: () {
                // Handle the button press
              },
              child: Icon(Icons.add_circle_outline_rounded),
            ),
          ),
          Positioned(
            left: 1000,
            bottom: 550,
            child: FloatingActionButton(
              mini: true,
              backgroundColor: Color.fromRGBO(255, 255, 255, 0),
              foregroundColor: Colors.white,
              onPressed: () {
                // Handle the button press
              },
              child: Icon(Icons.add_circle_outline_rounded),
            ),
          ),
          Positioned(
            left: 750,
            bottom: 400,
            child: FloatingActionButton(
              mini: true,
              backgroundColor: Color.fromRGBO(255, 255, 255, 0),
              foregroundColor: Colors.white,
              onPressed: () {
                // Handle the button press
              },
              child: Icon(Icons.add_circle_outline_rounded),
            ),
          ),
          Positioned(
            left: 750,
            bottom: 200,
            child: FloatingActionButton(
              mini: true,
              backgroundColor: Color.fromRGBO(255, 255, 255, 0),
              foregroundColor: Colors.white,
              onPressed: () {
                // Handle the button press
              },
              child: Icon(Icons.add_circle_outline_rounded),
            ),
          ),
          Positioned(
            left: 950,
            bottom: 200,
            child: FloatingActionButton(
              mini: true,
              backgroundColor: Color.fromRGBO(255, 255, 255, 0),
              foregroundColor: Colors.white,
              onPressed: () {
                // Handle the button press
              },
              child: Icon(Icons.add_circle_outline_rounded),
            ),
          )
        ],
      ),
    );
  }
}
