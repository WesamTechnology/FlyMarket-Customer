
import 'package:flymarket_customer/data/model/itemsmodel.dart';
import 'package:get/get.dart';

abstract class ItemsDetailsController extends GetxController {
  initialData();
}

class ItemsDetailsControllerImp extends ItemsDetailsController {

  late ItemsModel itemsModel ;


  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  initialData() {
    itemsModel = Get.arguments["itemsmodel"];
  }
}