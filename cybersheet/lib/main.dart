import 'package:cybersheet/presenter/presenter.dart';
import 'package:cybersheet/model/model.dart';
import 'package:flutter/material.dart';
import 'package:number_inc_dec/number_inc_dec.dart';

import 'router.dart' as LocalRouter;
import 'constants.dart';

Presenter presenter = new Presenter();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Home(),
      ),
      onGenerateRoute: LocalRouter.Router.generateRoute,
      initialRoute: homeRoute,
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Text('Home'),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {
              Navigator.pushNamed(context, newCharRoute,
                  arguments: 'arguments/chose NEW');
            },
            child: const Text('New Edgerunner'),
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {
              Navigator.pushNamed(context, editCharRoute,
                  arguments: 'arguments/chose EDIT');
            },
            child: const Text('Edit Edgerunner'),
          )
        ],
      )),
    );
  }
}

class newChar extends StatefulWidget {
  final String data;

  newChar(this.data);

  @override
  State<StatefulWidget> createState() => _newCharState();
}

class _newCharState extends State<newChar> {
  String template = '';
  List<bool> _selections = List<bool>.filled(3, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Template Selection: $template'),
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
                        foregroundColor: Colors.black,
                        backgroundColor:
                            _selections[0] ? Colors.red : Colors.white),
                    onPressed: () {
                      setState(() {
                        presenter.model.character
                            .setTemplate(Template.STREETRAT);
                        template = Template.STREETRAT.toString();
                        _selections.fillRange(0, _selections.length, false);
                        _selections[0] = true;
                      });
                    },
                    child: const Text('Street Rat')),
                TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor:
                            _selections[1] ? Colors.red : Colors.white),
                    onPressed: () {
                      setState(() {
                        presenter.model.character
                            .setTemplate(Template.EDGERUNNER);
                        template = Template.EDGERUNNER.toString();
                        _selections.fillRange(0, _selections.length, false);
                        _selections[1] = true;
                      });
                    },
                    child: const Text('Edgerunner')),
                TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor:
                            _selections[2] ? Colors.red : Colors.white),
                    onPressed: () {
                      setState(() {
                        presenter.model.character
                            .setTemplate(Template.COMPLETE);
                        template = Template.COMPLETE.toString();
                        _selections.fillRange(0, _selections.length, false);
                        _selections[2] = true;
                      });
                    },
                    child: const Text('Complete Package'))
              ],
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
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
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back'),
            )
          ],
        ),
      ),
    );
  }
}

class RolesPage extends StatefulWidget {
  final String data;

  RolesPage(this.data);

  @override
  State<StatefulWidget> createState() => _roleState();
}

