import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furniture_app/constants/app_images.dart';
import 'package:furniture_app/constants/colors.dart';
import 'package:furniture_app/constants/font_constants.dart';
import 'package:furniture_app/constants/routes.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupScreen extends StatelessWidget {
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordController2 = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                opacity: 0.04,
                image: AssetImage(
                  AppImages.signupBackground,
                ),
                //fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        padding: EdgeInsets.all(2.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          //color: ColorConstants.orange.withOpacity(0.3),
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios,
                        ),
                      ),
                    ),
                    Text(
                      'SignUp',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    Container(
                      height: 18.h,
                      width: 40.w,
                      margin: EdgeInsets.only(
                        left: 23.5.w,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(100.w),
                        ),
                      ),
                    ),
                  ],
                ),
                Image.asset(
                  AppImages.logo,
                  height: 10.h,
                ),
                SizedBox(
                  height: 3.h,
                ),
                SizedBox(
                  width: 95.w,
                  child: TextField(
                    controller: userNameController,
                    decoration: const InputDecoration(
                      hintText: 'Username',
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(
                  width: 95.w,
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      hintText: 'Email',
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(
                  width: 95.w,
                  child: TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      hintText: 'Phone No.',
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(
                  width: 95.w,
                  child: TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      hintText: 'Password',
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(
                  width: 95.w,
                  child: TextField(
                    controller: passwordController2,
                    decoration: const InputDecoration(
                      hintText: 'Re-enter Password',
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (userNameController.text.isEmpty ||
                        emailController.text.isEmpty ||
                        passwordController.text.isEmpty ||
                        passwordController2.text.isEmpty ||
                        phoneController.text.isEmpty) {
                      Alert(buttons: [
                        DialogButton(
                          color: ColorConstants.orange,
                          child: const Text('Cancel'),
                          onPressed: () => Get.back(),
                        )
                      ], context: context, desc: "All fields are required")
                          .show();
                    } else if (passwordController.text.length <= 7) {
                      Alert(
                              buttons: [
                            DialogButton(
                              color: ColorConstants.orange,
                              child: const Text('Cancel'),
                              onPressed: () => Get.back(),
                            )
                          ],
                              context: context,
                              desc:
                                  "Password must contain atleast 8 characters")
                          .show();
                    } else if (passwordController.text !=
                        passwordController2.text) {
                      Alert(buttons: [
                        DialogButton(
                          color: ColorConstants.orange,
                          child: const Text('Cancel'),
                          onPressed: () => Get.back(),
                        )
                      ], context: context, desc: "Passwords didn\'t match")
                          .show();
                    } else {
                      emailController.text.removeAllWhitespace;

                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text,
                      )
                          .then((value) {
                        FirebaseFirestore.instance
                            .collection('users')
                            .doc(value.user?.uid)
                            .set({
                          'username': userNameController.text,
                          'phoneNo': phoneController.text,
                        });
                      });
                      Alert(buttons: [
                        DialogButton(
                            color: ColorConstants.orange,
                            child: const Text('Cancel'),
                            onPressed: () {
                              userNameController.clear();
                              emailController.clear();
                              passwordController2.clear();
                              passwordController.clear();
                              phoneController.clear();
                              Get.back();
                            }),
                        DialogButton(
                            color: ColorConstants.orange,
                            child: const Text('Login'),
                            onPressed: () {
                              Get.toNamed(Routes.loginScreen);
                            }),
                      ], context: context, desc: "Succesfully Registered!")
                          .show();
                    }
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: ColorConstants.white,
                      fontFamily: Fonts.ProximaNovaRegular,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an Account?'),
                    TextButton(
                      onPressed: () => Get.toNamed(Routes.loginScreen),
                      child: const Text('Login'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
