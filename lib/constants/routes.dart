import 'package:flutter/material.dart';
import 'package:furniture_app/screens/category_screen.dart';
import 'package:furniture_app/screens/home_screen.dart';
import 'package:furniture_app/screens/login_screen.dart';
import 'package:furniture_app/screens/signup_screen.dart';
import 'package:get/get.dart';

class Routes {
  static const homeScreen = '/homeScreen';
  static const loginScreen = '/loginScreen';
  static const signupScreen = '/signupScreen';
  static const categoryScreen = '/categoryScreen';

  static getInitialRoute() {
    return homeScreen;
  }

  static getPages() {
    return [
      GetPage(
        name: homeScreen,
        page: () => const HomeScreen(),
      ),
      GetPage(
        name: loginScreen,
        page: () => LoginScreen(),
      ),
      GetPage(
        name: signupScreen,
        page: () => SignupScreen(),
      ),
      GetPage(
        name: categoryScreen,
        page: () => CategoryScreen(),
      ),
    ];
  }
}
