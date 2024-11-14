import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:untitled2/controllers/fav_controller.dart';

class FavouriteList extends StatelessWidget {
   FavouriteList({super.key});
   FavController favController = Get.find();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite Screen',style: TextStyle(
          color: Colors.teal,
        ),
        ),
        leading: IconButton(onPressed: (){
          Get.back();

        },
          icon: Icon(Icons.arrow_back_ios),
        ),

      ),
      body: Column(
        children: [
          /*first portion start here*/
          Obx(() =>
              Expanded(child: favController.favItems.isNotEmpty?
              Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context,index){
                          var cartItem = favController.favItems[index];
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


                                  ],),
                                IconButton(onPressed: (){
                                 favController.removeItemFromFavorite(cartItem);
                                }, icon: SvgPicture.asset('assets/svg/heart.svg',color: Colors.red,),
                                )  ,

                              ],),
                          );

                        }, separatorBuilder: (context,index){
                      return SizedBox(height: 10,);
                    }, itemCount:favController.favItems.length),
                  ),
                ],

              ):Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      "https://cdn.pixabay.com/animation/2022/08/23/03/32/03-32-04-108_512.gif",
                      height: 230,
                    ),
                    Text('Your Favourite List Is Empty',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.teal,
                    ),),
                  ],),
              ),),
          ),
          /*first portion end here*/
        ],
      ),
    );
  }
}
