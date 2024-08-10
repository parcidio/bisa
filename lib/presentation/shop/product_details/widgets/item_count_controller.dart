import 'package:get/get.dart';

class ItemCountController extends GetxController {
  var itemCount = 1.obs;
  final int stock;

  ItemCountController(this.stock);

  void increaseCount() {
    if (itemCount < stock) {
      itemCount++;
    }
  }

  void decreaseCount() {
    if (itemCount > 1) {
      itemCount--;
    }
  }
}
