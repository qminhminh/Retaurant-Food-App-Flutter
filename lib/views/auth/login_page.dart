import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:restaurantfoodappflutter/common/app_style.dart';
import 'package:restaurantfoodappflutter/common/custom_button.dart';
import 'package:restaurantfoodappflutter/constants/constants.dart';
import 'package:restaurantfoodappflutter/controllers/login_controller.dart';
import 'package:restaurantfoodappflutter/models/login_request.dart';
import 'package:restaurantfoodappflutter/views/auth/registration.dart';
import 'package:restaurantfoodappflutter/views/auth/widgets/email_textfield.dart';
import 'package:restaurantfoodappflutter/views/auth/widgets/password_field.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController();

  final FocusNode _passwordFocusNode = FocusNode();
  final _loginFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  bool validateAndSave() {
    final form = _loginFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          padding: EdgeInsets.only(top: 5.w),
          height: 50.h,
          child: Center(
            child: Text(
              "Đồ uống",
              style: appStyle(24, kPrimary, FontWeight.bold),
            ),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 30.h,
          ),
          Lottie.asset('assets/anime/empty.json'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: _loginFormKey,
              child: Column(
                children: [
                  //email
                  EmailTextField(
                    focusNode: _passwordFocusNode,
                    hintText: "E-mail",
                    controller: _emailController,
                    prefixIcon: Icon(
                      CupertinoIcons.mail,
                      color: Theme.of(context).dividerColor,
                      size: 20.h,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onEditingComplete: () =>
                        FocusScope.of(context).requestFocus(_passwordFocusNode),
                  ),

                  SizedBox(
                    height: 25.h,
                  ),

                  PasswordField(
                    controller: _passwordController,
                    focusNode: _passwordFocusNode,
                  ),

                  SizedBox(
                    height: 6.h,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const RegistrationPage());
                          },
                          child: Text('Đăng ký',
                              style: appStyle(
                                  12, Colors.black, FontWeight.normal)),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 12.h,
                  ),

                  Obx(
                    () => controller.isLoading
                        ? const Center(
                            child: CircularProgressIndicator.adaptive(
                            backgroundColor: kPrimary,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(kLightWhite),
                          ))
                        : CustomButton(
                            btnHieght: 37.h,
                            btnColor: kPrimary,
                            text: "ĐĂNG NHẬP",
                            onTap: () {
                              LoginRequest model = LoginRequest(
                                  email: _emailController.text,
                                  password: _passwordController.text);

                              String authData = loginRequestToJson(model);

                              controller.loginFunc(authData);
                            }),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
