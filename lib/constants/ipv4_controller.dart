// ignore_for_file: prefer_final_fields

import 'package:get/get.dart';

class Ipv4Controller extends GetxController {
  RxString _ipv4 = ''.obs;
  String get ipv4Value => _ipv4.value;

  set updateIpv4Value(String value) => _ipv4.value = value;
}
