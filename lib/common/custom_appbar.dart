import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurantfoodappflutter/common/app_style.dart';
import 'package:restaurantfoodappflutter/common/reusable_text.dart';
import 'package:restaurantfoodappflutter/constants/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurantfoodappflutter/controllers/login_controller.dart';
import 'package:restaurantfoodappflutter/controllers/restaurant_controller.dart';
import 'package:restaurantfoodappflutter/views/auth/waiting_page.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RestaurantController());
    final userController = Get.put(LoginController());
    controller.getRestuarantData();
    return Container(
      width: width,
      height: 130.h,
      padding: EdgeInsets.fromLTRB(12.w, 45.h, 12.w, 0),
      color: kPrimary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  userController.logout();
                },
                child: CircleAvatar(
                  radius: 20.r,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(controller.restaurant!.logoUrl),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                        text: controller.restaurant!.title,
                        style: appStyle(14, Colors.white, FontWeight.bold)),
                    SizedBox(
                      width: width * 0.7,
                      child: Text(controller.restaurant!.coords.address,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: appStyle(12, Colors.white, FontWeight.normal)),
                    ),
                  ],
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Get.to(() => const WaitingPage());
            },
            child: SvgPicture.asset(
              'assets/icons/open_sign.svg',
              height: 35.h,
              width: 35.w,
            ),
          )
        ],
      ),
    );
  }
}
