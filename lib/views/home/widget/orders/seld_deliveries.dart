import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurantfoodappflutter/constants/constants.dart';

class SelfDeliveries extends StatelessWidget {
  const SelfDeliveries({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: kGrayLight.withOpacity(0.3),
      ),
    );
  }
}
