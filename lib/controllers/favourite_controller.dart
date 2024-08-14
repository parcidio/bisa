import 'package:get/get.dart';

class FavouriteController extends GetxController {
  RxBool _isFavourite = true.obs;

  bool get isFavourite => _isFavourite.value;

  void setToFavourite() {
    _isFavourite.value = !_isFavourite.value;
  }
}
