import 'dart:math';


class RandomAge {

  static getRandomAge() {

    int min = 18;
    int max = 60; 
    int randomNum = min + Random().nextInt((max + 1) - min);

    return randomNum;
  }
}