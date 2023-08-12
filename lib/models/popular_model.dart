import 'dart:core';

class PopularDietModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calories;
  bool boxIsSelected;

  PopularDietModel(
      {required this.name,
      required this.iconPath,
      required this.level,
      required this.duration,
      required this.calories,
      required this.boxIsSelected});

  static List<PopularDietModel> getPopularDiet() {
    List<PopularDietModel> popularDiet = [];

    popularDiet.add(PopularDietModel(
        name: 'Blueberry Pancake',
        iconPath: 'assets/icons/blueberry-pancake.svg',
        level: 'Medium',
        duration: '30mins',
        calories: '230Cal',
        boxIsSelected: true));

    popularDiet.add(PopularDietModel(
        name: 'Salmon Nigiri',
        iconPath: 'assets/icons/salmon-nigiri.svg',
        level: 'Medium',
        duration: '20mins',
        calories: '120Cal',
        boxIsSelected: false));

    return popularDiet;
  }
}
