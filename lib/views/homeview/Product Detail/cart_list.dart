import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/controllers/cart%20contollers/cart_controller.dart';
import 'package:untitled2/views/homeview/homepage.dart';

class CartList extends StatelessWidget {
  CartList({super.key});
 final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Screen',style: TextStyle(
        color: Colors.teal,
    ),
      ),
        leading: IconButton(onPressed: (){
          Get.back();

        },
          icon: Icon(Icons.arrow_back_ios),
        ),
        actions: [
          Obx(() =>
          Text('Total ${cartController.cartItems.length.toString()} Items',),
          ),
        ],
      ),
      body: Column(children: [
        /*first portion start here*/
Obx(() =>
       Expanded(child: cartController.cartItems.isNotEmpty?
       Column(
         children: [
           Expanded(
             child: ListView.separated(
                 itemBuilder: (context,index){
               var cartItem = cartController.cartItems[index];
               return Container(
                 width: double.infinity,
                 height: Get.height*0.2,
                // color: Colors.grey.shade100,
                 padding: EdgeInsets.symmetric(horizontal: 4,vertical: 14),
                 margin: EdgeInsets.symmetric(horizontal: 14,vertical: 14),
                 decoration: BoxDecoration(
                   color: Colors.grey.shade100,
                   borderRadius: BorderRadius.circular(10),
                   border: Border.all(
                     color: Colors.teal,
                   ),
                 ),


                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                   Container(
                     height: 110,
                     width: 100,
                     decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(10),
                       border: Border.all(
                         color: Colors.teal,
                       ),
                     ),
                     child: Image(image: AssetImage(cartItem.image),),),
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  Text(cartItem.title,style:TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.teal,
  ),),
  Text(cartItem.subtitle,style:TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.teal,
  ),),

Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
IconButton(onPressed: (){
  cartController.increaseQuantity(cartItem);
}, icon:Icon(Icons.add_circle_outline,color: Colors.teal,),),
  Obx(() => Text(cartItem.quantity.toString(),style: TextStyle(color: Colors.teal),),),
  IconButton(onPressed: (){
    cartController.decreaseQuantity(cartItem);

  }, icon:Icon(Icons.remove_circle_outline,color: Colors.teal,),),
],),
],),
 IconButton(onPressed: (){
   cartController.removeItemFromCart(cartItem);
 }, icon: Icon(Icons.delete,color: Colors.teal,),)  ,

                 ],),
               );

             }, separatorBuilder: (context,index){
               return SizedBox(height: 10,);
             }, itemCount:cartController.cartItems.length),
           ),
         ],

       ):Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Image.network(
               "https://cdn.dribbble.com/users/5107895/screenshots/14532312/media/a7e6c2e9333d0989e3a54c95dd8321d7.gif",
               height: 230,
             ),
           Text('Your Cart Is Empty',style: TextStyle(
             fontWeight: FontWeight.bold,
             fontSize: 30,
             color: Colors.teal,
           ),),
         ],),
       ),),
),
        /*first portion end here*/
        Divider(),
        /*second portion start here*/
Column(children: [
Container(
  width: double.infinity,
  height: 200,
  color: Colors.grey.shade100,
  padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 14),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
Text('SubTotal',style: TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 30,
  color: Colors.teal,
),),
     Obx(() =>  Text(cartController.calculateSubTotal().toString(),style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
        color: Colors.teal,
      ),),
     ),
    ],),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Delivery Charges',style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.teal,
          ),),
          Obx(() =>
          Text(cartController.calculateDeliveryTotal().toString(),style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.teal,
          ),),
          ),
        ],),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Total',style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.teal,
          ),),
          Obx(() =>
              Text(cartController.calculateTotal().toString(),style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.teal,
              ),),
          ),
        ],),
  ],),
),
],),
        /*second portion start here*/
        const SizedBox(height: 10,),
        /*last portion start here*/
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor:Colors.teal,
            minimumSize: Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: (){
            Get.to(HomePage(),);
          }, child: Text('Check Out',style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),),),
        /*last portion end here*/


      ],),
    );
  }
}
