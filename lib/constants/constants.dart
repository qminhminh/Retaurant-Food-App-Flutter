import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurantfoodappflutter/constants/ipv4_controller.dart';

String googleApiKey = 'AIzaSyDuDxriw8CH8NbVLiXtKFQ2Nb64AoRSdyg';
final controller = Get.find<Ipv4Controller>();
const kPrimary = Color.fromARGB(255, 240, 185, 96);
const kPrimaryLight = Color(0xFF40F3EA);
const kSecondary = Color.fromARGB(255, 163, 83, 7);
const kSecondaryLight = Color(0xFFffe5db);
const kTertiary = Color(0xff0078a6);
const kGray = Color(0xff83829A);
const kGrayLight = Color(0xffC1C0C8);
const kLightWhite = Color(0xffFAFAFC);
const kWhite = Color(0xfffFFFFF);
const kDark = Color(0xff000000);
const kRed = Color(0xffe81e4d);
const kOffWhite = Color(0xffF3F4F8);

double hieght = 926.h;
double width = 428.w;

String appBaseUrl = "http://${controller.ipv4Value}:3000";

List<String> orderList = [
  "Đơn hàng mới",
  "Chuẩn bị",
  "Sẵn sàng",
  "Nhặt lên",
  "Tự giao hàng ",
  "Đã giao hàng",
  "Bị hủy bỏ"
];

Transition? kTransition = Transition.fadeIn;
Duration? kDuration = const Duration(milliseconds: 900);
