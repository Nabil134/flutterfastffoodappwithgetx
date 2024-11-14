import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../model/product_model.dart';

class CategoryController extends GetxController with SingleGetTickerProviderMixin {
  late TabController tabController;
  final TextEditingController searchController = TextEditingController();
  var showFullText = false.obs;
  var products = <ProductModel>[].obs;
  var filterProducts= <ProductModel>[].obs;
  var isDataLoadingCompleted = false.obs;
  var searchText="".obs;
  var categories =[
    {'image':'assets/images/burgerlogo.png','title':'Burger'},
    {'image': 'assets/images/icecream1.png', 'title': 'Ice Cream'},
    {'image': 'assets/images/pizzalogo.png', 'title': 'Pizza'},
  ].obs;
var categoryIndex=0.obs;
/*updateCategoryIndex start here*/
void updateCategoryIndex(int index){
  categoryIndex.value=index;
  loadCategoryData(index);
  resetSearchText();
}
/*updateCategoryIndex end here*/
@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    tabController = TabController(length: categories.length, vsync: this);
   loadCategoryData(categoryIndex.value);
   searchController.addListener(() {
filterProduct(searchController.text);
   });
  // filterProduct('');
  }
  /*loadCategoryData start here*/
  loadCategoryData (int index) async {
    String category;
    switch(index){
      case 0:
        category="burgers";
        break;
      case 1:
        category="iceCreams";
        break;
      case 2:
        category="pizzas";
        break;
       default:
         category="burgers";

    }
   await fetchData(category);
  }
  /*loadCategoryData end here*/
  /*fetchData start here*/
  Future<void> fetchData(String category) async {
    try {
      var productJson =
      await rootBundle.loadString('assets/json/products.json');

      var decodeData = jsonDecode(productJson);

      print(decodeData[category][0]);
      if(decodeData[category]!=null){
        filterProducts.value =
            List.from(decodeData[category]).map((e) => ProductModel.fromMap(e)).toList();
        products.value=filterProducts.toList();

        isDataLoadingCompleted.value =true;

      }
      else{
        filterProducts.clear();
        products.clear();
        Get.snackbar('Error', 'No products found for this category.');

      }


    }
    catch(e){
      isDataLoadingCompleted.value =false;
      print("Error loading data: $e");
      Get.snackbar('Error', 'Failed to load products. Please try again later.');

    }
  }
/*fetchData end here*/
  /*filterProduct start here*/
  void filterProduct(String value){
    searchText.value = value.toLowerCase();
    if(searchText.value.isEmpty) {
      products.value= filterProducts.toList();
    }
    else{
      products.value = filterProducts.where((product) =>
          product.title.toLowerCase().contains(searchText.value)).toList();
    }
  }
  /*filterProduct end here*/

/*destroy start here*/
  void destroy() {
    products.value = [];
  }
/*destroy end here*/
/*_toggleReadMore start here*/
void toggleReadMore(){
showFullText.value = !showFullText.value;
}
/*_toggleReadMore end here*/
  /*resetShowFullText start here*/
  void resetShowFullText() {
    showFullText.value = false;
  }

/*resetShowFullText end here*/
/*resetSearchText start here*/
  void resetSearchText() {
    searchText.value ='';
    searchController.clear();
    products.value=filterProducts.toList();

  }
/*resetSearchText end here*/
@override
  void onClose() {
    // TODO: implement onClose
  searchController.dispose();
    super.onClose();
  }

}