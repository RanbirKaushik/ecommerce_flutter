import 'package:e_commerce/data/repository/popularProductRepository.dart';
import 'package:e_commerce/data/repository/recomendedProductRepository.dart';
import 'package:e_commerce/models/popularProducts.dart';
import 'package:get/get.dart';


class RecommondedController extends GetxController{
  final RecomendedProductRepository recomendedProductRepository;

  RecommondedController({required this.recomendedProductRepository});

  List<dynamic> _recommondedProductList=[];
  List<dynamic> get recommondedProductList => _recommondedProductList;  //this is the getter

  bool _isLoaded = false;

  bool get isLoaded => _isLoaded;

  Future<void> getRecommondedProductlist() async {

    Response response = await recomendedProductRepository.getrecommendedProductList();

    if(response.statusCode == 200){
      print("Got the response...");
      _recommondedProductList =[];
      _recommondedProductList.addAll(Product.fromJson(response.body).products);
      print(_recommondedProductList);
      _isLoaded = true;
      update();
    }
  }

}