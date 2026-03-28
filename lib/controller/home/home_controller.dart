
import 'package:get/get.dart';

import '../../core/services/services.dart';
import '../../data/datasource/remote/auth/login_data.dart';

class HomeController extends GetxController {
  LoginData loginData = LoginData(Get.find());
  MyServices myServices = Get.find();

  var deliveryStatus = "1".obs;

  Future<void> getDriverStatus() async {
    String userId = myServices.sharedPreferences.getString("id")!;

    var response = await loginData.getViewUser(userId);

    if (response['status'] == "success") {
      String newStatus = response['data'][0]['users_approve'].toString();

      deliveryStatus.value = newStatus;

      // تحديث التخزين (اختياري)
      myServices.sharedPreferences.setString("approve", newStatus);
    }
  }

  @override
  void onInit() {
    getDriverStatus();

    // تحديث كل 10 ثواني
    startAutoRefresh();

    super.onInit();
  }

  void startAutoRefresh() {
    Future.delayed(Duration(seconds: 10), () async {
      await getDriverStatus();
      startAutoRefresh();
    });
  }
}