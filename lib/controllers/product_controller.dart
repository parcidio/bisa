import 'package:get/get.dart';

class ProductController extends GetxController {
  RxInt _quantity = 0.obs;

  get quantity => _quantity.value;

  void incrementQuantity() {
    _quantity++;
    update();
  }

  void decrementQuantity() {
    if (_quantity > 0) {
      _quantity--;
      update();
    }
  }
}
