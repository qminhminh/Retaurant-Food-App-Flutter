import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurantfoodappflutter/common/app_style.dart';
import 'package:restaurantfoodappflutter/common/reusable_text.dart';
import 'package:restaurantfoodappflutter/constants/constants.dart';

class ImageUploads extends StatelessWidget {
  const ImageUploads({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: hieght,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16.w, top: 12.h, bottom: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(
                      text: "Upload Images",
                      style: appStyle(16, kGray, FontWeight.w600)),
                  ReusableText(
                      text:
                          "You are requried to upload at least 2 images to proceed",
                      style: appStyle(11, kGray, FontWeight.normal)),
                ],
              ),
            ),
            SizedBox(
              height: hieght * 0.8,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 120.h,
                          width: width / 2.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(color: kGrayLight),
                          ),
                          child: Center(
                            child: ReusableText(
                                text: "Upload Image",
                                style: appStyle(16, kDark, FontWeight.w600)),
                          ),
                        ),
                        Container(
                          height: 120.h,
                          width: width / 2.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(color: kGrayLight),
                          ),
                          child: Center(
                            child: ReusableText(
                                text: "Upload Image",
                                style: appStyle(16, kDark, FontWeight.w600)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 120.h,
                          width: width / 2.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(color: kGrayLight),
                          ),
                          child: Center(
                            child: ReusableText(
                                text: "Upload Image",
                                style: appStyle(16, kDark, FontWeight.w600)),
                          ),
                        ),
                        Container(
                          height: 120.h,
                          width: width / 2.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(color: kGrayLight),
                          ),
                          child: Center(
                            child: ReusableText(
                                text: "Upload Image",
                                style: appStyle(16, kDark, FontWeight.w600)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
