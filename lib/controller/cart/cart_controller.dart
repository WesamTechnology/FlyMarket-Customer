
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../core/class/statuserequest.dart';
import '../../core/functions/handling_data_controller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/cart_data.dart';
import '../../data/model/cart_model.dart';


class CartController extends GetxController {
  CartData cartData = CartData(Get.find());

  MyServices myServices = Get.find();

  List<CartModel> data = [];
  int priceOrder = 0;
  int totalCountItems = 0;

  late StatusRequest statusRequest;

  add(itemsID) async {
    statusRequest = StatusRequest.loding;
    update();
    var response = await cartData.addCart(
      myServices.sharedPreferences.getString("id")!,
      itemsID,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
          title: "اشعار",
          messageText: Text("تم اضافه المنتج الى السله"),
        );
        //data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  delete(itemsID) async {
    statusRequest = StatusRequest.loding;
    update();
    var response = await cartData.deleteCart(
      myServices.sharedPreferences.getString("id")!,
      itemsID,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
          title: "اشعار",
          messageText: Text("تم حذف المنتج من السله"),
        );
        //data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getCountItems(itemsID) async {
    statusRequest = StatusRequest.loding;
    var response = await cartData.getCountItems(
      myServices.sharedPreferences.getString("id")!,
      itemsID,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        int count = response['data'] ?? 0;
        print("============================== Count = $count");
        return count;
        //data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  resetVarCart() {
    totalCountItems = 0;
    priceOrder = 0;
    data.clear();
  }

  refreshPage(){
    resetVarCart();
    view();
  }

  view() async {
    statusRequest = StatusRequest.loding;
    update();

    var response = await cartData.viewCart(
      myServices.sharedPreferences.getString("id")!,
    );

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if(response['datacart']['status'] == "success"){
          data.clear();

          List dataResponse = response['datacart']['data'];
          Map dataResponseCountPrice = response['countprice'];

          data.addAll(dataResponse.map((e) => CartModel.fromJson(e)));

          totalCountItems = dataResponseCountPrice['totalcount'] ?? 0;
          priceOrder = dataResponseCountPrice['totalprice'] ?? 0;

          print("✅ Count = $totalCountItems");
          print("✅ Price = $priceOrder");

          update();
        }

      } else {
        statusRequest = StatusRequest.failure;
        update();
      }
    }
    update();
  }

  @override
  void onInit() {
    view();
    super.onInit();
  }
}
