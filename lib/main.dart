import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/controllers/auth%20controllers/login_controller.dart';
import 'package:untitled2/controllers/cart%20contollers/cart_controller.dart';
import 'package:untitled2/controllers/fav_controller.dart';
import 'package:untitled2/controllers/onboarding_controller.dart';
import 'package:untitled2/views/Login/login.dart';
import 'package:untitled2/views/onBoarding/onboarding_screen.dart';

import 'controllers/auth controllers/signup_controller.dart';
import 'controllers/category_controller.dart';
import 'views/Custom Widgets/my_theme.dart';

void main() {

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  LoginController loginController = Get.put(LoginController(),);
  CategoryController categoryController = Get.put(CategoryController(),);
  CartController cartController = Get.put(CartController(),);
  FavController favController = Get.put(FavController(),);
  OnBoardingController onBoardingController = Get.put(OnBoardingController(),);
  SignUpController signUpController = Get.put(SignUpController(),);



   MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,

      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      title: 'Flutter FastFood App With GetX',
      home: OnBoardingScreen(),
    );
  }
}

