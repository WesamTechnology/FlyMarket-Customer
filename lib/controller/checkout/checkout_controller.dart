import 'package:get/get.dart';

import '../../core/class/statuserequest.dart';
import '../../core/functions/handling_data_controller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/address/address_data.dart';
import '../../data/model/address/address_view_model.dart';

class CheckoutController extends GetxController {

  String? paymentChoos;
  String? deliveryChoos;
  String? addressChoos;
  StatusRequest statusRequest = StatusRequest.none  ;
  AddressData addressData =Get.put(AddressData(Get.find()));
  MyServices myServices = Get.find();
  List<AddressViewModel> listDataAddress = [];

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
        myServices.sharedPreferences.getString("id")!
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listData = response['data'];
        listDataAddress.addAll(listData.map((e) => AddressViewModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      print("================== خطأ في الادرس ===================");
    }
    update();
  }


  @override
  void onInit() {
    getShippingAddress();
    super.onInit();
  }




}