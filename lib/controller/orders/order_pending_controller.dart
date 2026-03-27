
import 'package:flutter/material.dart';
import 'package:flymarket_customer/core/constant/color.dart';
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
      return translateDatabase("الدفع عبر محفظة جيب", "Payment via Jaib Wallet");
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
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              /// 🔹 Handle (الشريط الصغير فوق)
              Container(
                width: 40,
                height: 5,
                margin: const EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              /// 🔹 العنوان
              Text(
                "الدفع عبر محفظة جيب",
                style: TextStyle(
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 15),

              /// 🔹 كارد معلومات المندوب
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.person, color: AppColor.primaryColor),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            "اسم المندوب: ${listdata.first.deliveryName}",
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    Row(
                      children: [
                        Icon(Icons.account_balance_wallet,
                            color: AppColor.primaryColor),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            "رقم المحفظة: ${listdata.first.deliveryPayNumber}",
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              /// 🔹 تنبيه بسيط
              Text(
                "قم بتحويل المبلغ ثم أرسل صورة إثبات الدفع",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 20),

              /// 🔹 أزرار الرفع
              Row(
                children: [

                  /// 📸 كاميرا
                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () async {
                        Get.back();
                        await _pickAndUpload(orderId, ImageSource.camera);
                      },
                      icon: const Icon(Icons.camera_alt, color: Colors.white),
                      label: const Text("كاميرا",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),

                  const SizedBox(width: 10),

                  /// 🖼️ معرض
                  Expanded(
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade700,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () async {
                        Get.back();
                        await _pickAndUpload(orderId, ImageSource.gallery);
                      },
                      icon: const Icon(Icons.image, color: Colors.white),
                      label: const Text("المعرض",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),
            ],
          ),
        )
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