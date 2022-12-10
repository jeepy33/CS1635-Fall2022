import 'package:flutter/material.dart';
import '../constants.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: cyberRed,
        body: Center(
          child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("Cyberwire.png"),
                fit: BoxFit.cover,
              )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Image(
                          image: AssetImage("Cybersheet_Logo.png"),
                          width: 1000)),
                  const Padding(
                      padding: EdgeInsets.only(bottom: 0),
                      child: Text(
                        'Home',
                        style: TextStyle(fontSize: 35, color: Colors.white),
                      )),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: buttonRed,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 60, vertical: 25),
                          textStyle: const TextStyle(
                              fontSize: 20, fontFamily: 'Kontakt'),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, newCharRoute,
                              arguments: 'arguments/chose NEW');
                        },
                        child: const Text('New Edgerunner'),
                      ),
                      const SizedBox(height: 20, width: 30),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: buttonRed,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 60, vertical: 25),
                          textStyle: const TextStyle(
                              fontSize: 20, fontFamily: 'Kontakt'),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, editCharRoute,
                              arguments: 'arguments/chose EDIT');
                        },
                        child: const Text('Edit Edgerunner'),
                      )
                    ],
                  ),
                ],
              )),
        ));
  }
}
