import 'package:e_commerce/data/repository/popularProductRepository.dart';
import 'package:e_commerce/models/popularProducts.dart';
import 'package:e_commerce/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularProductListController extends GetxController{
  final PopularProductRepository popularProductRepository;

  PopularProductListController({required this.popularProductRepository});

  List<dynamic> _popularProductList=[];
  List<dynamic> get popularProductList => _popularProductList;  //this is the getter

  bool _isLoaded = false;

  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;

  int _inCartItem = 0;
  int get inCartItems => _inCartItem+_quantity;

  String _noMoreAddItem = "You can't add more than 9 items";
  String get noMoreAddItem => _noMoreAddItem;

  Future<void> getPopularProductlist() async {

    Response response = await popularProductRepository.getPopularProductList();

    if(response.statusCode == 200){
      print("Got the response...");
      _popularProductList =[];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      print(_popularProductList);
      _isLoaded = true;
      update();
    }
  }

  void setQuantity(bool isIncrement){
    if(isIncrement){
      _quantity = checkQuantity(_quantity+1);
    }else{
      _quantity = checkQuantity(_quantity-1);
    }
    update();  //update is a function provided by the state management
  }

  checkQuantity(int quantity){
    if(quantity<0){
      Get.snackbar("Item Count", "You can't reduce more",backgroundColor: AppColors.mainColor,colorText: Colors.white,);
      return 0;
    }else if(quantity >9){
      Get.snackbar("Item Count", "You can't add more than 9 items",backgroundColor: AppColors.mainColor,colorText: Colors.white,);

      return 9;
    }else{
      return quantity;
    }
  }

  void initQuanitiy(){
    _quantity =0;
    _inCartItem = 0;
  }

}