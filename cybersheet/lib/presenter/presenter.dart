//Random number generate d10 and d10 with modifier
import 'dart:math';

import 'package:cybersheet/model/model.dart';

class Presenter {
  Random rand = new Random();
  Model model = new Model();

  Presenter();

  int rollMod(int modifier) {
    int randNum = rand.nextInt(10) + 1 + modifier;
    return randNum;
  }
}
