import 'package:get/get.dart';

class CartController extends GetxController {
  final cart = [];

  void addProduct (product){
    cart.add(product);
    update();
  }

  void removeProduct (product) {
    cart.remove(product);
    update();
  }
}