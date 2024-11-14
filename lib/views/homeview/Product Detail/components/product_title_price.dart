import 'package:flutter/material.dart';

import '../../../../model/product_model.dart';

class product_title_price extends StatelessWidget {
  const product_title_price({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(product.title,style: TextStyle(color: Colors.teal, fontSize: 30,
          fontWeight: FontWeight.bold,),),
        Text('\$${product.price}',style: TextStyle(color: Colors.teal, fontSize: 30,
          fontWeight: FontWeight.bold,),),
      ],);
  }
}