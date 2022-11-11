//Random number generate d10 and d10 with modifier
import 'dart:math';

class Presenter {
  Random rand = new Random();

  Presenter();

  int rollMod(int modifier) {
    int randNum = rand.nextInt(10) + 1 + modifier;
    return randNum;
  }
}
