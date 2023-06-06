import 'package:e_commerce/pages/food/popularFoodDetails.dart';
import 'package:e_commerce/pages/food/recomandedFoodDetails.dart';
import 'package:e_commerce/pages/home/mainFoodPage.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recmondedFood = "/recommonded-food";

  static String getInitial() => "$initial";

  static String getPopularFood(int pageId) => "$popularFood?pageId=$pageId";

  static String getRecmondedFood(int pageId) => "$recmondedFood?pageId=$pageId";
  static List<GetPage> routes = [
    GetPage(
        name: initial,
        page: () {
          return MainFoodPage();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          print("popular food get called");
          return PopularFoodDetails(pageId : int.parse(pageId!));
        },
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: recmondedFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          print("recmmonded food get called");
          return RecommendedFoodDetails(pageId : int.parse(pageId!));
        },
        transition: Transition.rightToLeftWithFade)
  ];
}
