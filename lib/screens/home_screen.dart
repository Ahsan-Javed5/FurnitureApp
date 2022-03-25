import 'package:flutter/material.dart';
import 'package:furniture_app/constants/routes.dart';
import 'package:get/get.dart';
import 'package:furniture_app/constants/colors.dart';
import 'package:furniture_app/constants/font_constants.dart';
import 'package:furniture_app/widgets/home_animation.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HomeAnimation(),
          SizedBox(
            height: 5.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () => Get.toNamed(Routes.loginScreen),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: ColorConstants.white,
                    fontFamily: Fonts.ProximaNovaRegular,
                  ),
                ),
              ),
              OutlinedButton(
                onPressed: () => Get.toNamed(Routes.signupScreen),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    color: ColorConstants.black,
                    fontFamily: Fonts.ProximaNovaRegular,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
