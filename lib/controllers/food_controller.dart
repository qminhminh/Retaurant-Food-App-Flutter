// ignore_for_file: avoid_print

import 'package:get/get.dart';

class FoodController extends GetxController {
  String _category = '';

  String get category => _category;

  set setCategory(String newValue) {
    _category = newValue;
    print(category);
  }
}
