import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/views/Login/login.dart';

class SignUpController extends GetxController{
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  var isPasswordObscured = true.obs;
  var isConfirmPasswordObscured = true.obs;
  /*togglePasswordVisibility start here*/
  void togglePasswordVisibility() => isPasswordObscured.value = !isPasswordObscured.value;
  /*togglePasswordVisibility end here*/
  /*toggleConfirmPasswordVisibility start here*/
  void toggleConfirmPasswordVisibility() => isConfirmPasswordObscured.value = !isConfirmPasswordObscured.value;
  /*toggleConfirmPasswordVisibility end here*/
  /*validateName start here*/
  String? validateName(String? value) {
    if (value == null || value.isEmpty) return 'Enter Name';
    String namePattern = r"^[a-zA-Z\s]+$";
    if (!RegExp(namePattern).hasMatch(value)) return 'Enter a valid name';
    return null;
  }
/*validateName end here*/

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
  /*confirmValidatePassword start here*/
  String? confirmValidatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Please enter confirm password.';
    if (value != passwordController.text) return 'Passwords do not match.';
    return null;
  }
/*confirmValidatePassword end here*/
/*submitForm start here*/
  submitForm(){
    if(formKey.currentState!.validate()) {
      String name = nameController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      String confirmPassword = confirmPasswordController.text.trim();
      nameController.clear();
      emailController.clear();
      passwordController.clear();
      confirmPasswordController.clear();
      // Check if password is equal to confirmPassword
      if (password != confirmPassword) {
        Get.snackbar(
          'Error',
          'Passwords do not match.',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      }
      //Check if password is equal to confirmPassword
      // If password and confirmPassword are match, show success message
      Get.snackbar('Success', 'Sign Up In Success',backgroundColor: Colors.green,colorText: Colors.white);
      Get.to(LoginScreen(),);


    }
  }
/*submitForm end here*/
  /* goToSignUpPage start here*/
  goToLoginPage(){
    Get.off(LoginScreen (),);
  }
/* goToSignUpPage end here*/
@override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    confirmPasswordController.dispose();
  }
}