class _roleState extends State<RolesPage> {
  String template = '';
  List<bool> _selections = List<bool>.filled(10, false);
  RoleType roleToAdd = RoleType.NONE;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Role Selection: $template'),
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
                        foregroundColor: Colors.black,
                        backgroundColor:
                            _selections[0] ? Colors.red : Colors.white),
                    onPressed: () {
                      setState(() {
                        roleToAdd = RoleType.ROCKERBOY;
                        template = RoleType.ROCKERBOY.toString();
                        _selections.fillRange(0, _selections.length, false);
                        _selections[0] = true;
                      });
                    },
                    child: const Text('Rockerboy')),
                TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor:
                            _selections[1] ? Colors.red : Colors.white),
                    onPressed: () {
                      setState(() {
                        roleToAdd = RoleType.SOLO;
                        template = RoleType.SOLO.toString();
                        _selections.fillRange(0, _selections.length, false);
                        _selections[1] = true;
                      });
                    },
                    child: const Text('Solo')),
                TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor:
                            _selections[2] ? Colors.red : Colors.white),
                    onPressed: () {
                      setState(() {
                        roleToAdd = RoleType.NETRUNNER;
                        template = RoleType.NETRUNNER.toString();
                        _selections.fillRange(0, _selections.length, false);
                        _selections[2] = true;
                      });
                    },
                    child: const Text('Netrunner')),
                TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor:
                            _selections[3] ? Colors.red : Colors.white),
                    onPressed: () {
                      setState(() {
                        roleToAdd = RoleType.TECH;
                        template = RoleType.TECH.toString();
                        _selections.fillRange(0, _selections.length, false);
                        _selections[3] = true;
                      });
                    },
                    child: const Text('Tech')),
                TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor:
                            _selections[4] ? Colors.red : Colors.white),
                    onPressed: () {
                      setState(() {
                        roleToAdd = RoleType.MEDTECH;
                        template = RoleType.MEDTECH.toString();
                        _selections.fillRange(0, _selections.length, false);
                        _selections[4] = true;
                      });
                    },
                    child: const Text('Medtech')),
                TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor:
                            _selections[5] ? Colors.red : Colors.white),
                    onPressed: () {
                      setState(() {
                        roleToAdd = RoleType.MEDIA;
                        template = RoleType.MEDIA.toString();
                        _selections.fillRange(0, _selections.length, false);
                        _selections[5] = true;
                      });
                    },
                    child: const Text('Media')),
                TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor:
                            _selections[6] ? Colors.red : Colors.white),
                    onPressed: () {
                      setState(() {
                        roleToAdd = RoleType.EXEC;
                        template = RoleType.EXEC.toString();
                        _selections.fillRange(0, _selections.length, false);
                        _selections[6] = true;
                      });
                    },
                    child: const Text('Exec')),
                TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor:
                            _selections[7] ? Colors.red : Colors.white),
                    onPressed: () {
                      setState(() {
                        roleToAdd = RoleType.LAWMAN;
                        template = RoleType.LAWMAN.toString();
                        _selections.fillRange(0, _selections.length, false);
                        _selections[7] = true;
                      });
                    },
                    child: const Text('Lawman')),
                TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor:
                            _selections[8] ? Colors.red : Colors.white),
                    onPressed: () {
                      setState(() {
                        roleToAdd = RoleType.FIXER;
                        template = RoleType.FIXER.toString();
                        _selections.fillRange(0, _selections.length, false);
                        _selections[8] = true;
                      });
                    },
                    child: const Text('Fixer')),
                TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor:
                            _selections[9] ? Colors.red : Colors.white),
                    onPressed: () {
                      setState(() {
                        roleToAdd = RoleType.NOMAD;
                        template = RoleType.NOMAD.toString();
                        _selections.fillRange(0, _selections.length, false);
                        _selections[9] = true;
                      });
                    },
                    child: const Text('Nomad')),
              ],
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                if (template.isEmpty) {
                  setState(() {
                    int r = presenter.rand.nextInt(10);
                    roleToAdd = RoleType.values[r];
                    _selections.fillRange(0, _selections.length, false);
                    _selections[r] = true;
                  });
                }
                presenter.addRole(roleToAdd, 4);
                template = roleToAdd.toString();

                Navigator.pushNamed(context, templateLifePath,
                    arguments: 'arguments/chose Templates');
              },
              child: const Text('Next'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back'),
            )
          ],
        ),
      ),
    );
  }
}

class LifePath extends StatefulWidget {
  final String data;

  LifePath(this.data);

  @override
  State<StatefulWidget> createState() => _lifePathState();
}

class _lifePathState extends State<LifePath> {
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Cultural Origins: $origin'),
            DropdownButton<String>(
              value: origin,
              items: originList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 20),
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
            ),
            Text('Language: $language'),
            DropdownButton<String>(
              value: language,
              items: languages.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 20),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  language = newValue!;
                });
              },
            ),
            Text('What Are You Like?: $personality'),
            DropdownButton<String>(
              value: personality,
              items:
                  personalityList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 20),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  personality = newValue!;
                });
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                setState(() {
                  if (origin.isEmpty) {
                    origin = originList[presenter.rand.nextInt(10) + 1];
                    languages = CulturalRegion[origin].split(',');
                    language = languages[0];
                  }

                  if (personality.isEmpty) {
                    personality = Personality[presenter.rand.nextInt(10) + 1];
                  }

                  presenter.model.character.lifepath.region = origin;
                  if (!presenter.model.character.lifepath.languages
                      .contains(language)) {
                    presenter.model.character.lifepath.languages.add(language);
                  }
                  presenter.model.character.lifepath.what_are_you_like =
                      personality;
                });
                Navigator.pushNamed(context, styleRoute,
                    arguments: 'arguments/chose Templates');
              },
              child: const Text('Next'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back'),
            )
          ],
        ),
      ),
    );
  }
}

