import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../model/product_model.dart';

class product_image extends StatelessWidget {
  const product_image({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: product.id,
      child: Image.asset(product.image,height: Get.height*0.4,width: Get.width*0.4,),);
  }
}