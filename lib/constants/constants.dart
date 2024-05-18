import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

String googleApiKey = 'AIzaSyDuDxriw8CH8NbVLiXtKFQ2Nb64AoRSdyg';

const kPrimary = Color(0xFF30b9b2);
const kPrimaryLight = Color(0xFF40F3EA);
const kSecondary = Color(0xffffa44f);
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

const String appBaseUrl = "http://192.168.1.9:3000";

List<String> orderList = [
  "New Orders",
  "Preparing",
  "Ready",
  "Picked Up",
  "Self Deliveries",
  "Delivered",
  "Cancelled"
];

Transition? kTransition = Transition.fadeIn;
Duration? kDuration = const Duration(milliseconds: 900);
