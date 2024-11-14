import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/controllers/auth%20controllers/signup_controller.dart';

class SignUp extends StatelessWidget {
   SignUp({super.key});
   SignUpController signUpController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Sign Up Screen',style: Theme.of(context).textTheme.headlineLarge!.copyWith(
            color: Theme.of(context).textTheme.bodyLarge?.color, // Corrected text style
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
          ),
        ),
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              /*first portion start here*/
              Center(child: Image.asset('assets/images/logo.png',height: 250,width: 150,),),
              /*first portion end here*/

              /*second portion start here*/
              Form(
key: signUpController.formKey,
                child: Column(children: [
                  Text(
                    textAlign:TextAlign.justify,
                    'Create \n New Account',style: TextStyle(
                    fontSize: 35,
                    color: Colors.teal,
                    fontWeight: FontWeight.bold, height: 1,
                  ),),
                  SizedBox(height: 20,),
                  Column(children: [
                    TextFormField(
                      style: TextStyle(color: Colors.teal),
                      controller: signUpController.nameController,
                      validator: signUpController.validateName,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person,color: Colors.teal,),
                        hintText: "Name",
                        hintStyle: TextStyle(color: Colors.teal),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey), // Set color when focused
                        ),
                      ),
                    ),
const SizedBox(height: 10,),
                    TextFormField(
                      style: TextStyle(color: Colors.teal),
                      controller: signUpController.emailController,
                      validator: signUpController.validateEmail,
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
                    const SizedBox(height: 10,),
                    Obx(() => TextFormField(
                      style: TextStyle(color: Colors.teal),
                      controller: signUpController.passwordController,
                      validator: signUpController.validatePassword,
                      obscureText:signUpController.isPasswordObscured.value,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey), // Set color when focused
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey), // Set color for enabled state
                        ),
                        suffixIcon: IconButton(onPressed: (){
                          signUpController.togglePasswordVisibility();
                        },icon:Icon(signUpController.isPasswordObscured.value?Icons.visibility:Icons.visibility_off,
                          color: Colors.teal,
                        ),),
                        prefixIcon: Icon(Icons.password,color: Colors.teal,),
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.teal),
                      ),
                    ),),
                    const SizedBox(height: 10,),
                    Obx(() => TextFormField(
                      style: TextStyle(color: Colors.teal),
                      controller: signUpController.confirmPasswordController,
                      validator: signUpController.confirmValidatePassword,
                      obscureText:signUpController.isConfirmPasswordObscured.value,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey), // Set color when focused
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey), // Set color for enabled state
                        ),
                        suffixIcon: IconButton(onPressed: (){
                          signUpController.toggleConfirmPasswordVisibility();
                        },icon:Icon(signUpController.isConfirmPasswordObscured.value?Icons.visibility:Icons.visibility_off,
                          color: Colors.teal,
                        ),),
                        prefixIcon: Icon(Icons.password,color: Colors.teal,),
                        hintText: "Confirm Password",
                        hintStyle: TextStyle(color: Colors.teal),
                      ),
                    ),),
                    const SizedBox(height: 10,),
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
                        if (signUpController.formKey.currentState!.validate()) {
                          signUpController.submitForm();
                        }

                      }, child: Text('Sign Up'),),
                    /*second portion end here*/
                  ],),

                ],),),
              /*last portion start here*/
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const  Text('Have have account?',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),),
                  const SizedBox(width: 10,),
                  InkWell(
                    onTap: (){
                      signUpController.goToLoginPage();
                    },
                    child:const  Text('Login',style: TextStyle(
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
