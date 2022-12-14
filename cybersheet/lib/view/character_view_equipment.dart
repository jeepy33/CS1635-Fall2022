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
                const Text('Weapons/Armor',
                    style: TextStyle(fontSize: 40, color: Colors.white)),
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
                const Text('Outfit',
                    style: TextStyle(fontSize: 40, color: Colors.white)),
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
                const Text('Stashed',
                    style: TextStyle(fontSize: 40, color: Colors.white)),
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
      return;
    }

    //print('not in rangedWeapons');

    card = meleeWeaponCards.firstWhere(
      (element) => element.key == widgetKey,
      orElse: () => Card(key: missingKey),
    );
    if (card.key != missingKey) {
      return;
    }

    //print('not in meleeWeapons');

    card = armorCards.firstWhere(
      (element) => element.key == widgetKey,
      orElse: () => Card(key: missingKey),
    );
    if (card.key != missingKey) {
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
}
