import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statuserequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handling_data_controller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/items_data.dart';
import '../../data/model/itemsmodel.dart';
import '../favorite/favorite_controller.dart';

abstract class ItemsController extends GetxController {
  initialData();

  changCat(int val, String catVal);

  getItems(String categoryId, String supermarket_id);

  searchData(String supermarket_id);

  goToItemsDetails(ItemsModel itemsModel);
}

class ItemsControllerImp extends ItemsController {
  List supermarket = [];
  List categories = [];
  List items = [];
  String? catid;
  String? superid;
  int? selectedCat;
  MyServices myServices = Get.find();
  ItemsData itemsData = ItemsData(Get.find());

  TextEditingController? search;
  bool isSearch = false;
  List<ItemsModel> listData = [];

  List data = [];

  late StatusRequest statusRequest;

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  initialData() {
    categories = Get.arguments["categories"];
    selectedCat = Get.arguments["selectedCat"];
    catid = Get.arguments["categoryId"];
    superid = Get.arguments["supermarket"];
    search = TextEditingController();
    getItems(catid!, superid!);
  }

  @override
  changCat(val, catVal) {
    selectedCat = val;
    catid = catVal;
    getItems(catid!, superid!);
    update();
  }

  @override
  getItems(categoryId, supermarket_id) async {
    items.clear();
    statusRequest = StatusRequest.loding;
    var response = await itemsData.getData(categoryId, supermarket_id);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        items.addAll(response['data']);
        FavoriteController fav = Get.find();
        fav.initFavorites(data);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  searchData(supermarket_id) async {
    statusRequest = StatusRequest.loding;
    var response = await itemsData.searchData(search!.text, supermarket_id);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listData.clear();

        List responseListData = response['data'];
        listData.addAll(responseListData.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      print("88888888888888888888888");
    }
    update();
  }


  checkSearch(val) {
    if (val.isEmpty) {
      isSearch = false;
      listData.clear();
      update();
    }else{
      isSearch = true;
      searchData(superid!);
    }
  }

  onSearchItem() {
    if (search!.text.trim().isEmpty) return;

    isSearch = true;
    searchData(superid!);
  }




  @override
  goToItemsDetails(itemsModel) {
    Get.toNamed(AppRoute.itemsDetails, arguments: {"itemsmodel": itemsModel});
  }
}
