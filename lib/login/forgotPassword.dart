import 'package:studio_app_flutter/constants.dart';
import 'package:studio_app_flutter/customize/my_flutter_app_icons.dart';
import 'package:studio_app_flutter/common/common.dart';
import 'package:studio_app_flutter/login/verifyMobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({Key? key}) : super(key: key);

  static const String routeName = "/forgot-password";

  final TextEditingController _phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: 2.4,
              child: SvgPicture.asset(
                  "asset/images/illustration/forgot_password.svg"),
            ),
            const SizedBox(height: 30),
            const Text(
              "Forgot Password",
              style: TextStyle(
                fontSize: 37,
                fontFamily: fontFamily,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Message sent on registered mobile\nnumber.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF979797),
                fontFamily: fontFamily,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 80),
            commonTextField(
                context, _phone, "Phone No.", MyFlutterApp.call, false),
            const SizedBox(height: 60),
            longBasicButton(context, VerifyMobile.routeName, "Verify"),
          ],
        ),
      ),
    );
  }
}
