import 'package:flutter/material.dart';
import 'package:flymarket_customer/core/services/services.dart';
import 'package:flymarket_customer/data/datasource/remote/items_all_data.dart';
import 'package:get/get.dart';

import '../../core/class/statuserequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handling_data_controller.dart';
import '../../data/model/itemsmodel.dart';
import '../favorite/favorite_controller.dart';

abstract class ItemsAllController extends GetxController {
  initialData();

  changCat(int val, String catVal);

  getItems(String categoryId);

  goItemsAllDetails(ItemsModel itemsModel);
}

class ItemsAllControllerImp extends ItemsAllController {
  List supermarket = [];
  List categoriesAll = [];
  List itemsAll = [];
  String? categoriesAllId;
  int? selecteCatAll;
  MyServices myServices = Get.find();
  ItemsAllData itemsData = ItemsAllData(Get.find());

  List<ItemsModel> listData = [];
  TextEditingController? search;
  bool isSearch = false;

  List data = [];

  late StatusRequest statusRequest;

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  initialData() {
    categoriesAll = Get.arguments["categoriesAll"];
    selecteCatAll = Get.arguments["selecteCatAll"];
    categoriesAllId = Get.arguments["categoriesAllId"];
    search = TextEditingController();
    getItems(categoriesAllId!);
  }

  @override
  changCat(val, catVal) {
    selecteCatAll = val;
    categoriesAllId = catVal;
    getItems(categoriesAllId!);
    update();
  }

  @override
  getItems(categoryId) async {
    itemsAll.clear();
    statusRequest = StatusRequest.loding;
    var response = await itemsData.getData(
      categoryId,
      myServices.sharedPreferences.getString("id")!,

    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        itemsAll.addAll(response['data']);
        FavoriteController fav = Get.put(FavoriteController());
        //fav.initFavorites(data);
        fav.initFavorites(itemsAll);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  searchData() async {
    statusRequest = StatusRequest.loding;
    var response = await itemsData.searchData(search!.text);
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
    } else {
      isSearch = true;
      searchData();
    }
  }

  onSearchItem() {
    if (search!.text.trim().isEmpty) return;

    isSearch = true;
    searchData();
  }

  @override
  goItemsAllDetails(itemsModel) {
    Get.toNamed(AppRoute.itemsDetails, arguments: {"itemsmodel": itemsModel});
  }
}
