import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:otp_text_field_v2/otp_text_field_v2.dart';
import 'package:restaurantfoodappflutter/common/app_style.dart';
import 'package:restaurantfoodappflutter/common/custom_button.dart';
import 'package:restaurantfoodappflutter/common/reusable_text.dart';
import 'package:restaurantfoodappflutter/constants/constants.dart';
import 'package:restaurantfoodappflutter/controllers/email_veication_controller.dart';
import 'package:restaurantfoodappflutter/controllers/login_controller.dart';
import 'package:restaurantfoodappflutter/models/login_response.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  OtpFieldControllerV2 otpController = OtpFieldControllerV2();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EmailVerificationController());
    final userController = Get.put(LoginController());
    LoginResponse? user = userController.getUserData();

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        children: [
          SizedBox(
            height: 100.h,
          ),
          Lottie.asset('assets/anime/empty.json'),
          SizedBox(
            height: 30.h,
          ),
          ReusableText(
            text: "Xác thực tài khoản của bạn",
            style: appStyle(20, kPrimary, FontWeight.bold),
          ),
          Text(
            "Nhập mã được gửi đến email của bạn, nếu bạn không gửi nhận mã, nhấp vào Resend",
            style: appStyle(10, kGrayLight, FontWeight.normal),
          ),
          SizedBox(
            height: 20.h,
          ),
          OTPTextFieldV2(
              controller: otpController,
              length: 6,
              autoFocus: true,
              width: MediaQuery.of(context).size.width,
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldWidth: 45,
              outlineBorderRadius: 15,
              style: const TextStyle(fontSize: 17),
              onCompleted: (pin) {
                controller.setCode(pin);
                controller.verifyEmail(pin);
              }),
          SizedBox(
            height: 20.h,
          ),
          CustomButton(
            onTap: () {
              controller.verifyEmail(controller.code);
            },
            btnColor: kPrimary,
            text: "Xác nhận tài khoản",
            btnHieght: 40.h,
          ),
          SizedBox(
            height: 30.h,
          ),
          Text(
            "Email đã được gửi đến ${user!.email}. Nếu email không chính xác, vui lòng xóa tài khoản này và tạo một tài khoản mới với email chính xác.Ngoài ra, bạn có thể đăng xuất và trình duyệt ứng dụng mà không cần tài khoản.",
            textAlign: TextAlign.justify,
            style: appStyle(10, kGray, FontWeight.normal),
          ),
          SizedBox(
            height: 15.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  userController.logout();
                },
                child: ReusableText(
                  text: "Đăng xuất",
                  style: appStyle(12, kSecondary, FontWeight.w600),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // userController.deleteAccount();
                },
                child: ReusableText(
                  text: "Xóa tài khoản",
                  style: appStyle(12, kRed, FontWeight.w600),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
