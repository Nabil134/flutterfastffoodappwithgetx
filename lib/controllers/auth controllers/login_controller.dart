import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/views/homeview/homepage.dart';

import '../../views/Sign up/signup.dart';

class LoginController extends GetxController{
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();
  var isPasswordObscured = true.obs;
  /*togglePasswordVisibility start here*/
  void togglePasswordVisibility() => isPasswordObscured.value = !isPasswordObscured.value;
  /*togglePasswordVisibility end here*/
  /*validateEmail start here*/
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Please enter an email address.';
    String emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    if (!RegExp(emailPattern).hasMatch(value)) return 'Please enter a valid email address.';
    return null;
  }
/*validateEmail end here*/
  /*validatePassword start here*/
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Please enter a password.';
    if (value.length < 6) return 'Password should be at least 6 characters long.';
    final passwordPattern = r'^[a-zA-Z0-9!@#\$%\^&\*\(\)]+$';
    if (!RegExp(passwordPattern).hasMatch(value)) return 'Password should contain valid characters.';
    return null;
  }
  /*validatePassword end here*/
  /*submitForm start here*/
   submitForm(){
    if(formKey.currentState!.validate()){
      String email = loginEmailController.text.trim();
      String password =loginPasswordController.text.trim();
      loginEmailController.clear();
      loginPasswordController.clear();
      // Check if email is correct
      if(email!='mohammad.nabil.ashraf@gmail.com'){
        Get.snackbar('Error', 'Email is incorrect',backgroundColor: Colors.red,colorText: Colors.white);
        return null;
      }
      // Check if password is correct
      if(password!='123456'){
        Get.snackbar('Error', 'Password is incorrect',backgroundColor: Colors.red,colorText: Colors.white);
        return null;
      }
      // Check if password is correct
      // If both email and password are correct, show success message
      Get.snackbar('Success', 'Login In Success',backgroundColor: Colors.green,colorText: Colors.white);
      Get.to(HomePage(),);

    }

  }
  /*submitForm start here*/
  /* goToSignUpPage start here*/
  goToSignUpPage(){
    Get.off(SignUp(),);
  }
/* goToSignUpPage end here*/

@override
  void onClose() {
    // TODO: implement onClose
  loginEmailController.dispose();
  loginPasswordController.dispose();
    super.onClose();
  }
}