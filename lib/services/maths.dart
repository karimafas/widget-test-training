import 'dart:math';

class Maths {
  static random(min, max) {
    var rn = Random();
    return min + rn.nextInt(max - min);
  }
}
