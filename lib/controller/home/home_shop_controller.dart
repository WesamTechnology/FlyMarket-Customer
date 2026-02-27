import 'package:flymarket_customer/data/model/supermarket_model.dart';
import 'package:get/get.dart';

import '../../core/class/statuserequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handling_data_controller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/home_data.dart';

abstract class HomeShopController extends GetxController {
  getData();

  initialData();

  goToCategories(
    List supermarket,
    int selectedsuper,
    String supermarketId,
    SupermarketModel supermarketModel,
  );
}

class HomeShopControllerImp extends HomeShopController {
  MyServices myServices = Get.find();

  String? username;
  String? id;

  HomeData homeData = HomeData(Get.find());

  List data = [];
  List categories = [];
  List supermarket = [];
  List items = [];

  late StatusRequest statusRequest;

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username");
    username = myServices.sharedPreferences.getString("phone");
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {
    getData();
    initialData();
    super.onInit();
  }
  refreshPage(){
    supermarket.clear();
    categories.clear();
    items.clear();
    getData();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loding;
    update();
    var response = await homeData.getData();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        supermarket.addAll(response['supermarket']['data']);
        categories.addAll(response['categories']['data']);
        items.addAll(response['items']['data']);
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
  goToCategories(supermarket,selectedsuper, supermarketId,supermarketModel) {
    Get.toNamed(
      AppRoute.supermarketDetailsPage,
      arguments: {
        "supermarket": supermarket,
        "selectedsuper": selectedsuper,
        "superid": supermarketId,
        "supermarketModel":supermarketModel
      },
    );
  }
}
