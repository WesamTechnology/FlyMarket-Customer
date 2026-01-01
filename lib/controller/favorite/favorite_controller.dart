
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statuserequest.dart';
import '../../core/functions/handling_data_controller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/favorite_data.dart';

class FavoriteController extends GetxController {

  Map<int, int> isFavorite = {};

  FavoriteData favoriteData = FavoriteData(Get.find());

  MyServices myServices = Get.find();

  List items = [];

  late StatusRequest statusRequest ;




  void initFavorites(List items) {
    for (var item in items) {
      isFavorite[item["itmes_id"]] = item["favorite"];
    }
    update();
  }

  void setFavorite(int id, int val) {
    isFavorite[id] = val;
    update();
  }




  addFavorite( itemsID) async{
    items.clear();
    statusRequest = StatusRequest.loding;
    var response = await favoriteData.addFavorite(
        myServices.sharedPreferences.getString("id")!,itemsID);
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest){
      if(response['status'] == "success"){
        Get.rawSnackbar( title: "اشعار" , messageText: Text("تم اضافه المنتج الى المفضله"));
        //data.addAll(response['data']);
      }else{
      statusRequest = StatusRequest.failure;
      }
    }
    update();
  }


  removeFavorite( itemsID) async{
    items.clear();
    statusRequest = StatusRequest.loding;
    var response = await favoriteData.removeFavorite(
        myServices.sharedPreferences.getString("id")!,itemsID);
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest){
      if(response['status'] == "success"){
        Get.rawSnackbar( title: "اشعار" , messageText: Text("تم حذف المنتج من المفضله"));
        //data.addAll(response['data']);
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

}
