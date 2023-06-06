import 'package:e_commerce/controller/popularProductListController.dart';
import 'package:e_commerce/pages/home/mainFoodPage.dart';
import 'package:e_commerce/utils/AppConstants.dart';
import 'package:e_commerce/utils/colors.dart';
import 'package:e_commerce/utils/dimensions.dart';
import 'package:e_commerce/widget/appColumn.dart';
import 'package:e_commerce/widget/appIcon.dart';
import 'package:e_commerce/widget/big_text.dart';
import 'package:e_commerce/widget/customIconAndText.dart';
import 'package:e_commerce/widget/expandableTextWidget.dart';
import 'package:e_commerce/widget/small_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../routes/routeHelper.dart';

class PopularFoodDetails extends StatelessWidget {
  int pageId;

  PopularFoodDetails({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductListController>().popularProductList[pageId];
    Get.find<PopularProductListController>().initQuanitiy();
    // Get.find<PopularProductController>()
    //     .initProduct(product, Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 75,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      Get.toNamed(RouteHelper.initial);
                    },
                    child: AppIcons(icon: Icons.clear)),
                Stack(
                  children: [
                    AppIcons(icon: Icons.shopping_cart_outlined),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        margin: const EdgeInsets.only(top: 2, right: 5),
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: AppColors.mainColor),
                        child: BigText(
                          text: "1",
                          size: 9,
                          textColor: Colors.white,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                alignment: Alignment.center,
                width: double.maxFinite,
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20),
                      topRight: Radius.circular(Dimensions.radius20),
                    )),
                child: BigText(
                  text: product.name!,
                  size: Dimensions.font26,
                ),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image(
                image: NetworkImage(AppConstants.BASE_URL +
                    AppConstants.UPLOAD_URL +
                    product.img!),
              ),
            ),
          ),
          SliverToBoxAdapter(
            //making it scrollable
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.width20, right: Dimensions.width20),
                  child: ExpandableTextWidget(text: product.description!),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar:
          GetBuilder<PopularProductListController>(builder: (popularProduct) {
        return Container(
          height: 140,
          padding: EdgeInsets.only(
              top: Dimensions.height30,
              bottom: Dimensions.height20,
              left: Dimensions.width20,
              right: Dimensions.radius20),
          decoration: BoxDecoration(
            color: AppColors.buttonBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.radius20 * 2),
              topRight: Radius.circular(Dimensions.radius20 * 2),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height20,
                    bottom: Dimensions.height20,
                    left: Dimensions.width20,
                    right: Dimensions.width20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          popularProduct.setQuantity(false);
                        },
                        child: Icon(Icons.remove, color: AppColors.signColor)),
                    SizedBox(width: Dimensions.width10 / 2),
                    BigText(text: popularProduct.quantity.toString()),
                    SizedBox(width: Dimensions.width10 / 2),
                    InkWell(
                        onTap: () {

                          // if(popularProduct.quantity.isGreaterThan(9)){
                          //   const snackBar = SnackBar(
                          //     content: Text('Hello, Snackbar!'),
                          //     duration: Duration(seconds: 2),
                          //   );
                          //
                          //   ScaffoldMessenger.of(context)
                          //       .showSnackBar(snackBar);
                          // }
                          popularProduct.setQuantity(true);
                        },
                        child: Icon(Icons.add, color: AppColors.signColor))
                  ],
                ),
              ),
              // ElevatedButton(
              //   onPressed: () {},
              //   child: const Text("0.08 Add to card"),
              //   style: ElevatedButton.styleFrom(
              //       primary: AppColors.mainColor,
              //       padding: const EdgeInsets.all(20),
              //       shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(20))),
              //
              // )
              Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height20,
                    bottom: Dimensions.height20,
                    left: Dimensions.width20,
                    right: Dimensions.width20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: AppColors.mainColor),
                child: GestureDetector(
                  onTap: () {
                    // popularProduct.addItem(product);

                  },
                  child: BigText(
                    text: "\$${product.price} | Add to cart",
                    textColor: Colors.white,
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
