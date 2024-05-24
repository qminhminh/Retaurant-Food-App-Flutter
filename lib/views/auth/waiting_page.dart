import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurantfoodappflutter/common/app_style.dart';
import 'package:restaurantfoodappflutter/common/background_container.dart';
import 'package:restaurantfoodappflutter/common/reusable_text.dart';
import 'package:restaurantfoodappflutter/constants/constants.dart';
import 'package:restaurantfoodappflutter/controllers/restaurant_controller.dart';
import 'package:restaurantfoodappflutter/views/auth/login_page.dart';

class WaitingPage extends StatelessWidget {
  const WaitingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final restaurantController = Get.put(RestaurantController());
    restaurantController.restaurant = restaurantController.getRestuarantData();

    return Scaffold(
      body: BackGroundContainer(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.fromLTRB(24.w, 200.h, 24.w, 0),
          child: ListView(
            children: [
              Lottie.asset('assets/anime/empty.json'),
              ReusableText(
                text: restaurantController.restaurant!.title,
                style: appStyle(18, kPrimary, FontWeight.bold),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ReusableText(
                    text:
                        "Trạng thái: ${restaurantController.restaurant!.verification}",
                    style: appStyle(14, kGray, FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(
                        () => const Login(),
                      );
                    },
                    child: ReusableText(
                      text: "Thử đăng nhập",
                      style: appStyle(14, kTertiary, FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                width: width * 0.8,
                child: Text(
                  restaurantController.restaurant!.verificationMessage,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                    color: kGray,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
