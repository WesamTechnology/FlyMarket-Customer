import 'package:flymarket_customer/data/model/supermarket_model.dart';
import 'package:get/get.dart';

import '../../core/class/statuserequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handling_data_controller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/categores_all_data.dart';
import '../../data/datasource/remote/home_data.dart';

abstract class CategoriesAllController extends GetxController {
  getData();

  initialData();

  goToItemsAll(
      List categoriesAll,
      int selecteCatAll,
      String categoriesAllId,
      );
}

class CategoriesAllControllerImp extends CategoriesAllController {
  MyServices myServices = Get.find();

  String? username;
  String? id;

  CategoresAllData categoresAllData = CategoresAllData(Get.find());

  List data = [];
  List categoriesAll = [];
  List supermarket = [];
  List items = [];

  late StatusRequest statusRequest;

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {
    getData();
    initialData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loding;
    var response = await categoresAllData.getData();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categoriesAll.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
        print("222222222225555555555555555699999999999999");
      }
    } else {
      print("88888888888888888888888");
    }
    update();
  }

  @override
  goToItemsAll(categoriesAll,selecteCatAll, categoriesAllId) {
    Get.toNamed(
      AppRoute.itemsAll,
      arguments: {
        "categoriesAll": categoriesAll,
        "selecteCatAll": selecteCatAll,
        "categoriesAllId": categoriesAllId,
      },
    );
  }
}