class StylePage extends StatefulWidget {
  final String data;
  StylePage(this.data);

  @override
  State<StatefulWidget> createState() => _stylePageState();
}

class _stylePageState extends State<StylePage> {
  List<String> clothingStyle = ClothingStyle;
  String style = ClothingStyle[0];

  List<String> hairstyle = Hairstyle;
  String hair = Hairstyle[0];

  List<String> affecation = Affectation;
  String item = Affectation[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Clothing Style: $style'),
            DropdownButton<String>(
              value: style,
              items:
                  clothingStyle.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 20),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  style = newValue!;
                });
              },
            ),
            Text('Hairstyle: $hair'),
            DropdownButton<String>(
              value: hair,
              items: hairstyle.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 20),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  hair = newValue!;
                });
              },
            ),
            Text('Affecation You Are Never Without: $item'),
            DropdownButton<String>(
              value: item,
              items: affecation.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 20),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  item = newValue!;
                });
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
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
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back'),
            )
          ],
        ),
      ),
    );
  }
}

class MotivationsPage extends StatefulWidget {
  final String data;

  MotivationsPage(this.data);

  @override
  State<StatefulWidget> createState() => _motivationsState();
}

class _motivationsState extends State<MotivationsPage> {
  List<String> whatValueList = WhatValue;
  String whatValue = WhatValue[0];

  List<String> mostPeopleList = MostPeople;
  String mostPeople = MostPeople[0];

  List<String> whoValueList = WhoValue;
  String whoValue = WhoValue[0];

  List<String> valuedPossessionList = ValuedPossession;
  String possession = ValuedPossession[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('What Do You Value Most?: $whatValue'),
            DropdownButton<String>(
              value: whatValue,
              items:
                  whatValueList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 20),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  whatValue = newValue!;
                });
              },
            ),
            Text('How Do You Feel About Most People?: $mostPeople'),
            DropdownButton<String>(
              value: mostPeople,
              items:
                  mostPeopleList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 20),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  mostPeople = newValue!;
                });
              },
            ),
            Text('Most Valued Person in Your Life?: $whoValue'),
            DropdownButton<String>(
              value: whoValue,
              items: whoValueList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 20),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  whoValue = newValue!;
                });
              },
            ),
            Text('Most Valued Possession You Own?: $possession'),
            DropdownButton<String>(
              value: possession,
              items: valuedPossessionList
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 20),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  possession = newValue!;
                });
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                setState(() {
                  if (whatValue.isEmpty) {
                    whatValue = whatValueList[presenter.rand.nextInt(10) + 1];
                  }

                  if (mostPeople.isEmpty) {
                    mostPeople = mostPeopleList[presenter.rand.nextInt(10) + 1];
                  }

                  if (whoValue.isEmpty) {
                    whoValue = whoValueList[presenter.rand.nextInt(10) + 1];
                  }

                  if (possession.isEmpty) {
                    possession =
                        valuedPossessionList[presenter.rand.nextInt(10) + 1];
                  }

                  presenter.model.character.lifepath.what_do_you_value_most =
                      whatValue;
                  presenter.model.character.lifepath
                      .how_do_you_feel_about_most_people = mostPeople;
                  presenter.model.character.lifepath.most_valued_person =
                      whoValue;
                  presenter.model.character.lifepath.most_valued_possession =
                      possession;
                });
                Navigator.pushNamed(context, familyRoute,
                    arguments: 'arguments/chose Templates');
              },
              child: const Text('Next'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back'),
            )
          ],
        ),
      ),
    );
  }
}

class FamilyPage extends StatefulWidget {
  final String data;

  FamilyPage(this.data);

  @override
  State<StatefulWidget> createState() => _familyState();
}

class _familyState extends State<FamilyPage> {
  List<String> backgroundList = FamilyBackground.keys.toList().cast<String>();
  String background = FamilyBackground.keys.toList()[0];

  String backgroundDesc = FamilyBackground[FamilyBackground.keys.toList()[0]];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Family Background: $background'),
            DropdownButton<String>(
              value: background,
              items:
                  backgroundList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 20),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  background = newValue!;
                  backgroundDesc = FamilyBackground[background];
                });
              },
            ),
            Text('$backgroundDesc'),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                setState(() {
                  if (background.isEmpty) {
                    background = backgroundList[presenter.rand.nextInt(10) + 1];
                    backgroundDesc = FamilyBackground[background];
                  }

                  presenter.model.character.lifepath.background = background;
                  presenter.model.character.lifepath.background_desc =
                      backgroundDesc;
                });
                Navigator.pushNamed(context, environmentRoute,
                    arguments: 'arguments/chose Templates');
              },
              child: const Text('Next'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back'),
            )
          ],
        ),
      ),
    );
  }
}

