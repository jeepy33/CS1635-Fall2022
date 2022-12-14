import 'package:cybersheet/model/model.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import '../constants.dart';

class NewChar extends StatefulWidget {
  const NewChar({super.key});

  @override
  State<StatefulWidget> createState() => _NewCharState();
}

class _NewCharState extends State<NewChar> {
  String template = '';
  final List<bool> _selections = List<bool>.filled(3, false);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    presenter.model.character = Edgerunner();
  }

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
                const Text('Template Selection:',
                    style: TextStyle(fontSize: 30, color: Colors.white)),
                const SizedBox(height: 30),
                ToggleButtons(
                  renderBorder: false,
                  isSelected: _selections,
                  onPressed: (int index) {
                    setState(() {
                      _selections[index] = !_selections[index];
                    });
                  },
                  children: <Widget>[
                    TextButton(
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 60, vertical: 25),
                            foregroundColor:
                                _selections[0] ? buttonRed : Colors.white,
                            backgroundColor:
                                _selections[0] ? Colors.white : buttonRed),
                        onPressed: () {
                          setState(() {
                            presenter.model.character
                                .setTemplate(Template.STREETRAT);
                            template = Template.STREETRAT.toString();
                            _selections.fillRange(0, _selections.length, false);
                            _selections[0] = true;
                          });
                        },
                        child: const Text('Street Rat',
                            style: TextStyle(fontSize: 20))),
                    TextButton(
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 60, vertical: 25),
                            foregroundColor:
                                _selections[1] ? buttonRed : Colors.white,
                            backgroundColor:
                                _selections[1] ? Colors.white : buttonRed),
                        onPressed: () {
                          setState(() {
                            presenter.model.character
                                .setTemplate(Template.EDGERUNNER);
                            template = Template.EDGERUNNER.toString();
                            _selections.fillRange(0, _selections.length, false);
                            _selections[1] = true;
                          });
                        },
                        child: const Text('Edgerunner',
                            style: TextStyle(fontSize: 20))),
                    TextButton(
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 25),
                            foregroundColor:
                                _selections[2] ? buttonRed : Colors.white,
                            backgroundColor:
                                _selections[2] ? Colors.white : buttonRed),
                        onPressed: () {
                          setState(() {
                            presenter.model.character
                                .setTemplate(Template.COMPLETE);
                            template = Template.COMPLETE.toString();
                            _selections.fillRange(0, _selections.length, false);
                            _selections[2] = true;
                          });
                        },
                        child: const Text('Complete Package',
                            style: TextStyle(fontSize: 20)))
                  ],
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
                    if (template.isEmpty) {
                      setState(() {
                        int r = presenter.rand.nextInt(3);
                        Template temp = Template.values[r];
                        presenter.model.character.setTemplate(temp);
                        template = temp.toString();
                        _selections.fillRange(0, _selections.length, false);
                        _selections[r] = true;
                      });
                    }
                    Navigator.pushNamed(context, templatesRoute,
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
