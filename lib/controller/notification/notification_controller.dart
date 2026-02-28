
import 'package:get/get.dart';

import '../../core/class/statuserequest.dart';
import '../../core/functions/handling_data_controller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/notification/notification_data.dart';

class NotificationController extends GetxController {

  MyServices myServices = Get.find();
  NotificationData notificationData = NotificationData(Get.find());
  List data = [];
  late StatusRequest statusRequest;


  getData() async {
    statusRequest = StatusRequest.loding;
    var response = await notificationData.getData(myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      print("88888888888888888888888");
    }
    update();
  }


  @override
  void onInit() {
    getData();
    super.onInit();
  }


}