
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statuserequest.dart';
import '../../core/functions/handling_data_controller.dart';
import '../../core/functions/translate_database.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/orders/order_pending_data.dart';
import '../../data/model/orders/order_pending_model.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class OrderPendingController extends GetxController {

  OrderPendingData orderPendingData = OrderPendingData(Get.find());

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
      return translateDatabase("بطاقة الدفع", "Payment Card");
    }
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return translateDatabase("بانتظار الموافقة", "Await Approve");
    } else if (val == "1") {
      return translateDatabase("جاري التجهيز", "Preparing");
    } else if (val == "2") {
      return translateDatabase("جاهز", "Ready");
    } else if (val == "3") {
      return translateDatabase("في الطريق", "On The Way");
    } else {
      return translateDatabase("الأرشيف", "Archive");
    }
  }


  getOrdersData() async {
    listdata.clear();
    statusRequest = StatusRequest.loding;
    update();
    var response = await orderPendingData.getData(
      myServices.sharedPreferences.getString("id")!,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List resonseData = response['data'];
        listdata.addAll(resonseData.map((e) => OrderPendingModel.fromJson(e)));
        listdata.sort((a, b) => b.ordersId!.compareTo(a.ordersId!));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteOrder(String orderId) async {
    listdata.clear();
    statusRequest = StatusRequest.loding;
    update();
    var response = await orderPendingData.deleteData(
      orderId,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        refrehOrder();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }


  chooseImageAndUpload(String orderId) async {
    final ImagePicker picker = ImagePicker();

    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        height: 180,
        decoration: BoxDecoration(
          color: Get.theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            Text("اختر طريقة رفع الصورة", style: TextStyle(fontSize: 16)),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                /// 📸 كاميرا
                ElevatedButton.icon(
                  onPressed: () async {
                    Get.back();
                    await _pickAndUpload(orderId, ImageSource.camera);
                  },
                  icon: Icon(Icons.camera_alt),
                  label: Text("كاميرا"),
                ),

                /// 🖼️ معرض
                ElevatedButton.icon(
                  onPressed: () async {
                    Get.back();
                    await _pickAndUpload(orderId, ImageSource.gallery);
                  },
                  icon: Icon(Icons.image),
                  label: Text("المعرض"),
                ),
              ],
            )
          ],
        ),
      ),
    );
    print("UPLOAD STARTED 🔥");

  }

  _pickAndUpload(String orderId, ImageSource source) async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(
      source: source,
      imageQuality: 70,
    );

    if (image == null) return;

    File file = File(image.path);

    statusRequest = StatusRequest.loding;
    update();

    var response = await orderPendingData.uploadPaymentImage(orderId, file);

    print("UPLOAD RESPONSE: $response");

    if (response.toString().contains("success")) {
      Get.snackbar("نجاح", "تم إرسال صورة الدفع");
      refrehOrder();
    } else {
      Get.snackbar("خطأ", "فشل رفع الصورة");
    }

    if (StatusRequest.success == statusRequest) {
      Get.snackbar("نجاح", "تم إرسال صورة الدفع");
      refrehOrder();
    } else {
      Get.snackbar("خطأ", "فشل رفع الصورة");
    }
    print("RESPONSE: $response");

    update();
  }



  refrehOrder(){
    listdata.clear();
    getOrdersData();
  }

  @override
  void onInit() {
  getOrdersData();
    super.onInit();
  }

}