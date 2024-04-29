import 'dart:math';


class RandomProfession {

  static getRandomProfession() {
    final List<String> professionsList = [
      'FullStack Developer',
      'pilot',
      'cook',
      'architect',
      'artist',
      'carpenter',
    ];

    String randomProfession = professionsList[Random().nextInt(5)];
    return randomProfession;
  }

  /* static (String, int) setRandomProfession() {
    final List<String> professionsList = [
      'pilot',
      'cook',
      'architect',
      'artist',
      'carpenter',
    ];
    String randomProfession = professionsList[Random().nextInt(5)];

    return (randomProfession, 1);

    // call..... final ( setProfession, numProfessions) = RandomProfession.setRandomProfession();
    // print(setProfession);
    // print(numProfessions);
  } */
}