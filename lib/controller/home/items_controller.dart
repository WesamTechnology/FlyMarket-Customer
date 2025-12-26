
import 'package:get/get.dart';

import '../../core/class/statuserequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handling_data_controller.dart';
import '../../data/datasource/remote/items_data.dart';
import '../../data/model/itemsmodel.dart';



abstract class ItemsController extends GetxController {
  initialData();
  changCat(int val,String catVal);
  getItems(String categoryId,String supermarket_id);
  goToItemsDetails(ItemsModel itemsModel);
}

class ItemsControllerImp extends ItemsController {

  List supermarket = [];
  List categories = [];
  List items = [];
  String? catid;
  String? superid;
  int? selectedCat;

  ItemsData itemsData = ItemsData(Get.find());

  List data = [];

  late StatusRequest statusRequest ;



  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  initialData() {
    categories = Get.arguments["categories"];
    selectedCat = Get.arguments["selectedCat"];
    catid = Get.arguments["categoryId"];
    superid = Get.arguments["supermarket"];
    getItems(catid!,superid!);

  }



  @override
  changCat(val,catVal) {
    selectedCat = val;
    catid = catVal;
    getItems(catid!,superid!);
    update();
  }

  @override
  getItems(categoryId,supermarket_id) async {
    items.clear();
    statusRequest = StatusRequest.loding;
    var response = await itemsData.getData(categoryId,supermarket_id);
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest){
      if(response['status'] == "success"){
        items.addAll(response['data']);
      }else{
      statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToItemsDetails(itemsModel) {
    Get.toNamed(AppRoute.itemsDetails,arguments: {
      "itemsmodel": itemsModel,
    });
  }

}