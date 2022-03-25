import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/constants/app_images.dart';
import 'package:furniture_app/constants/colors.dart';
import 'package:furniture_app/constants/font_constants.dart';
import 'package:furniture_app/constants/routes.dart';
import 'package:furniture_app/controller%20/login_controller.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final firestoreInstance = FirebaseFirestore.instance;
  Map<String, dynamic> dataList = {};
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    CollectionReference furniture =
        FirebaseFirestore.instance.collection('furnitureapp');
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                opacity: 0.04,
                fit: BoxFit.cover,
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
                      'Login',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    Container(
                      height: 18.h,
                      width: 40.w,
                      margin: EdgeInsets.only(
                        left: 30.w,
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
                  height: 16.h,
                ),
                SizedBox(
                  height: 7.h,
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
                  height: 5.h,
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
                  height: 5.h,
                ),
                ElevatedButton(
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: ColorConstants.white,
                      fontFamily: Fonts.ProximaNovaRegular,
                    ),
                  ),
                  onPressed: () {
                    bool check = true;
                    if (emailController.text.isEmpty &&
                        passwordController.text.isEmpty) {
                      Alert(
                              buttons: [
                            DialogButton(
                              color: ColorConstants.orange,
                              child: const Text('Cancel'),
                              onPressed: () => Get.back(),
                            )
                          ],
                              context: context,
                              desc: 'Enter Email and Password to Login')
                          .show();
                    } else if (emailController.text.isEmpty) {
                      Alert(buttons: [
                        DialogButton(
                          color: ColorConstants.orange,
                          child: const Text('Cancel'),
                          onPressed: () => Get.back(),
                        )
                      ], context: context, desc: "You didn\'t enter Email.")
                          .show();
                    } else if (passwordController.text.isEmpty) {
                      Alert(
                              buttons: [
                            DialogButton(
                              color: ColorConstants.orange,
                              child: const Text('Cancel'),
                              onPressed: () => Get.back(),
                            ),
                          ],
                              context: context,
                              desc: "You didn\'t entered password.")
                          .show();
                    } else if (!emailController.text.isEmail) {
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
                                  "You entered wrong email. Please correct it or remove white spaces")
                          .show();
                    } else {
                      controller.createUser(emailController.text,passwordController.text);
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an Account?'),
                    TextButton(
                      onPressed: () => Get.toNamed(Routes.signupScreen),
                      child: const Text('Signup'),
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
