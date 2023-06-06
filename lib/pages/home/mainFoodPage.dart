import 'package:e_commerce/utils/dimensions.dart';
import 'package:e_commerce/widget/big_text.dart';
import 'package:e_commerce/widget/small_text.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce/utils/colors.dart';
import 'foodPageBody.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {

  @override
  Widget build(BuildContext context) {
    print("The width of the screen is ${MediaQuery.of(context).size.width} and hight is ${MediaQuery.of(context).size.height}");
    return Scaffold(
        body : Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: Dimensions.height45,bottom: Dimensions.height15,left: Dimensions.width20,right: Dimensions.width20),
              child: Row( 
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [

                      BigText(text: "India",textColor: AppColors.mainColor,),
                      Row(
                        children: [
                          SmallText(text: "hyderabad",textColor: Colors.black54,),
                          Icon(Icons.arrow_drop_down_rounded)
                        ],
                      )

                    ],

                  ),
                  Center(
                    child: Container( //In flutter default icon size is 24
                      width: Dimensions.width45,
                      height: Dimensions.height45,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius15),
                        color: AppColors.mainColor
                      ),
                      child: Icon(Icons.search,color: Colors.white,size: Dimensions.iconSize24,),
                    ),
                  )
                ],
              ),
            ),
            Expanded(child : SingleChildScrollView(
              child: FoodPageBody(),
            ))
          ],
        )
    );

  }
}
