// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_print

import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:restaurantfoodappflutter/constants/constants.dart';
import 'package:restaurantfoodappflutter/controllers/restaurant_controller.dart';
import 'package:restaurantfoodappflutter/main.dart';
import 'package:restaurantfoodappflutter/models/api_error.dart';
import 'package:restaurantfoodappflutter/models/login_response.dart';
import 'package:restaurantfoodappflutter/models/restaurant_response.dart';
import 'package:restaurantfoodappflutter/views/auth/login_page.dart';
import 'package:restaurantfoodappflutter/views/auth/restaurant_registaration.dart';
import 'package:restaurantfoodappflutter/views/auth/verification_page.dart';
import 'package:restaurantfoodappflutter/views/auth/waiting_page.dart';
import 'package:restaurantfoodappflutter/views/home/home_page.dart';

class LoginController extends GetxController {
  final controller = Get.put(RestaurantController());
  final box = GetStorage();
  RestaurantResponse? restaurant;
  RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  set isLoading(bool value) => _isLoading.value = value;

  void logout() {
    box.erase();
    defaultHome = const Login();
    Get.offAll(() => defaultHome,
        transition: Transition.fadeIn,
        duration: const Duration(milliseconds: 900));
  }

  void loginFunc(String data) async {
    isLoading = true;

    var url = Uri.parse('$appBaseUrl/login');

    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    try {
      var response = await http.post(url, body: data, headers: headers);

      if (response.statusCode == 200) {
        var data = loginResponseFromJson(response.body);

        box.write(data.id, json.encode(data));
        box.write('userId', data.id);
        box.write('accessToken', data.userToken);
        box.write('e-verification', data.verification);
        print('userId: ' + data.id);
        print('accessToken: ' + data.userToken);
        if (data.verification == false) {
          Get.snackbar(
            'Verification',
            "Please verify your email",
            backgroundColor: kPrimary,
            colorText: kLightWhite,
          );

          Get.offAll(
            () => const VerificationPage(),
            transition: kTransition,
            duration: kDuration,
          );
        } else if (data.verification == true && data.userType == 'Client') {
          defaultHome = const Login();
          Get.offAll(
            () => const RestaurantRegistration(),
            transition: kTransition,
            duration: kDuration,
          );
        } else if (data.verification == true && data.userType == 'Vendor') {
          getVendorInfo(data.userToken, data.id);
        }
        isLoading = false;
      } else {
        var data = apiErrorFromJson(response.body);
        Get.snackbar(
          'Login Failed',
          data.message,
          backgroundColor: kPrimary,
          colorText: kLightWhite,
        );
        isLoading = false;
      }
    } catch (e) {
      isLoading = false;

      Get.snackbar(
        'Login Failed',
        e.toString(),
        backgroundColor: kPrimary,
        colorText: kLightWhite,
      );
    }
  }

  LoginResponse? getUserData() {
    String? id = box.read('userId');

    if (id != null) {
      return loginResponseFromJson(box.read(id));
    } else {
      return null;
    }
  }

  void getVendorInfo(String accessToken, String userId) async {
    isLoading = true;

    var url = Uri.parse('$appBaseUrl/api/restaurant/owner/profile/$userId');

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };

    try {
      var response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        RestaurantResponse restaurantData =
            restaurantResponseFromJson(response.body);
        restaurant = restaurantData;
        controller.restaurant = restaurantData;

        box.write("restaurantId", restaurantData.id);
        print("restaurantId:  " + restaurantData.id);
        box.write("verification", restaurantData.verification);

        String data = restaurantResponseToJson(restaurantData);

        box.write(restaurantData.id, data);

        if (restaurantData.verification != "Verified") {
          Get.offAll(() => const WaitingPage(),
              transition: kTransition, duration: kDuration);
        } else {
          defaultHome = const HomePage();
          Get.to(() => const HomePage(),
              transition: kTransition, duration: kDuration);
        }

        isLoading = false;
      } else {
        var data = apiErrorFromJson(response.body);
        Get.snackbar(
          'Opps Failed',
          data.message,
          backgroundColor: kPrimary,
          colorText: kLightWhite,
        );
        isLoading = false;
      }
    } catch (e) {
      isLoading = false;

      Get.snackbar(
        'Login Failed',
        e.toString(),
        backgroundColor: kPrimary,
        colorText: kLightWhite,
      );
    }
  }
}
