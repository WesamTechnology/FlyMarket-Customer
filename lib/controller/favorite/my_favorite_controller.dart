
import 'package:get/get.dart';

import '../../core/class/statuserequest.dart';
import '../../core/functions/handling_data_controller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/my_favorite_data.dart';
import '../../data/model/my_favorite_model.dart';



class MyFavoriteController extends GetxController {
  MyFavoriteData myFavoriteData = MyFavoriteData(Get.find());

  MyServices myServices = Get.find();

  List<MyFavoriteModel> data = [];

  late StatusRequest statusRequest;

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loding;
    var response = await myFavoriteData.getData(
      myServices.sharedPreferences.getString("id")!,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List resonseData = response['data'];
        data.addAll(resonseData.map((e) => MyFavoriteModel.fromJson(e)));
        print("===================================== Data = $data");
        //data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteFromFavorite(String favoriteId)  {
    var response =  myFavoriteData.deleteFromFavorite(favoriteId);
    data.removeWhere((element) => element.favoriteId.toString() == favoriteId);
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
