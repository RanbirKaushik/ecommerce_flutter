import 'package:e_commerce/data/api/apiClient.dart';
import 'package:e_commerce/utils/AppConstants.dart';
import 'package:get/get.dart';

class PopularProductRepository extends GetxService{

  final ApiClient apiClient;

  PopularProductRepository({required this.apiClient});

  Future<Response> getPopularProductList() async{

    return await apiClient.getData(AppConstants.POPULAR_PRODUCT_URI);
  }

}