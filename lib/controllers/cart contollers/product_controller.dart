import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../model/product_model.dart';

class ProductController extends GetxController{
  var products = <ProductModel>[].obs;
  var isDataLoadingCompleetd = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchData();
  }
/*fetchData start here*/
  Future<void> fetchData() async {
    var productjson =
        await rootBundle.loadString("assets/json/ice_cream.json");

    var decodeData = jsonDecode(productjson);

     print(decodeData);

    products.value =
        List.from(decodeData).map((e) => ProductModel.fromMap(e)).toList();

    isDataLoadingCompleetd.value = true;
  }
  /*fetchData end here*/
  /*destroy start here*/
  void destroy() {
    products.value = [];
  }
/*destroy end here*/
}