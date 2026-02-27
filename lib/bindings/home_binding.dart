import 'package:get/get.dart';

import '../controller/cart/cart_controller.dart';
import '../controller/favorite/my_favorite_controller.dart';
import '../controller/home/categories_all_controller.dart';
import '../controller/home/home_shop_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeShopControllerImp());
    Get.lazyPut(() => CategoriesAllControllerImp());
    Get.lazyPut(() => CartController());
    Get.lazyPut(() => MyFavoriteController());
  }
}