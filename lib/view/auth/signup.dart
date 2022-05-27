import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resolute_ai_assignment/view/auth/signin.dart';
import 'package:resolute_ai_assignment/view/widgets/button2.dart';
import 'package:resolute_ai_assignment/view/widgets/text_input_field.dart';
import 'package:sizer/sizer.dart';

import '../../constants.dart';
import '../utils/colors.dart';
import '../utils/style.dart';
import '../widgets/common_functions.dart';

class Signup extends StatelessWidget {
  Signup({Key? key}) : super(key: key);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 20.h),
        height: 100.h,
        width: 100.w,
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 13.h,
                width: 60.w,
                child: Column(
                  children: [
                    CommonFunctions.text(
                        'Life Long', black, 30, FontWeight.w800),
                    CommonFunctions.text(
                        'Lerner', themeColor, 45, FontWeight.w900),
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              TextInputField(
                labelText: 'Username / Email',
                controller: _emailController,
              ),
              TextInputField(
                labelText: 'Password',
                controller: _passwordController,
              ),
              SizedBox(
                height: 10.h,
              ),
              InkWell(
                  onTap: () {
                    if (_emailController.text.isNotEmpty &&
                        _passwordController.text.isNotEmpty) {
                      authController.registerUser(
                        _emailController.text,
                        _passwordController.text,
                      );
                    } else {
                      Get.snackbar('Credentials Missing',
                          'Please Fill all the Credentials',
                          overlayColor: themeColor);
                    }

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: CommonButton(label: 'SignUp')),
              SizedBox(
                height: 2.h,
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: 'Already have an account?',
                    style: bodySmall.copyWith(color: Colors.grey)),
                TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login())),
                    text: '\t\tSignIn',
                    style: bodySmall.copyWith(
                        fontWeight: FontWeight.w700, color: themeColor))
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
