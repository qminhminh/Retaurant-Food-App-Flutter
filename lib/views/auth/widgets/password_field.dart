import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:restaurantfoodappflutter/common/app_style.dart';
import 'package:restaurantfoodappflutter/constants/constants.dart';
import 'package:restaurantfoodappflutter/controllers/password_controller.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    Key? key,
    required this.controller,
    this.focusNode,
  }) : super(key: key);

  final TextEditingController controller;
  final FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    final passwordController = Get.put(PasswordController());
    return Obx(
      () => Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: TextFormField(
          cursorColor: Colors.black,
          textInputAction: TextInputAction.next,
          focusNode: focusNode,
          keyboardType: TextInputType.visiblePassword,
          controller: controller,
          obscureText: passwordController.password,
          validator: (value) {
            if (value!.isEmpty) {
              return "Vui lòng nhập mật khẩu hợp lệ";
            } else {
              return null;
            }
          },
          style: appStyle(12, kDark, FontWeight.normal),
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: () {
                passwordController.setPassword();
              },
              child: Icon(
                passwordController.password
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: kGrayLight,
              ),
            ),
            hintText: 'Mật khẩu ',
            prefixIcon: const Icon(
              CupertinoIcons.lock_circle,
              color: kGrayLight,
              size: 26,
            ),
            isDense: true,
            contentPadding: const EdgeInsets.all(6),
            hintStyle: appStyle(12, kGray, FontWeight.normal),
            // contentPadding: EdgeInsets.only(left: 24),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 0.5),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: kPrimary, width: 0.5),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: kRed, width: 0.5),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: kGray, width: 0.5),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: kGray, width: 0.5),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: kPrimary, width: 0.5),
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
