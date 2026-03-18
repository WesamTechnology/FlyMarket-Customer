
import 'package:get/get.dart';

import '../../core/class/statuserequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/get_distance_osrm.dart';
import '../../core/functions/handling_data_controller.dart';
import '../../core/functions/translate_database.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/address/address_data.dart';
import '../../data/datasource/remote/checkout/checkout_data.dart';
import '../../data/model/address/address_view_model.dart';
import '../../data/model/cart_model.dart';

class CheckoutController extends GetxController {
  String? paymentChoos;
  String? deliveryChoos;
  String? addressChoos = "0";
  StatusRequest statusRequest = StatusRequest.none;

  AddressData addressData = Get.put(AddressData(Get.find()));
  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));
  MyServices myServices = Get.find();
  List<AddressViewModel> listDataAddress = [];
  late List<CartModel> cartList;
  double deliveryPrice = 0.0;
  bool isLoadingPrice = false;

  late String couponId;
  late String priceOrder;
  late String coupondiscount;
  late String supermarketId;

  choosePaymentMethod(String value) {
    paymentChoos = value;
    update();
  }

  chooseDeliveryMethod(String value)async  {
    deliveryChoos = value;
    if (value == "0" && addressChoos != "0") {
      await calculatePriceLive();
    }
    if (value == "1") {
      deliveryPrice = 0;
    }
    update();
  }

  chooseAddress(String value)async {
    addressChoos = value;
    await calculatePriceLive();
    update();
  }

  getShippingAddress() async {
    statusRequest = StatusRequest.loding;
    update();
    var response = await addressData.getData(
      myServices.sharedPreferences.getString("id")!,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listData = response['data'];
        listDataAddress.addAll(
          listData.map((e) => AddressViewModel.fromJson(e)),
        );
      } else {
        print("================== خطأ في عرض الموقع او لايوجد ===================");

       // statusRequest = StatusRequest.failure;
      }
    } else {
      print("================== خطأ في الادرس ===================");
    }
    update();
  }


  checkout() async {
    if (paymentChoos == null) return Get.snackbar(
        translateDatabase("تنبيه", "Alert"),
        translateDatabase("الرجاء اختيار وسيلة الدفع", "Please choose a payment method"),
      );

    if (deliveryChoos == null) return Get.snackbar(
        translateDatabase("تنبيه", "Alert"),
        translateDatabase("الرجاء اختيار التوصيل", "Please choose delivery type"),
      );

    if (listDataAddress.isEmpty) return Get.snackbar(
        translateDatabase("تنبيه", "Alert"),
        translateDatabase("الرجاء اختيار موقع التوصيل", "Please choose delivery location"),
      );
    // 🔥 خذ العنوان المختار مش أول واحد
    final selectedAddress = listDataAddress.firstWhere(
          (e) => e.addressId.toString() == addressChoos,
    );

    if (deliveryChoos == "0" && deliveryPrice == 0) {
      return Get.snackbar("تنبيه", "انتظر حساب سعر التوصيل");
    }
    statusRequest = StatusRequest.loding;
    update();

    Map data = {
      "usersid": myServices.sharedPreferences.getString("id")!,
      "addressid": addressChoos.toString(),
      "supermarketid": supermarketId.toString(),
      "orderstype": deliveryChoos.toString(),
      "pricedelivery": deliveryPrice.toStringAsFixed(0),
      "ordersprice": priceOrder.toString(),
      "couponid":  couponId.toString(),
      "paymentmethod": paymentChoos.toString(),
      "coupondiscount": coupondiscount.toString(),
    };


    var response = await checkoutData.getData(data);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (paymentChoos == null) return Get.snackbar(
          translateDatabase("تنبيه", "Alert"),
          translateDatabase("الرجاء اختيار وسيلة الدفع", "Please choose a payment method"),
        );

        if (deliveryChoos == null) return Get.snackbar(
          translateDatabase("تنبيه", "Alert"),
          translateDatabase("الرجاء اختيار التوصيل", "Please choose delivery type"),
        );

        if (listDataAddress.isEmpty) return Get.snackbar(
          translateDatabase("تنبيه", "Alert"),
          translateDatabase("الرجاء اختيار موقع التوصيل", "Please choose delivery location"),
        );
        Get.offAllNamed(AppRoute.homepage);
        //Get.snackbar("نجح", "يمكنك الان الطلب الى هاذا الموقع");

        Get.snackbar(
          translateDatabase("نجح", "Success"),
          translateDatabase("تمت العملية بنجاح", "Operation completed successfully"),
        );
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar(
          translateDatabase("خطأ", "Error"),
          translateDatabase("الرجاء المحاولة مرة أخرى", "Please try again"),
        );
      }
    } else {
      print("================== خطأ في الادرس ===================");
    }
    update();
  }

  Future<double> calculateDeliveryPrice({
    required double userLat,
    required double userLng,
    required List<Map<String, double>> supermarkets,
  }) async {

    double maxDistance = 0;

    for (var market in supermarkets) {
      double distance = await getDistanceOSRM(
        startLat: market['lat']!,
        startLng: market['lng']!,
        endLat: userLat,
        endLng: userLng,
      );

      if (distance > maxDistance) {
        maxDistance = distance;
      }
    }

// تحويل إلى كم
    double km = maxDistance / 1000;

// السعر
    double price = km * 85;
    price = (price / 5).ceil() * 5;

    return price;
  }
  List<Map<String, double>> getSupermarketsLocations() {
    final unique = <int, Map<String, double>>{};

    for (var item in cartList) {
      if (item.supermarketId != null &&
          item.supermarketLat != null &&
          item.supermarketLong != null) {

        unique[item.supermarketId!] = {
          "lat": item.supermarketLat!,
          "lng": item.supermarketLong!,
        };
      }
    }

    return unique.values.toList();
  }

  Future<void> calculatePriceLive() async {
    if (addressChoos == "0") return;

    isLoadingPrice = true;
    update();

    final selectedAddress = listDataAddress.firstWhere(
          (e) => e.addressId.toString() == addressChoos,
    );

    double price = await calculateDeliveryPrice(
      userLat: selectedAddress.addressLat!,
      userLng: selectedAddress.addressLong!,
      supermarkets: getSupermarketsLocations(),
    );

    // حد أدنى
    if (price < 250) price = 250;

    deliveryPrice = price;

    isLoadingPrice = false;
    update();
  }

  @override
  void onInit() {

    couponId = Get.arguments['couponid'] ?? "0";
    priceOrder = Get.arguments['priceorder'];
    coupondiscount = Get.arguments['discountcoupon'].toString();
    supermarketId = Get.arguments["supermarketid"];
    cartList = Get.arguments['cartList'];
    getShippingAddress();
    super.onInit();
  }
}
