
import 'package:get/get.dart';

import '../../core/class/statuserequest.dart';
import '../../core/functions/handling_data_controller.dart';
import '../../core/functions/translate_database.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/orders/order_pending_data.dart';
import '../../data/model/orders/order_pending_model.dart';

class OrderPendingController extends GetxController {

  OrderPendingData orderPendingData = OrderPendingData(Get.find());

  MyServices myServices = Get.find();

  List<OrderPendingModel> listdata = [];

  late StatusRequest statusRequest;
  String printOrderType(String val) {
    if (val == "0") {
      return translateDatabase("توصيل", "Delivery");
    } else {
      return translateDatabase("استلام", "Pickup");
    }
  }

  String printPaymentMethod(String val) {
    if (val == "0") {
      return translateDatabase("الدفع عند الاستلام", "Cash On Delivery");
    } else {
      return translateDatabase("بطاقة الدفع", "Payment Card");
    }
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return translateDatabase("بانتظار الموافقة", "Await Approve");
    } else if (val == "1") {
      return translateDatabase("جاري التجهيز", "Preparing");
    } else if (val == "2") {
      return translateDatabase("جاهز", "Ready");
    } else if (val == "3") {
      return translateDatabase("في الطريق", "On The Way");
    } else {
      return translateDatabase("الأرشيف", "Archive");
    }
  }


  getOrdersData() async {
    listdata.clear();
    statusRequest = StatusRequest.loding;
    update();
    var response = await orderPendingData.getData(
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

  deleteOrder(String orderId) async {
    listdata.clear();
    statusRequest = StatusRequest.loding;
    update();
    var response = await orderPendingData.deleteData(
      orderId,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        refrehOrder();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }


  refrehOrder(){
    listdata.clear();
    getOrdersData();
  }

  @override
  void onInit() {
  getOrdersData();
    super.onInit();
  }

}