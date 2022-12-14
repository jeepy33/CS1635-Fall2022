import 'package:cybersheet/presenter/presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants.dart';
import '../main.dart';

class CharacterOverview extends StatefulWidget {
  const CharacterOverview({super.key});

  @override
  State<StatefulWidget> createState() => _CharacterOverviewState();
}

class _CharacterOverviewState extends State<CharacterOverview> {
  final List<TextEditingController> _controller = [
    TextEditingController(), // INT
    TextEditingController(), // REF
    TextEditingController(), // DEX
    TextEditingController(), // TECH
    TextEditingController(), // COOL
    TextEditingController(), // WILL
    TextEditingController(), // LUCK
    TextEditingController(), // LUCK MAX
    TextEditingController(), // MOVE
    TextEditingController(), // BODY
    TextEditingController(), // EMP
    TextEditingController(), // EMP MAX
    TextEditingController(), // Health
  ];

  final List<AssetImage> _orbs = [
    const AssetImage("health_orb_0.png"),
    const AssetImage("health_orb_1.png"),
    const AssetImage("health_orb_2.png"),
    const AssetImage("health_orb_3.png"),
    const AssetImage("health_orb_4.png"),
    const AssetImage("health_orb_5.png"),
    const AssetImage("health_orb_6.png"),
    const AssetImage("health_orb_7.png"),
    const AssetImage("health_orb_8.png"),
    const AssetImage("health_orb_9.png"),
    const AssetImage("health_orb_10.png"),
    const AssetImage("health_orb_11.png"),
    const AssetImage("health_orb_12.png"),
  ];

  int INT = presenter.model.character.stats.INT;
  int REF = presenter.model.character.stats.REF;
  int DEX = presenter.model.character.stats.DEX;
  int TECH = presenter.model.character.stats.TECH;
  int COOL = presenter.model.character.stats.COOL;
  int WILL = presenter.model.character.stats.WILL;
  int LUCK = presenter.model.character.stats.LUCK;
  int LUCK_MAX = presenter.model.character.stats.LUCK_MAX;
  int MOVE = presenter.model.character.stats.MOVE;
  int BODY = presenter.model.character.stats.BODY;
  int EMP = presenter.model.character.stats.EMP;
  int EMP_MAX = presenter.model.character.stats.EMP_MAX;
  int maxHealth = presenter.model.character.stats.HP_MAX;
  int health = presenter.model.character.stats.HP;
  int maxHumanity = presenter.model.character.stats.HUM_MAX;
  int humanity = presenter.model.character.stats.HUM;
  String name = presenter.model.character.name;
  String role = presenter.model.character.role[0].toString();
  int rank = presenter.model.character.role[0].getRank();
  bool isSeriously = presenter.model.character.isSeriouslyWounded;
  bool isMortally = presenter.model.character.isMortallyWounded;

  final List<bool> _injurySelections = [false, false];

