
import 'package:get/get.dart';

import '../../core/class/statuserequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handling_data_controller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/address/address_data.dart';
import '../../data/datasource/remote/checkout/checkout_data.dart';
import '../../data/model/address/address_view_model.dart';

class CheckoutController extends GetxController {
  String? paymentChoos;
  String? deliveryChoos;
  String? addressChoos = "0";
  StatusRequest statusRequest = StatusRequest.none;

  AddressData addressData = Get.put(AddressData(Get.find()));
  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));
  MyServices myServices = Get.find();
  List<AddressViewModel> listDataAddress = [];

  late String couponId;
  late String priceOrder;
  late String coupondiscount;
  late String supermarketId;

  choosePaymentMethod(String value) {
    paymentChoos = value;
    update();
  }

  chooseDeliveryMethod(String value) {
    deliveryChoos = value;
    update();
  }

  chooseAddress(String value) {
    addressChoos = value;
    update();
  }

  getShippingAddress() async {
    statusRequest = StatusRequest.loding;
    update();
    var response = await addressData.getData(
      myServices.sharedPreferences.getString("id")!,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listData = response['data'];
        listDataAddress.addAll(
          listData.map((e) => AddressViewModel.fromJson(e)),
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      print("================== خطأ في الادرس ===================");
    }
    update();
  }

  checkout() async {
    if(paymentChoos == null) return Get.snackbar("تنبية", "الرجاء اختيار وسيلة الدفع");
    if(deliveryChoos == null) return Get.snackbar("تنبية", "الرجاء اختيار التوصيل");
    statusRequest = StatusRequest.loding;
    update();

    Map data = {
      "usersid": myServices.sharedPreferences.getString("id")!,
      "addressid": addressChoos.toString(),
      "supermarketid": supermarketId.toString(),
      "orderstype": deliveryChoos.toString(),
      "pricedelivery": "10",
      "ordersprice": priceOrder.toString(),
      "couponid":  couponId.toString(),
      "paymentmethod": paymentChoos.toString(),
      "coupondiscount": coupondiscount.toString(),
    };


    var response = await checkoutData.getData(data);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if(paymentChoos == null) return Get.snackbar("تنبية", "الرجاء اختيار وسيلة الدفع");
        if(deliveryChoos == null) return Get.snackbar("تنبية", "الرجاء اختيار التوصيل");
        Get.offAllNamed(AppRoute.homepage);
        Get.snackbar(
            "نجح",
            "تم العملية بنجاح"
        );
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar("خطأ", "الرجاءالمحاولة مره اخرى");
      }
    } else {
      print("================== خطأ في الادرس ===================");
    }
    update();
  }

  @override
  void onInit() {

    couponId = Get.arguments['couponid'] ?? "0";
    priceOrder = Get.arguments['priceorder'];
    coupondiscount = Get.arguments['discountcoupon'].toString();
    supermarketId = Get.arguments["supermarketid"];
    getShippingAddress();
    super.onInit();
  }
}
