import 'package:get/get.dart';

import '../views/Login/login.dart';

class OnBoardingController extends GetxController{
  RxInt currentPage=0.obs;
  var onboardingList =[
    {'image':'assets/images/burgerlogo.png','title':'Burger', 'description': 'Burgers are hot,tangy,spicy and crunchy'},
    {'image': 'assets/images/icecream1.png', 'title': 'Ice Cream','description': 'The best and Delicious'},
    {'image': 'assets/images/pizzalogo.png', 'title': 'Pizza','description':'Pizza are hot,tangy,spicy crunchy'},
  ].obs;
  /*setCurrentPage start here*/
  setCurrentPage(int page){
    currentPage.value = page;
    update();
  }
/*setCurrentPage end here*/
/* goToLoginPage start here*/
  goToLoginPage(){
    Get.off(LoginScreen (),);
  }
/* goToSignUpPage end here*/
}