class EnvironmentPage extends StatefulWidget {
  final String data;

  EnvironmentPage(this.data);

  @override
  State<StatefulWidget> createState() => _environmentPageState();
}

class _environmentPageState extends State<EnvironmentPage> {
  List<String> environmentList = ChildhoodEnvironment;
  String environment = ChildhoodEnvironment[0];

  List<String> crisisList = FamilyCrisis;
  String crisis = FamilyCrisis[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Childhood Environment: $environment'),
            DropdownButton<String>(
              value: environment,
              items:
                  environmentList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 20),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  environment = newValue!;
                });
              },
            ),
            Text('Family Crisis: $crisis'),
            DropdownButton<String>(
              value: crisis,
              items: crisisList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 20),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  crisis = newValue!;
                });
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                setState(() {
                  if (environment.isEmpty) {
                    environment =
                        environmentList[presenter.rand.nextInt(10) + 1];
                  }

                  if (crisis.isEmpty) {
                    crisis = crisisList[presenter.rand.nextInt(10) + 1];
                  }

                  presenter.model.character.lifepath.childhood_environment =
                      environment;
                  presenter.model.character.lifepath.family_crisis = crisis;
                });
                Navigator.pushNamed(context, friendsRoute,
                    arguments: 'arguments/chose Templates');
              },
              child: const Text('Next'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back'),
            )
          ],
        ),
      ),
    );
  }
}

class Friends extends StatefulWidget {
  final String data;

  Friends(this.data);

  @override
  State<StatefulWidget> createState() => _friendsState();
}

class _friendsState extends State<Friends> {
  num numFriends = 0;
  List<String> relationshipList = FriendRelationship;
  List<String> relationship = ['', '', ''];
  List<bool> friends = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Friends: $numFriends'),
            Container(
              constraints: BoxConstraints(maxWidth: 200),
              child: NumberInputWithIncrementDecrement(
                  controller: TextEditingController(),
                  min: 0,
                  max: 3,
                  onIncrement: (newValue) {
                    setState(() {
                      numFriends = newValue;
                      if (newValue == 0) {
                        friends = [false, false, false];
                      } else if (newValue == 1) {
                        friends = [true, false, false];
                      } else if (newValue == 2) {
                        friends = [true, true, false];
                      } else if (newValue == 3) {
                        friends = [true, true, true];
                      }
                    });
                  },
                  onDecrement: (newValue) {
                    setState(() {
                      numFriends = newValue;
                      if (newValue == 0) {
                        friends = [false, false, false];
                      } else if (newValue == 1) {
                        friends = [true, false, false];
                      } else if (newValue == 2) {
                        friends = [true, true, false];
                      } else if (newValue == 3) {
                        friends = [true, true, true];
                      }
                    });
                  }),
            ),
            DropdownButton<String>(
              value: relationship[0],
              items: relationshipList
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 20),
                  ),
                );
              }).toList(),
              onChanged: friends[0]
                  ? (String? newValue) {
                      setState(() {
                        relationship[0] = newValue!;
                      });
                    }
                  : null,
            ),
            DropdownButton<String>(
              value: relationship[1],
              items: relationshipList
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 20),
                  ),
                );
              }).toList(),
              onChanged: friends[1]
                  ? (String? newValue) {
                      setState(() {
                        relationship[1] = newValue!;
                      });
                    }
                  : null,
            ),
            DropdownButton<String>(
              value: relationship[2],
              items: relationshipList
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 20),
                  ),
                );
              }).toList(),
              onChanged: friends[2]
                  ? (String? newValue) {
                      setState(() {
                        relationship[2] = newValue!;
                      });
                    }
                  : null,
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                setState(() {
                  presenter.model.character.lifepath.friends =
                      numFriends.toInt();
                  presenter.model.character.lifepath.friend_desc = relationship;
                });
                Navigator.pushNamed(context, enemiesRoute,
                    arguments: 'arguments/chose Templates');
              },
              child: const Text('Next'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back'),
            )
          ],
        ),
      ),
    );
  }
}

