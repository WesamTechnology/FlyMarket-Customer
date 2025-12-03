import 'package:flymarket_customer/data/datasource/remote/categories_data.dart';
import 'package:get/get.dart';

import '../../core/class/statuserequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handling_data_controller.dart';
import '../../data/datasource/remote/items_data.dart';
import '../../data/model/itemsmodel.dart';
import '../../data/model/supermarket_model.dart';

abstract class CategoriesController extends GetxController {
  initialData();

  changCat(int val, String catVal);

  getcategory(String categoryId);

  goToItems(List categories, int selectedCat, String categoryId);
}

class CategoriesControllerImp extends CategoriesController {
  List supermarket = [];
  List categories = [];
  String? superid;
  int? selectedsuper;
  late SupermarketModel supermarketModel;

  CategoriesData categoryData = CategoriesData(Get.find());

  List data = [];

  late StatusRequest statusRequest;

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  initialData() {
    supermarket = Get.arguments["supermarket"];
    selectedsuper = Get.arguments["selectedsuper"];
    superid = Get.arguments["superid"];
    supermarketModel = Get.arguments["supermarketModel"];
    getcategory(superid!);
  }

  @override
  changCat(val, catVal) {
    selectedsuper = val;
    superid = catVal;
    getcategory(superid!);
    update();
  }

  @override
  getcategory(categoryId) async {
    categories.clear();
    statusRequest = StatusRequest.loding;
    var response = await categoryData.getData(categoryId);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToItems(categories,selectedCat,categoryId) {
    Get.toNamed(AppRoute.items,arguments: {
      "categories": categories,
      "selectedCat": selectedCat,
      "categoryId": categoryId,
    });
  }
}
