import 'package:flutter/material.dart';
import '../main.dart';
import '../constants.dart';
import '../model/model.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({super.key});

  @override
  State<StatefulWidget> createState() => _InventoryState();
}

class _InventoryState extends State<InventoryPage> {
  String role = presenter.model.character.role.toString();
  Map<String, int> itemMap = rockerItems;
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
                const Text('Inventory: ',
                    style: TextStyle(fontSize: 30, color: Colors.white)),
                const SizedBox(height: 15),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: buttonRed,
                  ),
                  child: Column(children: createItemList(itemMap)),
                ),
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
                      itemMap.forEach((key, value) {
                        if (value == 0) {
                          presenter.model.character.items.addItem(Item(key));
                        }
                      });
                      presenter.model.character.items
                          .addItem(Item(presenter.globalDropDown));
                    });
                    Navigator.pushNamed(context, editCharRoute,
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
                ),
              ],
            ),
          ),
        ));
  }

  createItemList(Map<String, int> map) {
    var textFields = <Padding>[];
    var list = map.keys;

    list.forEach((element) {
      var textSegment;
      if (map[element] != 0) {
        List<String> split = element.split(',');
        textSegment = Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Column(children: [
              DropdownButton<String>(
                dropdownColor: buttonRed,
                value: presenter.globalDropDown,
                items: split.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    presenter.globalDropDown = newValue!;
                  });
                },
              ),
            ]));
      } else {
        textSegment = Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              element,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ));
      }
      return textFields.add(textSegment);
    });
    return textFields;
  }
}
