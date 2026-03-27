
import 'package:flymarket_customer/data/model/itemsmodel.dart';
import 'package:get/get.dart';

import '../../core/class/statuserequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handling_data_controller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/my_favorite_data.dart';
import '../../data/model/my_favorite_model.dart';
import 'favorite_controller.dart';



class MyFavoriteController extends GetxController {
  MyFavoriteData myFavoriteData = MyFavoriteData(Get.find());

  MyServices myServices = Get.find();
  List items = [];

  List<MyFavoriteModel> data = [];

  late StatusRequest statusRequest;

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loding;
    update();
    var response = await myFavoriteData.getData(
      myServices.sharedPreferences.getString("id")!,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List resonseData = response['data'];
        //items.addAll(response['data']);
        data.addAll(resonseData.map((e) => MyFavoriteModel.fromJson(e)));
        //  FavoriteController fav = Get.put(FavoriteController());
        // // fav.initFavorites(resonseData);
        //        fav.initFavorites(items);
        print("===================================== Data = $data");
        //getItems();
        //data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  // getItems() async {
  //   items.clear();
  //   statusRequest = StatusRequest.loding;
  //   var response = await myFavoriteData.getItemsDetails(
  //     myServices.sharedPreferences.getString("id")!,
  //     data.first.itmesId.toString(),
  //   );
  //   statusRequest = handlingData(response);
  //   if (StatusRequest.success == statusRequest) {
  //     if (response['status'] == "success") {
  //       items.addAll(response['data']);
  //       FavoriteController fav = Get.put(FavoriteController());
  //       //fav.initFavorites(data);
  //       fav.initFavorites(items);
  //     } else {
  //       statusRequest = StatusRequest.failure;
  //     }
  //   }
  //   update();
  // }

  deleteFromFavorite(String favoriteId)  {
    var response =  myFavoriteData.deleteFromFavorite(favoriteId);
    data.removeWhere((element) => element.favoriteId.toString() == favoriteId);
    update();
  }

  refreshPage(){
    data.clear();
    getData();
  }

  goToItemsDetails(MyFavoriteModel fav) {

    ItemsModel item = ItemsModel(
      itmesId: fav.itmesId,
      itmesName: fav.itmesName,
      itmesNameAr: fav.itmesNameAr,
      itmesDesc: fav.itmesDesc,
      itmesDescAr: fav.itmesDescAr,
      itmesImage: fav.itmesImage,
      itmesCount: fav.itmesCount,
      itmesActive: fav.itmesActive,
      itmesPrice: fav.itmesPrice,
      itmesDiscount: fav.itmesDiscount,
      itemspricedisount: fav.itemspricedisount,
      itmesDate: fav.itmesDate,
      itmesCat: fav.itmesCat,
      itmesCatAll: fav.itmesCatAll,
      itmesSuper: fav.itmesSuper,
      supermarketName: fav.supermarketName,
      supermarketNameAr: fav.supermarketNameAr,
    );

    Get.toNamed(AppRoute.itemsDetails, arguments: {"itemsmodel": item});
  }

  @override
  void onInit() {
    //getData();
   // getItems();
    super.onInit();
  }
}
