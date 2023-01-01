import 'package:studio_app_flutter/bottomNavigation/bottomNavigationBar.dart';
import 'package:studio_app_flutter/constants.dart';
import 'package:studio_app_flutter/customize/my_flutter_app_icons.dart';
import 'package:studio_app_flutter/common/common.dart';
import 'package:studio_app_flutter/login/forgotPassword.dart';
import 'package:studio_app_flutter/login/signUpPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const String routeName = "/login-page";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  bool isObscure = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.15),
              AspectRatio(
                  aspectRatio: 2.5,
                  child:
                      SvgPicture.asset("asset/images/illustration/login.svg")),
              SizedBox(height: screenHeight * 0.047),
              const Text(
                "LOGIN",
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: fontFamily,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 50),
              commonTextField(context, _email, "Email/Phone No.",
                  MyFlutterApp.username, false),
              SizedBox(height: screenHeight * 0.041),
              SizedBox(
                width: screenWidth - screenWidth * 0.305,
                child: Stack(
                  children: [
                    Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        width: screenWidth - screenWidth * 0.305,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: placeholderColor,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _password,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Please fill this";
                        } else {
                          return null;
                        }
                      },
                      obscureText: isObscure,
                      decoration: InputDecoration(
                        errorStyle: const TextStyle(
                          height: 0.1,
                        ),
                        hintText: "Password",
                        hintStyle: const TextStyle(
                          fontSize: 15,
                          fontFamily: fontFamily,
                          color: placeholderTextColor,
                        ),
                        border: InputBorder.none,
                        prefixIcon: const Padding(
                          padding:
                              EdgeInsets.only(left: 20, right: 5, bottom: 8),
                          child: Icon(MyFlutterApp.lock,
                              color: Colors.black, size: 35),
                        ),
                        suffixIcon: isObscure
                            ? IconButton(
                                icon: const Icon(MyFlutterApp.show),
                                onPressed: () {
                                  setState(() {
                                    isObscure = !isObscure;
                                  });
                                },
                                iconSize: 20,
                                color: placeholderTextColor,
                              )
                            : IconButton(
                                icon: const Icon(MyFlutterApp.hide),
                                onPressed: () {
                                  setState(() {
                                    isObscure = !isObscure;
                                  });
                                },
                                iconSize: 28,
                                color: placeholderTextColor,
                              ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                width: screenWidth - screenWidth * 0.305,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ForgotPassword.routeName);
                  },
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontFamily: fontFamily,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              basicButton(
                  context, _formKey, BottomNavigationPage.routeName, "Login"),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: fontFamily,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.popAndPushNamed(context, SignupPage.routeName);
                    },
                    child: const Text("Sign up",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: fontFamily,
                          decoration: TextDecoration.underline,
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
