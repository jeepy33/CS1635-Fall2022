import 'package:cybersheet/main.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../model/model.dart';

class CharacterEquipment extends StatefulWidget {
  const CharacterEquipment({super.key});

  @override
  State<StatefulWidget> createState() => _CharacterEquipmentState();
}

class _CharacterEquipmentState extends State<CharacterEquipment> {
  List<Card> outfitCards = [];
  List<Card> rangedWeaponCards = [];
  List<Card> meleeWeaponCards = [];
  List<Card> armorCards = [];
  List<Card> stashedCards = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    outfitCards = _createOutfitCards();
    rangedWeaponCards = _createWeaponRangedCards();
    meleeWeaponCards = _createWeaponMeleeCards();
    armorCards = _createArmorCards();
    stashedCards = _createStashedCards();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage("Cyberwire.png"),
        fit: BoxFit.cover,
      )),
      child: Padding(
          padding: EdgeInsets.only(left: 50, top: 50),
          child: Row(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  const Text('Weapons/Armor',
                      style: TextStyle(fontSize: 40, color: Colors.white)),
                  FloatingActionButton(
                    mini: true,
                    backgroundColor: const Color.fromRGBO(255, 255, 255, 0),
                    foregroundColor: Colors.white,
                    onPressed: () {
                      _addWeaponDialog(context);
                    },
                    child: const Icon(Icons.add_circle_outline_rounded),
                  ),
                ]),
                Container(
                    color: buttonRed,
                    height: 125,
                    width: 500,
                    child: ListView(
                        children: List<Widget>.from(rangedWeaponCards))),
                SizedBox(
                  height: 25,
                ),
                Container(
                    color: buttonRed,
                    height: 125,
                    width: 500,
                    child: ListView(
                        children: List<Widget>.from(meleeWeaponCards))),
                SizedBox(
                  height: 25,
                ),
                Container(
                    color: buttonRed,
                    height: 300,
                    width: 500,
                    child: ListView(children: List<Widget>.from(armorCards)))
              ],
            ),
            const SizedBox(
              width: 75,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  const Text('Outfit',
                      style: TextStyle(fontSize: 40, color: Colors.white)),
                  FloatingActionButton(
                    mini: true,
                    backgroundColor: const Color.fromRGBO(255, 255, 255, 0),
                    foregroundColor: Colors.white,
                    onPressed: () {
                      _addOutfitDialog(context);
                    },
                    child: const Icon(Icons.add_circle_outline_rounded),
                  ),
                ]),
                Container(
                    color: buttonRed,
                    height: 600,
                    width: 500,
                    child: ListView(children: List<Widget>.from(outfitCards))),
              ],
            ),
            const SizedBox(
              width: 75,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  const Text('Stashed',
                      style: TextStyle(fontSize: 40, color: Colors.white)),
                  FloatingActionButton(
                    mini: true,
                    backgroundColor: const Color.fromRGBO(255, 255, 255, 0),
                    foregroundColor: Colors.white,
                    onPressed: () {
                      _addStashedDialog(context);
                    },
                    child: const Icon(Icons.add_circle_outline_rounded),
                  ),
                ]),
                Container(
                    color: buttonRed,
                    height: 600,
                    width: 500,
                    child: ListView(children: List<Widget>.from(stashedCards))),
              ],
            )
          ])),
    );
  }

  void moveCardLeft(Key widgetKey) {
    print('moving $widgetKey left');
    Card card = rangedWeaponCards.firstWhere(
      (element) => element.key == widgetKey,
      orElse: () => Card(key: missingKey),
    );
    if (card.key != missingKey) {
      presenter.model.character.equipped.removeItem(
          card.key.toString().substring(3, card.key.toString().length - 3));
      rangedWeaponCards.remove(card);
      return;
    }

    //print('not in rangedWeapons');

    card = meleeWeaponCards.firstWhere(
      (element) => element.key == widgetKey,
      orElse: () => Card(key: missingKey),
    );
    if (card.key != missingKey) {
      presenter.model.character.equipped.removeItem(
          card.key.toString().substring(3, card.key.toString().length - 3));
      meleeWeaponCards.remove(card);
      return;
    }

    //print('not in meleeWeapons');

    card = armorCards.firstWhere(
      (element) => element.key == widgetKey,
      orElse: () => Card(key: missingKey),
    );
    if (card.key != missingKey) {
      presenter.model.character.equipped.removeItem(
          card.key.toString().substring(3, card.key.toString().length - 3));
      armorCards.remove(card);
      return;
    }

    //print('not in armor');

    card = outfitCards.firstWhere(
      (element) => element.key == widgetKey,
      orElse: () => Card(key: missingKey),
    );
    if (card.key != missingKey) {
      presenter.model.character.equipped.addItem(Item(
          card.key.toString().substring(3, card.key.toString().length - 3)));
      presenter.model.character.outfit.removeItem(
          card.key.toString().substring(3, card.key.toString().length - 3));
      rangedWeaponCards.add(card);
      outfitCards.remove(card);
      return;
    }

    //print('not in outfit');

    card = stashedCards.firstWhere(
      (element) => element.key == widgetKey,
      orElse: () => Card(key: missingKey),
    );
    if (card.key != missingKey) {
      presenter.model.character.outfit.addItem(Item(
          card.key.toString().substring(3, card.key.toString().length - 3)));
      presenter.model.character.items.removeItem(
          card.key.toString().substring(3, card.key.toString().length - 3));
      outfitCards.add(card);
      stashedCards.remove(card);

      //print(outfitCards);
      //print(stashedCards);
      return;
    }

    //print('not in stashed');
  }

  void moveCardRight(Key widgetKey) {
    print('moving $widgetKey right');

    Card card = stashedCards.firstWhere(
      (element) => element.key == widgetKey,
      orElse: () => Card(key: missingKey),
    );
    if (card.key != missingKey) {
      presenter.model.character.items.removeItem(
          card.key.toString().substring(3, card.key.toString().length - 3));
      stashedCards.remove(card);
      return;
    }

    //print('not in stashed');

    card = outfitCards.firstWhere(
      (element) => element.key == widgetKey,
      orElse: () => Card(key: missingKey),
    );
    if (card.key != missingKey) {
      presenter.model.character.items.addItem(Item(
          card.key.toString().substring(3, card.key.toString().length - 3)));
      presenter.model.character.outfit.removeItem(
          card.key.toString().substring(3, card.key.toString().length - 3));
      stashedCards.add(card);
      outfitCards.remove(card);
      return;
    }

    //print('not in outfit');

    card = rangedWeaponCards.firstWhere(
      (element) => element.key == widgetKey,
      orElse: () => Card(key: missingKey),
    );
    if (card.key != missingKey) {
      presenter.model.character.outfit.addItem(Item(
          card.key.toString().substring(3, card.key.toString().length - 3)));
      presenter.model.character.equipped.removeItem(
          card.key.toString().substring(3, card.key.toString().length - 3));
      outfitCards.add(card);
      rangedWeaponCards.remove(card);
      return;
    }

    //print('not in rangedWeapons');

    card = meleeWeaponCards.firstWhere(
      (element) => element.key == widgetKey,
      orElse: () => Card(key: missingKey),
    );
    if (card.key != missingKey) {
      presenter.model.character.outfit.addItem(Item(
          card.key.toString().substring(3, card.key.toString().length - 3)));
      presenter.model.character.equipped.removeItem(
          card.key.toString().substring(3, card.key.toString().length - 3));
      outfitCards.add(card);
      meleeWeaponCards.remove(card);
      return;
    }

    //print('not in meleeWeapons');

    card = armorCards.firstWhere(
      (element) => element.key == widgetKey,
      orElse: () => Card(key: missingKey),
    );
    if (card.key != missingKey) {
      presenter.model.character.outfit.addItem(Item(
          card.key.toString().substring(3, card.key.toString().length - 3)));
      presenter.model.character.equipped.removeItem(
          card.key.toString().substring(3, card.key.toString().length - 3));
      outfitCards.add(card);
      armorCards.remove(card);
      return;
    }

    //print('not in armorWeapons');
  }

  List<Card> _createOutfitCards() {
    List<Item> items = presenter.model.character.outfit.items;

    List<Card> cards = [];

    for (Item element in items) {
      var key = Key('${element.name}');
      cards.add(
        Card(
          key: key,
          child: ListTile(
            leading: IconButton(
              icon: Icon(Icons.fast_rewind),
              onPressed: () {
                setState(() {
                  moveCardLeft(key);
                });
              },
            ),
            title: Text('${element.name}'),
            trailing: IconButton(
              icon: Icon(Icons.fast_forward),
              onPressed: () {
                setState(() {
                  moveCardRight(key);
                });
              },
            ),
          ),
        ),
      );
    }

    return cards;
  }

  List<Card> _createStashedCards() {
    List<Item> items = presenter.model.character.items.items;

    List<Card> cards = [];

    for (Item element in items) {
      var key = Key('${element.name}');
      cards.add(
        Card(
          key: key,
          child: ListTile(
            leading: IconButton(
              icon: Icon(Icons.fast_rewind),
              onPressed: () {
                setState(() {
                  moveCardLeft(key);
                });
              },
            ),
            title: Text('${element.name}'),
            trailing: IconButton(
              icon: Icon(Icons.fast_forward),
              onPressed: () {
                setState(() {
                  moveCardRight(key);
                });
              },
            ),
          ),
        ),
      );
    }

    return cards;
  }

  List<Card> _createWeaponRangedCards() {
    List<Item> items = presenter.model.character.equipped.items;

    List<Card> cards = [];

    for (Item element in items) {
      var key = Key('${element.name}');
      cards.add(
        Card(
          key: key,
          child: ListTile(
            leading: IconButton(
              icon: Icon(Icons.fast_rewind),
              onPressed: () {
                setState(() {
                  moveCardLeft(key);
                });
              },
            ),
            title: Text('${element.name}'),
            trailing: IconButton(
              icon: Icon(Icons.fast_forward),
              onPressed: () {
                setState(() {
                  moveCardRight(key);
                });
              },
            ),
          ),
        ),
      );
    }

    return cards;
  }

  List<Card> _createWeaponMeleeCards() {
    List<Item> items = [];

    List<Card> cards = [];

    for (Item element in items) {
      var key = Key(element.name);
      cards.add(
        Card(
          key: key,
          child: ListTile(
            leading: IconButton(
              icon: Icon(Icons.fast_rewind),
              onPressed: () {
                setState(() {
                  moveCardLeft(key);
                });
              },
            ),
            title: Text('${element.name}'),
            trailing: IconButton(
              icon: Icon(Icons.fast_forward),
              onPressed: () {
                setState(() {
                  moveCardRight(key);
                });
              },
            ),
          ),
        ),
      );
    }

    return cards;
  }

  List<Card> _createArmorCards() {
    List<Item> items = [];

    List<Card> cards = [];

    for (Item element in items) {
      var key = Key(element.name);
      cards.add(
        Card(
          key: key,
          child: ListTile(
            leading: IconButton(
              icon: Icon(Icons.fast_rewind),
              onPressed: () {
                setState(() {
                  moveCardLeft(key);
                });
              },
            ),
            title: Text('${element.name}'),
            trailing: IconButton(
              icon: Icon(Icons.fast_forward),
              onPressed: () {
                setState(() {
                  moveCardRight(key);
                });
              },
            ),
          ),
        ),
      );
    }

    return cards;
  }

  Future<void> _addWeaponDialog(BuildContext context) {
    TextEditingController _controller = TextEditingController();

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('Add to Weapons/Armor:'),
              content: TextField(
                controller: _controller,
                style: const TextStyle(fontSize: 35),
              ),
              actions: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.labelMedium),
                  child: const Text('Add'),
                  onPressed: () {
                    setState(() {
                      presenter.model.character.equipped
                          .addItem(Item(_controller.text));
                      rangedWeaponCards.add(
                        Card(
                          key: Key('${_controller.text}'),
                          child: ListTile(
                            leading: IconButton(
                              icon: Icon(Icons.fast_rewind),
                              onPressed: () {
                                setState(() {
                                  moveCardLeft(Key('${_controller.text}'));
                                });
                              },
                            ),
                            title: Text('${_controller.text}'),
                            trailing: IconButton(
                              icon: Icon(Icons.fast_forward),
                              onPressed: () {
                                setState(() {
                                  moveCardRight(Key('${_controller.text}'));
                                });
                              },
                            ),
                          ),
                        ),
                      );
                    });
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

  Future<void> _addOutfitDialog(BuildContext context) {
    TextEditingController _controller = TextEditingController();

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('Add to Outfit:'),
              content: TextField(
                controller: _controller,
                style: const TextStyle(fontSize: 35),
              ),
              actions: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.labelMedium),
                  child: const Text('Add'),
                  onPressed: () {
                    setState(() {
                      presenter.model.character.outfit
                          .addItem(Item(_controller.text));
                      outfitCards.add(
                        Card(
                          key: Key('${_controller.text}'),
                          child: ListTile(
                            leading: IconButton(
                              icon: Icon(Icons.fast_rewind),
                              onPressed: () {
                                setState(() {
                                  moveCardLeft(Key('${_controller.text}'));
                                });
                              },
                            ),
                            title: Text('${_controller.text}'),
                            trailing: IconButton(
                              icon: Icon(Icons.fast_forward),
                              onPressed: () {
                                setState(() {
                                  moveCardRight(Key('${_controller.text}'));
                                });
                              },
                            ),
                          ),
                        ),
                      );
                    });
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

  Future<void> _addStashedDialog(BuildContext context) {
    TextEditingController _controller = TextEditingController();

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('Add to Stashed:'),
              content: TextField(
                controller: _controller,
                style: const TextStyle(fontSize: 35),
              ),
              actions: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.labelMedium),
                  child: const Text('Add'),
                  onPressed: () {
                    setState(() {
                      presenter.model.character.items
                          .addItem(Item(_controller.text));
                      stashedCards.add(
                        Card(
                          key: Key('${_controller.text}'),
                          child: ListTile(
                            leading: IconButton(
                              icon: Icon(Icons.fast_rewind),
                              onPressed: () {
                                setState(() {
                                  moveCardLeft(Key('${_controller.text}'));
                                });
                              },
                            ),
                            title: Text('${_controller.text}'),
                            trailing: IconButton(
                              icon: Icon(Icons.fast_forward),
                              onPressed: () {
                                setState(() {
                                  moveCardRight(Key('${_controller.text}'));
                                });
                              },
                            ),
                          ),
                        ),
                      );
                    });
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