  @override
  void initState() {
    super.initState();

    _controller[0].text = INT.toString();
    _controller[1].text = REF.toString();
    _controller[2].text = DEX.toString();
    _controller[3].text = TECH.toString();
    _controller[4].text = COOL.toString();
    _controller[5].text = WILL.toString();
    _controller[6].text = LUCK.toString();
    _controller[7].text = LUCK_MAX.toString();
    _controller[8].text = MOVE.toString();
    _controller[9].text = BODY.toString();
    _controller[10].text = EMP.toString();
    _controller[11].text = EMP_MAX.toString();
    _controller[12].text = health.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("Cyberwire.png"),
          fit: BoxFit.cover,
        )),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Image(
                      image: AssetImage('default_portrait.jpeg'),
                      width: 225,
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 10, left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(name,
                                style: const TextStyle(
                                    fontSize: 35, color: Colors.white)),
                            Text("$role: $rank",
                                style: const TextStyle(
                                    fontSize: 25, color: Colors.white)),
                            Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, left: 10),
                                child: Row(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Stack(
                                      alignment: Alignment.center,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        Image(
                                          image: _orbs[
                                              choose_orb(health, maxHealth)],
                                          width: 200,
                                        ),
                                        Center(
                                            child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 90, top: 5),
                                                child: SizedBox(
                                                    width: 60,
                                                    height: 50,
                                                    child: TextField(
                                                      // Set the underline color to the desired color
                                                      inputFormatters: [
                                                        FilteringTextInputFormatter
                                                            .allow(RegExp(
                                                                r'[0-9]')),
                                                        FilteringTextInputFormatter
                                                            .digitsOnly
                                                      ],
                                                      cursorColor: buttonRed,
                                                      style: const TextStyle(
                                                          fontSize: 40,
                                                          color: buttonRed),
                                                      textAlign:
                                                          TextAlign.right,
                                                      maxLength: 2,
                                                      decoration:
                                                          const InputDecoration(
                                                        counterText: "",
                                                        enabledBorder:
                                                            UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: buttonRed),
                                                        ),
                                                        focusedBorder:
                                                            UnderlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: buttonRed),
                                                        ),
                                                      ),
                                                      keyboardType:
                                                          TextInputType.number,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          health =
                                                              int.parse(value);
                                                          presenter
                                                              .model
                                                              .character
                                                              .stats
                                                              .HP = health;
                                                        });
                                                      },
                                                      controller:
                                                          _controller[12],
                                                    )))),
                                        const Center(
                                            child: Padding(
                                                padding:
                                                    EdgeInsets.only(top: 5),
                                                child: Text(
                                                  '/',
                                                  style: TextStyle(
                                                      fontSize: 40,
                                                      color: buttonRed),
                                                ))),
                                        Center(
                                            child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 85, top: 5),
                                                child: Text(
                                                  '$maxHealth',
                                                  style: const TextStyle(
                                                      fontSize: 40,
                                                      color: buttonRed),
                                                ))),
                                        const Padding(
                                          padding: EdgeInsets.only(bottom: 95),
                                          child: Text(
                                            'HP',
                                            style: TextStyle(
                                                fontSize: 30, color: buttonRed),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Stack(alignment: Alignment.center,
                                        // ignore: prefer_const_literals_to_create_immutables
                                        children: [
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5, bottom: 90),
                                              child: Image(
                                                image: _orbs[choose_orb(
                                                    humanity, maxHumanity)],
                                                width: 100,
                                              )),
                                          Center(
                                              child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 45, bottom: 90),
                                                  child: Text(
                                                    '$maxHumanity',
                                                    style: const TextStyle(
                                                        fontSize: 20,
                                                        color: buttonRed),
                                                  ))),
                                          const Center(
                                              child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 5, bottom: 90),
                                                  child: Text(
                                                    '/',
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: buttonRed),
                                                  ))),
                                          Center(
                                              child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 35,
                                                          bottom: 90),
                                                  child: Text(
                                                    '$humanity',
                                                    style: const TextStyle(
                                                        fontSize: 20,
                                                        color: buttonRed),
                                                  ))),
                                          const Padding(
                                            padding: EdgeInsets.only(
                                              bottom: 140,
                                            ),
                                            child: Text(
                                              'HUM',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: buttonRed),
                                            ),
                                          ),
                                        ])
                                  ],
                                ))
                          ],
                        ))
                  ],
                ),
              ),
              const Padding(
                  padding: EdgeInsets.only(left: 55, top: 0),
                  child: Text('Stats',
                      style: TextStyle(fontSize: 35, color: Colors.white))),
              Padding(
                  padding: const EdgeInsets.only(left: 50, top: 0),
                  child: Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextButton(
                                  style: const ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(buttonRed),
                                  ),
                                  onPressed: () {},
                                  child: const Padding(
                                      padding: EdgeInsets.only(
                                          left: 5,
                                          right: 25,
                                          top: 5,
                                          bottom: 5),
                                      child: Text('INT:',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white)))),
                              Container(
                                  color: buttonRed,
                                  width: 90,
                                  height: 50,
                                  child: TextField(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]')),
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    // Set the underline color to the desired color

                                    cursorColor: Colors.white,
                                    style: const TextStyle(
                                        fontSize: 35, color: Colors.white),
                                    textAlign: TextAlign.right,
                                    maxLength: 1,
                                    decoration: const InputDecoration(
                                      counterText: "",
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                    ),
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      setState(() {
                                        INT = int.parse(value);
                                        presenter.model.character.stats.INT =
                                            INT;
                                      });
                                    },
                                    controller: _controller[0],
                                  )),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextButton(
                                  style: const ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(buttonRed),
                                  ),
                                  onPressed: () {},
                                  child: const Padding(
                                      padding: EdgeInsets.only(
                                          left: 5,
                                          right: 20,
                                          top: 5,
                                          bottom: 5),
                                      child: Text('REF:',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white)))),
                              Container(
                                  color: buttonRed,
                                  width: 90,
                                  height: 50,
                                  child: TextField(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]')),
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    cursorColor: Colors.white,
                                    style: const TextStyle(
                                        fontSize: 35, color: Colors.white),
                                    textAlign: TextAlign.right,
                                    maxLength: 1,
                                    decoration: const InputDecoration(
                                      counterText: "",
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                    ),
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      setState(() {
                                        REF = int.parse(value);
                                        presenter.model.character.stats.REF =
                                            REF;
                                      });
                                    },
                                    controller: _controller[1],
                                  )),
                            ],
                          ))
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.only(left: 50),
                  child: Row(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextButton(
                                  style: const ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(buttonRed),
                                  ),
                                  onPressed: () {},
                                  child: const Padding(
                                      padding: EdgeInsets.only(
                                          left: 5,
                                          right: 15,
                                          top: 5,
                                          bottom: 5),
                                      child: Text('DEX:',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white)))),
                              Container(
                                  color: buttonRed,
                                  width: 90,
                                  height: 50,
                                  child: TextField(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]')),
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    cursorColor: Colors.white,
                                    style: const TextStyle(
                                        fontSize: 35, color: Colors.white),
                                    textAlign: TextAlign.right,
                                    maxLength: 1,
                                    decoration: const InputDecoration(
                                      counterText: "",
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                    ),
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      setState(() {
                                        DEX = int.parse(value);
                                        presenter.model.character.stats.DEX =
                                            DEX;
                                      });
                                    },
                                    controller: _controller[2],
                                  )),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextButton(
                                  style: const ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(buttonRed),
                                  ),
                                  onPressed: () {},
                                  child: const Padding(
                                      padding: EdgeInsets.only(
                                          left: 5, right: 5, top: 5, bottom: 5),
                                      child: Text('TECH:',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white)))),
                              Container(
                                  color: buttonRed,
                                  width: 90,
                                  height: 50,
                                  child: TextField(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]')),
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    cursorColor: Colors.white,
                                    style: const TextStyle(
                                        fontSize: 35, color: Colors.white),
                                    textAlign: TextAlign.right,
                                    maxLength: 1,
                                    decoration: const InputDecoration(
                                      counterText: "",
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                    ),
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      setState(() {
                                        TECH = int.parse(value);
                                        presenter.model.character.stats.TECH =
                                            TECH;
                                      });
                                    },
                                    controller: _controller[3],
                                  )),
                            ],
                          ))
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.only(left: 50),
                  child: Row(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextButton(
                                  style: const ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(buttonRed),
                                  ),
                                  onPressed: () {},
                                  child: const Padding(
                                      padding: EdgeInsets.only(
                                          left: 5, right: 5, top: 5, bottom: 5),
                                      child: Text('COOL:',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white)))),
                              Container(
                                  color: buttonRed,
                                  width: 90,
                                  height: 50,
                                  child: TextField(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]')),
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    cursorColor: Colors.white,
                                    style: const TextStyle(
                                        fontSize: 35, color: Colors.white),
                                    textAlign: TextAlign.right,
                                    maxLength: 1,
                                    decoration: const InputDecoration(
                                      counterText: "",
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                    ),
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      setState(() {
                                        COOL = int.parse(value);
                                        presenter.model.character.stats.COOL =
                                            COOL;
                                      });
                                    },
                                    controller: _controller[4],
                                  )),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextButton(
                                  style: const ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(buttonRed),
                                  ),
                                  onPressed: () {},
                                  child: const Padding(
                                      padding: EdgeInsets.only(
                                          left: 5,
                                          right: 15,
                                          top: 5,
                                          bottom: 5),
                                      child: Text('WILL:',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white)))),
                              Container(
                                  color: buttonRed,
                                  width: 90,
                                  height: 50,
                                  child: TextField(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]')),
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    cursorColor: Colors.white,
                                    style: const TextStyle(
                                        fontSize: 35, color: Colors.white),
                                    textAlign: TextAlign.right,
                                    maxLength: 1,
                                    decoration: const InputDecoration(
                                      counterText: "",
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                    ),
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      setState(() {
                                        WILL = int.parse(value);
                                        maxHealth =
                                            (5 * ((BODY + WILL) / 2).round());
                                        presenter.model.character.stats.WILL =
                                            WILL;
                                        presenter.model.character.stats.HP_MAX =
                                            maxHealth;
                                      });
                                    },
                                    controller: _controller[5],
                                  )),
                            ],
                          ))
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.only(left: 50),
                  child: Row(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextButton(
                                  style: const ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(buttonRed),
                                  ),
                                  onPressed: () {},
                                  child: const Padding(
                                      padding: EdgeInsets.only(
                                          left: 5, right: 5, top: 5, bottom: 5),
                                      child: Text('LUCK:',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white)))),
                              Container(
                                  color: buttonRed,
                                  width: 35,
                                  height: 50,
                                  child: TextField(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]')),
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    cursorColor: Colors.white,
                                    style: const TextStyle(
                                        fontSize: 35, color: Colors.white),
                                    textAlign: TextAlign.right,
                                    maxLength: 1,
                                    decoration: const InputDecoration(
                                      counterText: "",
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                    ),
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      setState(() {
                                        LUCK = int.parse(value);
                                        presenter.model.character.stats.LUCK =
                                            LUCK;
                                      });
                                    },
                                    controller: _controller[6],
                                  )),
                              Container(
                                  color: buttonRed,
                                  width: 15,
                                  height: 50,
                                  child: const Padding(
                                      padding:
                                          EdgeInsets.only(top: 10, right: 10),
                                      child: Text('/',
                                          style: TextStyle(
                                              fontSize: 35,
                                              color: Colors.white)))),
                              Container(
                                  color: buttonRed,
                                  width: 40,
                                  height: 50,
                                  child: TextField(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]')),
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    cursorColor: Colors.white,
                                    style: const TextStyle(
                                        fontSize: 35, color: Colors.white),
                                    textAlign: TextAlign.right,
                                    maxLength: 1,
                                    decoration: const InputDecoration(
                                      counterText: "",
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                    ),
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      setState(() {
                                        LUCK_MAX = int.parse(value);
                                        presenter.model.character.stats
                                            .LUCK_MAX = LUCK_MAX;
                                      });
                                    },
                                    controller: _controller[7],
                                  )),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextButton(
                                  style: const ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(buttonRed),
                                  ),
                                  onPressed: () {},
                                  child: const Padding(
                                      padding: EdgeInsets.only(
                                          left: 5, right: 3, top: 5, bottom: 5),
                                      child: Text('MOVE:',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white)))),
                              Container(
                                  color: buttonRed,
                                  width: 90,
                                  height: 50,
                                  child: TextField(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]')),
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    cursorColor: Colors.white,
                                    style: const TextStyle(
                                        fontSize: 35, color: Colors.white),
                                    textAlign: TextAlign.right,
                                    maxLength: 1,
                                    decoration: const InputDecoration(
                                      counterText: "",
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                    ),
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      setState(() {
                                        MOVE = int.parse(value);
                                        presenter.model.character.stats.MOVE =
                                            MOVE;
                                      });
                                    },
                                    controller: _controller[8],
                                  )),
                            ],
                          ))
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.only(left: 50),
                  child: Row(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextButton(
                                  style: const ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(buttonRed),
                                  ),
                                  onPressed: () {},
                                  child: const Padding(
                                      padding: EdgeInsets.only(
                                          left: 5, right: 0, top: 5, bottom: 5),
                                      child: Text('BODY:',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white)))),
                              Container(
                                  color: buttonRed,
                                  width: 90,
                                  height: 50,
                                  child: TextField(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]')),
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    cursorColor: Colors.white,
                                    style: const TextStyle(
                                        fontSize: 35, color: Colors.white),
                                    textAlign: TextAlign.right,
                                    maxLength: 1,
                                    decoration: const InputDecoration(
                                      counterText: "",
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                    ),
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      setState(() {
                                        BODY = int.parse(value);
                                        maxHealth =
                                            (5 * ((BODY + WILL) / 2).round());
                                        presenter.model.character.stats.BODY =
                                            BODY;
                                        presenter.model.character.stats.HP_MAX =
                                            maxHealth;
                                      });
                                    },
                                    controller: _controller[9],
                                  )),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextButton(
                                  style: const ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(buttonRed),
                                  ),
                                  onPressed: () {},
                                  child: const Padding(
                                      padding: EdgeInsets.only(
                                          left: 5,
                                          right: 20,
                                          top: 5,
                                          bottom: 5),
                                      child: Text('EMP:',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white)))),
                              Container(
                                  color: buttonRed,
                                  width: 35,
                                  height: 50,
                                  child: TextField(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]')),
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    cursorColor: Colors.white,
                                    style: const TextStyle(
                                        fontSize: 35, color: Colors.white),
                                    textAlign: TextAlign.right,
                                    maxLength: 1,
                                    decoration: const InputDecoration(
                                      counterText: "",
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                    ),
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      setState(() {
                                        EMP = int.parse(value);
                                        humanity = EMP * 10;
                                        presenter.model.character.stats.EMP =
                                            EMP;
                                        presenter.model.character.stats.HUM =
                                            humanity;
                                      });
                                    },
                                    controller: _controller[10],
                                  )),
                              Container(
                                  color: buttonRed,
                                  width: 15,
                                  height: 50,
                                  child: const Padding(
                                      padding:
                                          EdgeInsets.only(top: 10, right: 10),
                                      child: Text('/',
                                          style: TextStyle(
                                              fontSize: 35,
                                              color: Colors.white)))),
                              Container(
                                  color: buttonRed,
                                  width: 40,
                                  height: 50,
                                  child: TextField(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]')),
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    cursorColor: Colors.white,
                                    style: const TextStyle(
                                        fontSize: 35, color: Colors.white),
                                    textAlign: TextAlign.right,
                                    maxLength: 1,
                                    decoration: const InputDecoration(
                                      counterText: "",
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                    ),
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      setState(() {
                                        EMP_MAX = int.parse(value);
                                        maxHumanity = EMP_MAX * 10;
                                        presenter.model.character.stats
                                            .EMP_MAX = EMP_MAX;
                                        presenter.model.character.stats
                                            .HUM_MAX = maxHumanity;
                                      });
                                    },
                                    controller: _controller[11],
                                  )),
                            ],
                          ))
                    ],
                  )),
            ]));
  }

  int choose_orb(int val, int max) {
    if (val == 0) {
      return 12;
    }
    if (val >= max) {
      return 0;
    }
    double ratio = val / max;

    if (ratio == 1.0) {
      return 0;
    } else if (ratio > .92) {
      return 1;
    } else if (ratio > .85) {
      return 2;
    } else if (ratio > .77) {
      return 3;
    } else if (ratio > .69) {
      return 4;
    } else if (ratio > .62) {
      return 5;
    } else if (ratio > .54) {
      return 6;
    } else if (ratio > .46) {
      return 7;
    } else if (ratio > .38) {
      return 8;
    } else if (ratio > .31) {
      return 9;
    } else if (ratio > .23) {
      return 10;
    } else {
      return 11;
    }
  }
}
