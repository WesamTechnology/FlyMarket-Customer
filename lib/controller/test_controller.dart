
import 'package:get/get.dart';

import '../core/class/statuserequest.dart';
import '../core/functions/handling_data_controller.dart';
import '../data/datasource/remote/test_data.dart';

class TestController extends GetxController {
  TestData testData = TestData(Get.find());

  List data = [];
  
  late StatusRequest statusRequest ;

  getData () async {
    statusRequest = StatusRequest.loding;
    var response = await testData.getData();
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest){
      data.addAll(response['data']);
    }
    update();
  }

  @override
  void onInit() {
   getData();
    super.onInit();
  }

}