//Random number generate d10 and d10 with modifier
import 'dart:math';

import 'package:cybersheet/model/model.dart';

import '../constants.dart';

class Presenter {
  Random rand = new Random();
  Model model = new Model();
  String globalDropDown = '';
  String saveNotes = '';

  Presenter();

  int rollMod(int modifier) {
    int randNum = rand.nextInt(10) + 1 + modifier;
    return randNum;
  }

  void addRole(RoleType role, int rank) {
    model.character.role = [];
    model.character.role.add(new Role(role, rank));
  }
}