class Enemies extends StatefulWidget {
  final String data;

  Enemies(this.data);

  @override
  State<StatefulWidget> createState() => _enemiesState();
}

class _enemiesState extends State<Enemies> {
  num numEnemies = 0;
  List<String> relationship = ['', '', ''];
  List<bool> enemies = [false, false, false];
  List<String> enemiesList = Enemy;
  List<String> cause = ['', '', ''];
  List<String> causeList = EnemyCause;
  List<String> resource = ['', '', ''];
  List<String> resourceList = EnemyResources;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Friends: $numEnemies'),
            Container(
              constraints: BoxConstraints(maxWidth: 200),
              child: NumberInputWithIncrementDecrement(
                  controller: TextEditingController(),
                  min: 0,
                  max: 3,
                  onIncrement: (newValue) {
                    setState(() {
                      numEnemies = newValue;
                      if (newValue == 0) {
                        enemies = [false, false, false];
                      } else if (newValue == 1) {
                        enemies = [true, false, false];
                      } else if (newValue == 2) {
                        enemies = [true, true, false];
                      } else if (newValue == 3) {
                        enemies = [true, true, true];
                      }
                    });
                  },
                  onDecrement: (newValue) {
                    setState(() {
                      numEnemies = newValue;
                      if (newValue == 0) {
                        enemies = [false, false, false];
                      } else if (newValue == 1) {
                        enemies = [true, false, false];
                      } else if (newValue == 2) {
                        enemies = [true, true, false];
                      } else if (newValue == 3) {
                        enemies = [true, true, true];
                      }
                    });
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton<String>(
                  value: relationship[0],
                  items:
                      enemiesList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(fontSize: 12),
                      ),
                    );
                  }).toList(),
                  onChanged: enemies[0]
                      ? (String? newValue) {
                          setState(() {
                            relationship[0] = newValue!;
                          });
                        }
                      : null,
                ),
                DropdownButton<String>(
                  value: cause[0],
                  items:
                      causeList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(fontSize: 12),
                      ),
                    );
                  }).toList(),
                  onChanged: enemies[0]
                      ? (String? newValue) {
                          setState(() {
                            cause[0] = newValue!;
                          });
                        }
                      : null,
                ),
                DropdownButton<String>(
                  value: resource[0],
                  items: resourceList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(fontSize: 12),
                      ),
                    );
                  }).toList(),
                  onChanged: enemies[0]
                      ? (String? newValue) {
                          setState(() {
                            resource[0] = newValue!;
                          });
                        }
                      : null,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton<String>(
                  value: relationship[1],
                  items:
                      enemiesList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(fontSize: 12),
                      ),
                    );
                  }).toList(),
                  onChanged: enemies[1]
                      ? (String? newValue) {
                          setState(() {
                            relationship[1] = newValue!;
                          });
                        }
                      : null,
                ),
                DropdownButton<String>(
                  value: cause[1],
                  items:
                      causeList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(fontSize: 12),
                      ),
                    );
                  }).toList(),
                  onChanged: enemies[1]
                      ? (String? newValue) {
                          setState(() {
                            cause[1] = newValue!;
                          });
                        }
                      : null,
                ),
                DropdownButton<String>(
                  value: resource[1],
                  items: resourceList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(fontSize: 12),
                      ),
                    );
                  }).toList(),
                  onChanged: enemies[1]
                      ? (String? newValue) {
                          setState(() {
                            resource[1] = newValue!;
                          });
                        }
                      : null,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton<String>(
                  value: relationship[2],
                  items:
                      enemiesList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(fontSize: 12),
                      ),
                    );
                  }).toList(),
                  onChanged: enemies[2]
                      ? (String? newValue) {
                          setState(() {
                            relationship[2] = newValue!;
                          });
                        }
                      : null,
                ),
                DropdownButton<String>(
                  value: cause[2],
                  items:
                      causeList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(fontSize: 12),
                      ),
                    );
                  }).toList(),
                  onChanged: enemies[2]
                      ? (String? newValue) {
                          setState(() {
                            cause[2] = newValue!;
                          });
                        }
                      : null,
                ),
                DropdownButton<String>(
                  value: resource[2],
                  items: resourceList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(fontSize: 12),
                      ),
                    );
                  }).toList(),
                  onChanged: enemies[2]
                      ? (String? newValue) {
                          setState(() {
                            resource[2] = newValue!;
                          });
                        }
                      : null,
                ),
              ],
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                setState(() {
                  presenter.model.character.lifepath.enemies =
                      numEnemies.toInt();
                  presenter.model.character.lifepath.enemy_desc = relationship;
                  presenter.model.character.lifepath.enemy_cause = cause;
                  presenter.model.character.lifepath.enemy_resource = resource;
                });
                Navigator.pushNamed(context, lifeGoalsRoute,
                    arguments: 'arguments/chose Templates');
              },
              child: const Text('Next'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back'),
            )
          ],
        ),
      ),
    );
  }
}

