
import 'package:get/get.dart';

import '../../data/model/itemsmodel.dart';

abstract class ProductdetailsController extends GetxController {
  initialData();
}

class ProductdetailsControllerImp extends ProductdetailsController {

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