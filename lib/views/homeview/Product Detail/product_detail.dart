
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/controllers/cart%20contollers/cart_controller.dart';
import 'package:untitled2/controllers/category_controller.dart';
import 'package:untitled2/model/product_model.dart';
import 'package:untitled2/views/Custom%20Widgets/my_theme.dart';

import '../../../controllers/fav_controller.dart';
import 'components/product_image.dart';
import 'components/product_title_price.dart';

class ProductDetail extends StatelessWidget {
  final ProductModel product;
   ProductDetail({super.key,required this.product});
   CategoryController categoryController = Get.find();
   CartController cartController = Get.find();
   FavController favController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(product.title,style: TextStyle(color: Colors.teal),),
leading: IconButton(onPressed: (){
  Get.back();

},
  icon: Icon(Icons.arrow_back_ios),
),
        actions: [
          Obx(() =>
          IconButton(onPressed: (){

            favController.addItemToFavorite(product);
          }, icon: Icon(favController.toggleFavorite(product)?Icons.favorite:Icons.favorite_border_outlined,
            color: favController.toggleFavorite(product)?Colors.red:Theme.of(context).primaryColor,),),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal:4,vertical: 14),
          child: Column(children: [
            /*first portion start here*/
            product_image(product: product),
            /*first portion end here*/
            const SizedBox(height: 10,),
            /*second portion start here*/
            product_title_price(product: product),
            /*second portion end here*/
            const SizedBox(height: 10,),
            /*third portion start here*/
            Obx(() =>
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.description,style:Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color:Theme.of(context).colorScheme.primary, // Corrected text style

                ),
                  maxLines: categoryController.showFullText.value?null:2,
                  overflow: categoryController.showFullText.value?null:TextOverflow.ellipsis,
                ),
                TextButton(onPressed: (){
                  categoryController.toggleReadMore();
                }, child: Text(categoryController.showFullText.value?"Show Less":"Show More",style: TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),),),
              ],
            ),
            ),
            /*third portion end here*/
            const SizedBox(height:10),
            /*last portion start here*/
            ElevatedButton(
              style:ElevatedButton.styleFrom(
                backgroundColor:Colors.teal,
                minimumSize: Size(400,60),
                shape:RoundedRectangleBorder(
                  borderRadius:BorderRadius.circular(20),
                ),

              ),
              onPressed:(){
                cartController.addItemInCart(product);
              },
              child:Text("Cart View",style:TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),),
            ),
            /*last portion end here*/


          ],),
        ),
      ),
    );
  }
}




