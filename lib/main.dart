import 'package:e_commerce/controller/popularProductListController.dart';
import 'package:e_commerce/controller/recommendedProductController.dart';
import 'package:e_commerce/pages/food/popularFoodDetails.dart';
import 'package:e_commerce/pages/food/recomandedFoodDetails.dart';
import 'package:e_commerce/pages/home/mainFoodPage.dart';
import 'package:e_commerce/routes/routeHelper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/helper/dependencies.dart' as dep;
void main() {

  WidgetsFlutterBinding.ensureInitialized(); //it'll make sure that ur dep are loaded correctly and wait until load
  dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    Get.find<PopularProductListController>().getPopularProductlist();
    Get.find<RecommondedController>().getRecommondedProductlist();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
      home: const MainFoodPage(),
    );
  }
}

