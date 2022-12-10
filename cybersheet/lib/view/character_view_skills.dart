import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:tabbed_view/tabbed_view.dart';

class CharacterSkills extends StatefulWidget {
  const CharacterSkills({super.key});
  // ignore: non_constant_identifier_names
  //TabbedViewExample(),

  @override
  State<StatefulWidget> createState() => _CharacterSkillsState();
}

class _CharacterSkillsState extends State<CharacterSkills> {
  List<String> environmentList = ChildhoodEnvironment;
  String environment = ChildhoodEnvironment[0];
  late TabbedViewController _controller;
  List<String> crisisList = FamilyCrisis;
  String crisis = FamilyCrisis[0];

  @override
  void initState() {
    super.initState();
    List<TabData> tabs = [];

    tabs.add(TabData(
        text: 'Awareness',
        content: Padding(child: Text('Hello'), padding: EdgeInsets.all(8))));
    tabs.add(TabData(
        text: 'Body',
        content:
            Padding(child: Text('Hello again'), padding: EdgeInsets.all(8))));
    tabs.add(TabData(
        closable: false,
        text: 'Control',
        content: Padding(
            child: TextField(
                decoration: InputDecoration(
                    isDense: true, border: OutlineInputBorder())),
            padding: EdgeInsets.all(8)),
        keepAlive: true));
    tabs.add(TabData(
        text: 'Education',
        content:
            Padding(child: Text('Hello again'), padding: EdgeInsets.all(8))));
    tabs.add(TabData(
        text: 'Fighting',
        content:
            Padding(child: Text('Hello again'), padding: EdgeInsets.all(8))));
    tabs.add(TabData(
        text: 'Preformance',
        content:
            Padding(child: Text('Hello again'), padding: EdgeInsets.all(8))));
    tabs.add(TabData(
        text: 'Ranged Weapon',
        content:
            Padding(child: Text('Hello again'), padding: EdgeInsets.all(8))));
    tabs.add(TabData(
        text: 'Technique',
        content:
            Padding(child: Text('Hello again'), padding: EdgeInsets.all(8))));

    _controller = TabbedViewController(tabs);
  }

  @override
  Widget build(BuildContext context) {
    TabbedView tabbedView = TabbedView(controller: _controller);
    Widget w =
        TabbedViewTheme(child: tabbedView, data: TabbedViewThemeData.mobile());
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage("Cyberwire.png"),
        fit: BoxFit.cover,
      )),
      child: w,
      padding: EdgeInsets.all(32),
    );
  }
}
