
import 'package:flymarket_customer/data/datasource/remote/items_all_data.dart';
import 'package:get/get.dart';

import '../../core/class/statuserequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handling_data_controller.dart';
import '../../data/model/itemsmodel.dart';


abstract class ItemsAllController extends GetxController {
  initialData();
  changCat(int val,String catVal);
  getItems(String categoryId);
  goItemsAllDetails(ItemsModel itemsModel);
}

class ItemsAllControllerImp extends ItemsAllController {

  List supermarket = [];
  List categoriesAll = [];
  List itemsAll = [];
  String? categoriesAllId;
  int? selecteCatAll;

  ItemsAllData itemsData = ItemsAllData(Get.find());

  List data = [];

  late StatusRequest statusRequest ;



  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  initialData() {
    categoriesAll = Get.arguments["categoriesAll"];
    selecteCatAll = Get.arguments["selecteCatAll"];
    categoriesAllId = Get.arguments["categoriesAllId"];
    getItems(categoriesAllId!);

  }



  @override
  changCat(val,catVal) {
    selecteCatAll = val;
    categoriesAllId = catVal;
    getItems(categoriesAllId!);
    update();
  }

  @override
  getItems(categoryId) async {
    itemsAll.clear();
    statusRequest = StatusRequest.loding;
    var response = await itemsData.getData(categoryId);
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest){
      if(response['status'] == "success"){
        itemsAll.addAll(response['data']);
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goItemsAllDetails(itemsModel) {
    Get.toNamed(AppRoute.itemsDetails,arguments: {
      "itemsmodel": itemsModel,
    });
  }

}