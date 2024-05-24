import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurantfoodappflutter/common/home_tile.dart';
import 'package:restaurantfoodappflutter/constants/constants.dart';
import 'package:restaurantfoodappflutter/views/add_foods/add_foods.dart';
import 'package:restaurantfoodappflutter/views/food/food_list.dart';

class HomeTiles extends StatelessWidget {
  const HomeTiles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.w),
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      height: 70.h,
      decoration: BoxDecoration(
        color: kOffWhite,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 8.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HomeTile(
                onTap: () {
                  Get.to(() => const AddFoods(),
                      transition: Transition.fadeIn,
                      duration: const Duration(milliseconds: 900));
                },
                text: "Thêm thức uống",
                iconPath:
                    "https://res.cloudinary.com/dijk9w0jo/image/upload/v1716525939/qbfknadzzra5ohcnfrag.png"),
            HomeTile(
                onTap: () {},
                text: "Cái ví",
                iconPath:
                    "https://res.cloudinary.com/dp2bicmif/image/upload/v1716562680/budwmewmpmjtmwpc2ztq.jpg"),
            HomeTile(
                onTap: () {
                  Get.to(() => const FoodList(),
                      transition: Transition.fadeIn,
                      duration: const Duration(milliseconds: 900));
                },
                text: "Thức uống",
                iconPath:
                    "https://res.cloudinary.com/dp2bicmif/image/upload/v1716562883/erravrutwyyorsi588ej.png"),
            HomeTile(
                onTap: () {},
                text: "Tự giao hàng",
                iconPath:
                    "https://res.cloudinary.com/dp2bicmif/image/upload/v1716562738/i5jddvt8jfxermi9fkzv.png"),
          ],
        ),
      ),
    );
  }
}