class LifeGoalsPage extends StatefulWidget {
  final String data;

  LifeGoalsPage(this.data);

  @override
  State<StatefulWidget> createState() => _lifeGoalsState();
}

class _lifeGoalsState extends State<LifeGoalsPage> {
  List<String> lifeGoalsList = LifeGoals;
  String lifeGoal = LifeGoals[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Life Goals: $lifeGoal'),
            DropdownButton<String>(
              value: lifeGoal,
              items:
                  lifeGoalsList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 20),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  lifeGoal = newValue!;
                });
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                setState(() {
                  if (lifeGoal.isEmpty) {
                    lifeGoal = lifeGoalsList[presenter.rand.nextInt(10) + 1];
                  }
                  presenter.model.character.lifepath.life_goals = lifeGoal;
                });
                Navigator.pushNamed(context, statsRoute,
                    arguments: 'arguments/chose Templates');
              },
              child: const Text('Next'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back'),
            )
          ],
        ),
      ),
    );
  }
}

class StatsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _statsState();
}

class _statsState extends State<StatsPage> {
  String role = presenter.model.character.role.toString();
  List<bool> _selections = List<bool>.filled(10, false);
  List<List<int>> matrix = [[]];
  List<int> stats = [];

  @override
  Widget build(BuildContext context) {
    switch (presenter.model.character.role[0].type) {
      case RoleType.ROCKERBOY:
        matrix = rockerboyM;
        break;
      case RoleType.EXEC:
        matrix = execM;
        break;
      case RoleType.FIXER:
        matrix = fixerM;
        break;
      case RoleType.LAWMAN:
        matrix = lawmanM;
        break;
      case RoleType.MEDIA:
        matrix = mediaM;
        break;
      case RoleType.MEDTECH:
        matrix = medtechM;
        break;
      case RoleType.NETRUNNER:
        matrix = netrunnerM;
        break;
      case RoleType.NOMAD:
        matrix = nomadM;
        break;
      case RoleType.SOLO:
        matrix = soloM;
        break;
      case RoleType.TECH:
        matrix = techM;
        break;
      default:
    }
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Stats: $role'),
            Column(
              children: [
                Text(
                    'INT    REF    DEX    TECH   COOL   WILL   LUCK   MOVE   BODY    EMP'),
                TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor:
                          _selections[0] ? Colors.red : Colors.white),
                  onPressed: () {
                    setState(() {
                      _selections.fillRange(0, _selections.length, false);
                      _selections[0] = true;
                      stats = matrix[0];
                    });
                  },
                  child: Text(matrix[0]
                      .toString()
                      .replaceAll(',', '          ')
                      .replaceAll('[', '')
                      .replaceAll(']', '')),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor:
                          _selections[1] ? Colors.red : Colors.white),
                  onPressed: () {
                    setState(() {
                      _selections.fillRange(0, _selections.length, false);
                      _selections[1] = true;
                      stats = matrix[1];
                    });
                  },
                  child: Text(matrix[1]
                      .toString()
                      .replaceAll(',', '          ')
                      .replaceAll('[', '')
                      .replaceAll(']', '')),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor:
                          _selections[2] ? Colors.red : Colors.white),
                  onPressed: () {
                    setState(() {
                      _selections.fillRange(0, _selections.length, false);
                      _selections[2] = true;
                      stats = matrix[2];
                    });
                  },
                  child: Text(matrix[2]
                      .toString()
                      .replaceAll(',', '          ')
                      .replaceAll('[', '')
                      .replaceAll(']', '')),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor:
                          _selections[3] ? Colors.red : Colors.white),
                  onPressed: () {
                    setState(() {
                      _selections.fillRange(0, _selections.length, false);
                      _selections[3] = true;
                      stats = matrix[3];
                    });
                  },
                  child: Text(matrix[3]
                      .toString()
                      .replaceAll(',', '          ')
                      .replaceAll('[', '')
                      .replaceAll(']', '')),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor:
                          _selections[4] ? Colors.red : Colors.white),
                  onPressed: () {
                    setState(() {
                      _selections.fillRange(0, _selections.length, false);
                      _selections[4] = true;
                      stats = matrix[4];
                    });
                  },
                  child: Text(matrix[4]
                      .toString()
                      .replaceAll(',', '          ')
                      .replaceAll('[', '')
                      .replaceAll(']', '')),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor:
                          _selections[5] ? Colors.red : Colors.white),
                  onPressed: () {
                    setState(() {
                      _selections.fillRange(0, _selections.length, false);
                      _selections[5] = true;
                      stats = matrix[5];
                    });
                  },
                  child: Text(matrix[5]
                      .toString()
                      .replaceAll(',', '          ')
                      .replaceAll('[', '')
                      .replaceAll(']', '')),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor:
                          _selections[6] ? Colors.red : Colors.white),
                  onPressed: () {
                    setState(() {
                      _selections.fillRange(0, _selections.length, false);
                      _selections[6] = true;
                      stats = matrix[6];
                    });
                  },
                  child: Text(matrix[6]
                      .toString()
                      .replaceAll(',', '          ')
                      .replaceAll('[', '')
                      .replaceAll(']', '')),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor:
                          _selections[7] ? Colors.red : Colors.white),
                  onPressed: () {
                    setState(() {
                      _selections.fillRange(0, _selections.length, false);
                      _selections[7] = true;
                      stats = matrix[7];
                    });
                  },
                  child: Text(matrix[7]
                      .toString()
                      .replaceAll(',', '          ')
                      .replaceAll('[', '')
                      .replaceAll(']', '')),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor:
                          _selections[8] ? Colors.red : Colors.white),
                  onPressed: () {
                    setState(() {
                      _selections.fillRange(0, _selections.length, false);
                      _selections[8] = true;
                      stats = matrix[8];
                    });
                  },
                  child: Text(matrix[8]
                      .toString()
                      .replaceAll(',', '          ')
                      .replaceAll('[', '')
                      .replaceAll(']', '')),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor:
                          _selections[9] ? Colors.red : Colors.white),
                  onPressed: () {
                    setState(() {
                      _selections.fillRange(0, _selections.length, false);
                      _selections[9] = true;
                      stats = matrix[9];
                    });
                  },
                  child: Text(matrix[9]
                      .toString()
                      .replaceAll(',', '          ')
                      .replaceAll('[', '')
                      .replaceAll(']', '')),
                ),
              ],
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                setState(() {
                  if (stats.isEmpty) {
                    stats = matrix[presenter.rand.nextInt(10)];
                  }
                  presenter.model.character.stats.initialize(stats);
                });
                Navigator.pushNamed(context, skillsRoute,
                    arguments: 'arguments/chose Templates');
              },
              child: const Text('Next'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back'),
            )
          ],
        ),
      ),
    );
  }
}

class SkillsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _skillsState();
}

class _skillsState extends State<SkillsPage> {
  String role = presenter.model.character.role.toString();
  Map matrix = rockerboySB;

  @override
  Widget build(BuildContext context) {
    switch (presenter.model.character.role[0].type) {
      case RoleType.ROCKERBOY:
        matrix = rockerboySB;
        break;
      case RoleType.EXEC:
        matrix = execSB;
        break;
      case RoleType.FIXER:
        matrix = fixerSB;
        break;
      case RoleType.LAWMAN:
        matrix = lawmanSB;
        break;
      case RoleType.MEDIA:
        matrix = mediaSB;
        break;
      case RoleType.MEDTECH:
        matrix = medtechSB;
        break;
      case RoleType.NETRUNNER:
        matrix = netrunnerSB;
        break;
      case RoleType.NOMAD:
        matrix = nomadSB;
        break;
      case RoleType.SOLO:
        matrix = soloSB;
        break;
      case RoleType.TECH:
        matrix = techSB;
        break;
      default:
    }
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //thing
            Text('Skills: $role'),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: matrix.entries.map((e) {
                  num number = e.value;
                  var w = Text(e.key + ': $number',
                      style: const TextStyle(fontSize: 18));
                  return w;
                }).toList()),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                setState(() {
                  matrix.forEach((key, value) {
                    presenter.model.character.skills
                        .addSkill(Skill(key, value));
                  });
                });
                Navigator.pushNamed(context, inventoryRoute,
                    arguments: 'arguments/chose Templates'); //changing
              },
              child: const Text('Next'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back'),
            )
          ],
        ),
      ),
    );
  }
}

class InventoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _inventoryState();
}

class _inventoryState extends State<InventoryPage> {
  String role = presenter.model.character.role.toString();
  Map matrix = rockerboySB;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Inventory'), //added
            Column(children: createItemList(rockerItems)),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                setState(() {
                  // Add all items to inventory
                });
                Navigator.pushNamed(context, editCharRoute,
                    arguments: 'arguments/chose Templates');
              },
              child: const Text('Next'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back'),
            )
          ],
        ),
      ),
    );
  }

  createItemList(Map<String, int> map) {
    var textFields = <Padding>[];
    var list = map.keys;

    list.forEach((element) {
      var textSegment;
      if (map[element] != 0) {
        textSegment = Padding(
            padding: EdgeInsets.only(bottom: 10), child: Text("$element"));
        // DropdownButton<String>(
        //       value: rockerItems,
        //       items:
        //           rockerItems.map<DropdownMenuItem<String>>((String value) {
        //         return DropdownMenuItem<String>(
        //           value: value,
        //           child: Text(
        //             value,
        //             style: const TextStyle(fontSize: 20),
        //           ),
        //         );
        //dropdown here
      } else {
        textSegment = Padding(
            padding: EdgeInsets.only(bottom: 10), child: Text("$element"));
      }
      return textFields.add(textSegment);
    });
    return textFields;
  }
}

class editChar extends StatelessWidget {
  final String data;

  editChar(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              presenter.model.character.name,
              style: const TextStyle(fontSize: 30),
              textAlign: TextAlign.left,
            ),
            Text(
                '${presenter.model.character.role[0]}: ${presenter.model.character.role[0].rank}',
                textAlign: TextAlign.left),
            Text(
                'HP: ${presenter.model.character.stats.HP}/${presenter.model.character.stats.HP}',
                textAlign: TextAlign.left),
            Text('INT: ${presenter.model.character.stats.INT}',
                textAlign: TextAlign.left),
            Text('REF: ${presenter.model.character.stats.REF}',
                textAlign: TextAlign.left),
            Text('DEX: ${presenter.model.character.stats.DEX}',
                textAlign: TextAlign.left),
            Text('TECH: ${presenter.model.character.stats.TECH}',
                textAlign: TextAlign.left),
            Text('COOL: ${presenter.model.character.stats.COOL}',
                textAlign: TextAlign.left),
            Text('WILL: ${presenter.model.character.stats.WILL}',
                textAlign: TextAlign.left),
            Text('LUCK: ${presenter.model.character.stats.LUCK}',
                textAlign: TextAlign.left),
            Text('MOVE: ${presenter.model.character.stats.MOVE}',
                textAlign: TextAlign.left),
            Text('BODY: ${presenter.model.character.stats.BODY}',
                textAlign: TextAlign.left),
            Text('EMP: ${presenter.model.character.stats.EMP}',
                textAlign: TextAlign.left),
            Text('Humanity: ${presenter.model.character.stats.HUM}',
                textAlign: TextAlign.left),
            Text('Initiative: +${presenter.model.character.stats.REF}',
                textAlign: TextAlign.left),
            Column(
                children:
                    presenter.model.character.skills.getMap().entries.map((e) {
              num number = e.value;
              var w = Text(e.key + ': $number',
                  style: const TextStyle(fontSize: 10),
                  textAlign: TextAlign.left);
              return w;
            }).toList()),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.pushNamed(context, homeRoute,
                    arguments: 'arguments/chose Templates');
              },
              child: const Text('Home'),
            )
          ],
        ),
      ),
    );
  }
}
