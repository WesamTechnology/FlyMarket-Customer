
import 'package:get/get.dart';

import '../../core/class/statuserequest.dart';
import '../../core/functions/handling_data_controller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/orders/order_archive_data.dart';
import '../../data/model/orders/order_pending_model.dart';

class OrderArchiveController extends GetxController {

  OrderArchiveData orderArchiveData = OrderArchiveData(Get.find());

  MyServices myServices = Get.find();

  List<OrderPendingModel> listdata = [];

  late StatusRequest statusRequest;

  String printOrderType (String val){
    if(val == "0"){
      return "delivery";
    } else {
      return "pickup";

    }
  }
  String printPaymentMethod (String val){
    if(val == "0"){
      return "Cash On Delivery";
    } else {
      return "Payment Card";

    }
  }

  String printOrderStatus (String val){
    if(val == "0") {
      return "Await Approve";
    }
    else if(val == "1"){
      return "The Order is being Prepared ";
    } else if(val == "2"){
      return "Ready To Picked up by Delivery man";
    } else if (val == "3") {
      return "On The Way";
    }
    else{
      return "Archive";
    }
  }





  getOrdersData() async {
    listdata.clear();
    statusRequest = StatusRequest.loding;
    update();
    var response = await orderArchiveData.getData(
      myServices.sharedPreferences.getString("id")!,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List resonseData = response['data'];
        listdata.addAll(resonseData.map((e) => OrderPendingModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }


  submentRating(String ordersId , String rating , String noteRating) async {
    listdata.clear();
    statusRequest = StatusRequest.loding;
    update();
    var response = await orderArchiveData.ratingData(
      ordersId,
      rating,
      noteRating,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        getOrdersData();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }


  refrehOrder(){
    getOrdersData();
  }

  @override
  void onInit() {
    getOrdersData();
    super.onInit();
  }

}