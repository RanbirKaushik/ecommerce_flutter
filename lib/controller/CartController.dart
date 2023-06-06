import 'package:e_commerce/data/repository/cartRepository.dart';
import 'package:e_commerce/models/cartModel.dart';
import 'package:e_commerce/models/popularProducts.dart';
import 'package:get/get.dart';

class CartController extends GetxController{
  final CartRepository cartRepository;

  CartController({required this.cartRepository});

  Map<int, CartModel> _items = {};

  void addItems(ProductModel productModel, int quantity) {
    _items.putIfAbsent(productModel.id!, () {
      DateTime now = DateTime.now();
      int time = now.millisecondsSinceEpoch.toInt();

      return CartModel(
        id: productModel.id,
        name: productModel.name,
        price: productModel.price,
        img: productModel.img,
        quantity: quantity,
        isExist: true,
        time: time,
      );
    });
  }

}