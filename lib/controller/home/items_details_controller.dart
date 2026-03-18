
import 'package:flymarket_customer/data/model/itemsmodel.dart';
import 'package:get/get.dart';

import '../../core/class/statuserequest.dart';
import '../../core/functions/handling_data_controller.dart';
import '../../core/functions/translate_database.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/cart_data.dart';
import 'package:flutter/material.dart';

abstract class ItemsDetailsController extends GetxController {
  initialData();
}

class ItemsDetailsControllerImp extends ItemsDetailsController {

  late ItemsModel itemsModel ;



  CartData cartData = CartData(Get.find());

  MyServices myServices = Get.find();

  late StatusRequest statusRequest;
  //CartController cartController = Get.put(CartController());
  int count = 0;

  @override
  initialData() async {
    statusRequest = StatusRequest.loding;
    itemsModel = Get.arguments["itemsmodel"];
    count = await getCountItems(itemsModel.itmesId,itemsModel.itmesSuper);
    statusRequest = StatusRequest.success;
    update();
  }



  addItems(itemsID,superid) async {
    statusRequest = StatusRequest.loding;
    update();
    var response = await cartData.addCart(
      myServices.sharedPreferences.getString("id")!,
      itemsID,
        superid
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
          title: translateDatabase("إشعار", "Notification"),
          messageText: Text(translateDatabase("تم إضافة المنتج إلى السلة", "Item added to cart"),),
        );
        //data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteItems(itemsID,superid) async {
    statusRequest = StatusRequest.loding;
    update();
    var response = await cartData.deleteCart(
      myServices.sharedPreferences.getString("id")!,
      itemsID,
        superid
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
          title: "اشعار",
          messageText: Text(translateDatabase("تم حذف المنتج من السلة", "Item removed from cart"),),
        );
        //data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getCountItems(itemsID,superid) async {
    statusRequest = StatusRequest.loding;
    var response = await cartData.getCountItems(
      myServices.sharedPreferences.getString("id")!,
      itemsID,
        superid
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



  add(){
    addItems(itemsModel.itmesId,itemsModel.itmesSuper);
    count++;
    update();
  }

  delete(){
    if(count > 0){
      deleteItems(itemsModel.itmesId,itemsModel.itmesSuper);
      count--;
      update();
    }
  }




  @override
  void onInit() {
    initialData();
    super.onInit();
  }

}