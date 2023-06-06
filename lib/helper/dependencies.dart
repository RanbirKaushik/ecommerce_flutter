import 'package:e_commerce/controller/CartController.dart';
import 'package:e_commerce/controller/popularProductListController.dart';
import 'package:e_commerce/controller/recommendedProductController.dart';
import 'package:e_commerce/data/api/apiClient.dart';
import 'package:e_commerce/data/repository/cartRepository.dart';
import 'package:e_commerce/data/repository/popularProductRepository.dart';
import 'package:e_commerce/data/repository/recomendedProductRepository.dart';
import 'package:e_commerce/utils/AppConstants.dart';
import 'package:get/get.dart';

Future<void> init() async{

  //THis is apiClient
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //repos
  Get.lazyPut(() => PopularProductRepository(apiClient: Get.find()));
  Get.lazyPut(() => RecomendedProductRepository(apiClient: Get.find()));
  Get.lazyPut(() => CartRepository());

  //for controller
  Get.lazyPut(() => PopularProductListController(popularProductRepository: Get.find()));
  Get.lazyPut(() => RecommondedController(recomendedProductRepository: Get.find()));
  Get.lazyPut(() => CartController(cartRepository: Get.find()));

}