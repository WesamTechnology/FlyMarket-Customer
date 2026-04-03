
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statuserequest.dart';
import '../../core/constant/color.dart';
import '../../core/functions/handling_data_controller.dart';
import '../../core/functions/translate_database.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/orders/order_archive_data.dart';
import '../../data/model/orders/order_pending_model.dart';

class OrderArchiveController extends GetxController {

  OrderArchiveData orderArchiveData = OrderArchiveData(Get.find());

  MyServices myServices = Get.find();

  List<OrderPendingModel> listdata = [];

  late StatusRequest statusRequest;

  String printOrderType(String val) {
    if (val == "0") {
      return translateDatabase("توصيل", "Delivery");
    } else {
      return translateDatabase("استلام", "Pickup");
    }
  }

  String printPaymentMethod(String val) {
    if (val == "0") {
      return translateDatabase("الدفع عند الاستلام", "Cash On Delivery");
    } else {
      return translateDatabase("الدفع عبر محفظة جيب", "Payment via Jaib Wallet");
    }
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return translateDatabase("بانتظار الموافقة", "Await Approve");
    } else if (val == "1") {
      return translateDatabase("جاري تجهيز الطلب", "The Order is being Prepared");
    } else if (val == "2") {
      return translateDatabase("جاهز لاستلامه من المندوب", "Ready To Picked up by Delivery man");
    } else if (val == "3") {
      return translateDatabase("في الطريق", "On The Way");
    }else if (val == "5") {
      return translateDatabase("ملغي", "Cancelled");
    } else {
      return translateDatabase("الأرشيف", "Archive");
    }
  }

  Color getOrderStatusColor(String val) {
    if (val == "0") {
      return Colors.orange; // انتظار
    } else if (val == "1") {
      return Colors.blueAccent; // تجهيز
    } else if (val == "2") {
      return AppColor.primaryColor; // جاهز
    } else if (val == "3") {
      return Colors.purple; // في الطريق
    } else if (val == "5") {
      return Colors.red; // ملغي
    } else {
      return AppColor.primaryColor; // أرشيف
    }
  }


  getOrdersData() async {
    listdata.clear();
    statusRequest = StatusRequest.loding;
    update();
    var response = await orderArchiveData.getData(
      myServices.sharedPreferences.getString("id")!,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List resonseData = response['data'];
        listdata.addAll(resonseData.map((e) => OrderPendingModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }


  submentRating(String ordersId , String rating , String noteRating) async {
    listdata.clear();
    statusRequest = StatusRequest.loding;
    update();
    var response = await orderArchiveData.ratingData(
      ordersId,
      rating,
      noteRating,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        getOrdersData();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }


  refrehOrder(){
    getOrdersData();
  }

  @override
  void onInit() {
    getOrdersData();
    super.onInit();
  }

}