import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:untitled2/controllers/cart%20contollers/cart_controller.dart';
import 'package:untitled2/controllers/cart%20contollers/product_controller.dart';
import 'package:untitled2/controllers/category_controller.dart';
import 'package:untitled2/controllers/fav_controller.dart';
import 'package:untitled2/views/homeview/Product%20Detail/fav_list.dart';
import 'package:untitled2/views/homeview/Product%20Detail/product_detail.dart';
import 'package:badges/badges.dart' as badges;

import 'Product Detail/cart_list.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  CategoryController categoryController = Get.find();
  CartController cartController = Get.find();
  FavController favController = Get.find();


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());

      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            InkWell(
              onTap: (){
                Get.to(CartList(),);
              },
              child: Padding(
                padding:  EdgeInsets.only(left: 14,right: 14,
                  top: 14,
                ),
                child: badges.Badge(
                  badgeContent: Obx(() => Text(cartController.cartItems.length.toString(),),),
                  child: SvgPicture.asset('assets/svg/cart.svg',color: Colors.teal,) ,
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Get.to(FavouriteList(),);
              },
              child: Padding(
                padding:  EdgeInsets.only(left: 14,right: 14,
                  top: 14,
                ),
                child: badges.Badge(
                  badgeContent: Obx(() => Text(favController.favItems.length.toString(),),),
                  child: SvgPicture.asset('assets/svg/heart.svg',color: Colors.teal,) ,
                ),
              ),
            ),
          ],
          title: Text('Home page',style: TextStyle(
            //color: Colors.teal,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),),
          centerTitle: true,
        ),
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 14,vertical: 14),
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*first portion start here*/
                TextFormField(
                  controller: categoryController.searchController,
                  onChanged: (value)=>categoryController.filterProduct(value),
                  decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    enabledBorder: OutlineInputBorder(
                     // borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.teal),
                    ),
                  ),
                ),

                /*first portion end here*/
              /*second portion start here*/
                Text(
                  'Category',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).textTheme.bodyLarge?.color, // Corrected text style
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),

                /*second portion end here*/
                const SizedBox(height: 10,),
              /*third portion start here*/
              SizedBox(
                height: 60,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                    var category = categoryController.categories[index];
                  return Obx(() => InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: (){
                      categoryController.updateCategoryIndex(index);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      constraints: BoxConstraints(
                        maxWidth: 165, // Minimum width for each container
                      ),
                      decoration: BoxDecoration(
                        color: categoryController.categoryIndex.value==index?Colors.teal:Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade400),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(category['image']!,height: 40,width: 40,),
                          SizedBox(width: 8),
                          Text(category['title']!,textAlign: TextAlign.center,style: TextStyle(fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: categoryController.categoryIndex.value==index?Colors.white:Colors.grey,
                          ),),


                        ],),
                    ),
                  ),);

                }, separatorBuilder: (context,index){
                  return SizedBox(width: 10,);

                }, itemCount:categoryController.categories.length),
              ),
              /*third portion end here*/
                const SizedBox(height: 10,),
                /*four portion start here*/
                Text('Products',style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).textTheme.bodyLarge?.color, // Corrected text style
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),),
                /*four portion end here*/
                /*five portion start here*/
               Obx(() =>  SizedBox(height: Get.height*0.4,
                 child: ListView.separated(
                     scrollDirection: Axis.horizontal,
                     separatorBuilder: (context,index){
                       return SizedBox(width: 10,);

                     }, itemBuilder: (context,index){
                   var currentProduct=categoryController.products[index];
                   return InkWell(
                     onTap: (){
                       categoryController.resetSearchText();
                       categoryController.updateCategoryIndex(index);
                       categoryController.resetShowFullText();
                       Get.to(ProductDetail(
                         product: currentProduct,
                       ),);


                     },
                     child: Padding(
                       padding:  EdgeInsets.symmetric(horizontal: index==0?0:8,vertical: 8),
                       child: Container(
                         padding: EdgeInsets.all(14),


                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10),
                           border: Border.all(
                             color: Colors.teal,
                           ),
                         ),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                           Hero(
                             tag:currentProduct.id,
                             child: Image.asset(currentProduct.image,height: Get.height*0.15,),),
                           Text(currentProduct.title,style: TextStyle(
                             fontSize: 20,
                             fontWeight: FontWeight.bold,
                             color: Colors.teal,
                           ),),

                             Text(currentProduct.subtitle,style:
                             Theme.of(context).textTheme.bodyLarge!.copyWith(
                               color: Theme.of(context).textTheme.bodyLarge?.color, // Corrected text style

                             ),
                             ),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                               Text("Price",style: TextStyle(color: Colors.teal),),

                               SizedBox(width: Get.width*0.08,),
                               Text('\$${currentProduct.price.toString()}',style:
                               TextStyle( fontSize: 17,
                                 fontWeight: FontWeight.bold,
                                 color: Colors.teal,),),
                             ],),



                         ],),
                       ),
                     ),
                   );
                 }, itemCount: categoryController.products.length),
               ),),

                /*five portion end here*/

            ],),
          ),
        ),
      ),
    );
  }
}
