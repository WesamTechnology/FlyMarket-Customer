
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../core/class/statuserequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handling_data_controller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/cart_data.dart';
import '../../data/model/cart_model.dart';
import '../../data/model/coupon/coupon_model.dart';


class CartController extends GetxController {
  CartData cartData = CartData(Get.find());

  MyServices myServices = Get.find();
  int? disCountCoupon = 0;
  String? couponname;
  String? couponId;
  CouponModel? couponModel ;

  TextEditingController? controllercoupon ;


  List<CartModel> data = [];
  int priceOrder = 0;
  int totalCountItems = 0;
  late int supermarketId ;
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
    update();
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
          supermarketId = data.first.itmesSuper!;

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




  checkCoupon() async {
    var response = await cartData.checkCoupon(
      controllercoupon!.text,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Map<String,dynamic> dataCoupon = response['data'];
        couponModel = CouponModel.fromJson(dataCoupon);
        disCountCoupon = couponModel!.couponDiscount!;
        couponname = couponModel!.couponName!;
        couponId = couponModel!.couponId!.toString();
      } else {
        disCountCoupon = 0;
        couponname = null;
        couponId = null;
      }
    }
    update();
  }
  goToCheckout(){
    if(data.isEmpty) return Get.snackbar("تنبية", "السلة فارغة");
    Get.toNamed(AppRoute.checkout,arguments: {
      "couponid" : couponId ?? "0",
      "priceorder" : priceOrder.toString(),
      "discountcoupon" : disCountCoupon.toString(),
      "supermarketid": supermarketId.toString(),
    });
  }


  getTotalPrice(){
    return (priceOrder - (priceOrder * disCountCoupon!)/100);
  }




  @override
  void onInit() {
    controllercoupon = TextEditingController();
    view();
    super.onInit();
  }
}
