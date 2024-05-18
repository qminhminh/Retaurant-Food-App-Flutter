// ignore_for_file: prefer_final_fields

import 'dart:math';

import 'package:get/get.dart';
import 'package:restaurantfoodappflutter/models/additives_model.dart';

class FoodController extends GetxController {
  String _category = '';

  String get category => _category;

  set setCategory(String newValue) {
    _category = newValue;
  }

  RxList<String> _types = <String>[].obs;

  RxList<String> get types => _types;

  set setTypes(String newValue) {
    _types.add(newValue);
  }

  int generateId() {
    int min = 0;
    int max = 10000;

    return min + Random().nextInt(max - min);
  }

  RxList<Additive> _additivesList = <Additive>[].obs;

  RxList<Additive> get additivesList => _additivesList;

  set addAdditive(Additive newValue) {
    _additivesList.add(newValue);
  }

  void clearAdditives() {
    _additivesList.clear();
  }

  RxList<String> _tags = <String>[].obs;

  RxList<String> get tags => _tags;

  set setTags(String newValue) {
    _tags.add(newValue);
  }
}
