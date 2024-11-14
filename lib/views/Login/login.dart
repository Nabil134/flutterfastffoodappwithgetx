import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/controllers/auth%20controllers/login_controller.dart';
import 'package:untitled2/views/Custom%20Widgets/my_theme.dart';
import 'package:untitled2/views/Sign%20up/signup.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
  final LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
          title: Text('Login Screen',style: Theme.of(context).textTheme.headlineLarge!.copyWith(
            color: Theme.of(context).textTheme.bodyLarge?.color, // Corrected text style
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
          ),
          ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(children: [
              /*first portion start here*/
              Center(child: Image.asset('assets/images/logo.png',height: 250,width: 150,),),
              /*first portion end here*/
              SizedBox(height: 20,),
              /*second portion start here*/
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: loginController.formKey,
                child: Column(children: [
                Text(
                  textAlign:TextAlign.justify,
                  'Login Here',style: TextStyle(
                  fontSize: 35,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold, height: 1,
                ),),
                SizedBox(height: 20,),
                TextFormField(
                  style: TextStyle(color: Colors.teal),
                  controller: loginController.loginEmailController,
                  validator: loginController.validateEmail,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email,color: Colors.teal,),
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.teal),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey), // Set color when focused
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Obx(() => TextFormField(
                  style: TextStyle(color: Colors.teal),
                  controller: loginController.loginPasswordController,
                  validator: loginController.validatePassword,
                  obscureText: loginController.isPasswordObscured.value,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey), // Set color when focused
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey), // Set color for enabled state
                    ),
                    suffixIcon: IconButton(onPressed: (){
                      loginController.togglePasswordVisibility();
                    },icon:Icon(loginController.isPasswordObscured.value?Icons.visibility:Icons.visibility_off,
                    color: Colors.teal,
                    ),),
                    prefixIcon: Icon(Icons.password,color: Colors.teal,),
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.teal),
                  ),
                ),),
              ],),),
              /*second portion end here*/
              const SizedBox(height: 20,),
              /*third portion start here*/
               ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(400, 50),
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),

                  ),
                ),
                onPressed: (){
                  if (loginController.formKey.currentState!.validate()) {
                    loginController.submitForm();
                  }

              }, child: Text('Login'),),
              /*third portion end here*/
              const SizedBox(height: 20,),
              /*last portion start here*/
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const  Text('Don\'t have account',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),),
                  const SizedBox(width: 10,),
                  InkWell(
                    onTap: (){
                      loginController.goToSignUpPage();
                    },
                    child:const  Text('Sign Up',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),),
                  ),
                ],),
              /*last portion end here*/
            ],),
          ),
        ),
      ),
    );

  }
}
