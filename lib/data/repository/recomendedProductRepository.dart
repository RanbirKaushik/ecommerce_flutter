import 'package:e_commerce/data/api/apiClient.dart';
import 'package:e_commerce/utils/AppConstants.dart';
import 'package:get/get.dart';

class RecomendedProductRepository extends GetxService{

  final ApiClient apiClient;

  RecomendedProductRepository({required this.apiClient});

  Future<Response> getrecommendedProductList() async{

    return await apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URI);
  }

}