import 'dart:math';

int randomInt(int min, int max) {
  return min + Random().nextInt(max - min);
}