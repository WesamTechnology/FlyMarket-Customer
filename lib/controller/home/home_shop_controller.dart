import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:flymarket_customer/core/constant/imgaeasset.dart';
import 'package:flymarket_customer/data/model/supermarket_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/class/statuserequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handling_data_controller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/home_data.dart';

abstract class HomeShopController extends GetxController {
  getData();

  initialData();

  goToCategories(
    List supermarket,
    int selectedsuper,
    String supermarketId,
    SupermarketModel supermarketModel,
  );
}

class HomeShopControllerImp extends HomeShopController {
  MyServices myServices = Get.find();

  String? username;
  String? phone;
  String? id;

  HomeData homeData = HomeData(Get.find());

  List data = [];
  List categories = [];
  List supermarket = [];
  List items = [];
  List banners = [];

  double? userLat;
  double? userLng;

  GoogleMapController? gmc;
  List<Marker> markers = [];
  List<Circle> circles = [];

  Map? selectedMarket;

  BitmapDescriptor? userIcon;
  double userRotation = 0;

  StatusRequest statusRequest = StatusRequest.loding;

  @override
  initialData() async {
    username = myServices.sharedPreferences.getString("username");
    phone = myServices.sharedPreferences.getString("phone");
    id = myServices.sharedPreferences.getString("id");
    await getUserLocation();
  }

  @override
  void onInit() {
    super.onInit();

    init();
  }

  void init() async {
    userIcon = await BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(80, 85)),
      AppImageAsset.circleMap5,
    );
    await initialData();
    listenToCompass();
    FirebaseMessaging.instance.subscribeToTopic("users");
    FirebaseMessaging.instance.subscribeToTopic("users${id}");
    print("==============USER ID = $id");
    print("==============SUBSCRIBE users$id");
    await getData();
  }

  refreshPage() {
    supermarket.clear();
    categories.clear();
    items.clear();
    getData();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loding;
    update();
    var response = await homeData.getData();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        supermarket.clear();
        supermarket.addAll(response['supermarket']['data']);
        sortSupermarketsByDistance();
        generateMarkers();
        moveToNearest();
        categories.addAll(response['categories']['data']);
        items.addAll(response['items']['data']);
        if (response['banners']?['status'] == "success") {
          banners.clear();
          banners.addAll(response['banners']['data']);
        } else {
          banners.clear();
        }
      } else {
        statusRequest = StatusRequest.failure;
        print("222222222225555555555555555699999999999999");
      }
    } else {
      print("88888888888888888888888");
    }
    update();
  }

  Future<void> getUserLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();

    LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 10,
    );

    Position position = await Geolocator.getCurrentPosition(
      locationSettings: locationSettings,
    );

    userLat = position.latitude;
    userLng = position.longitude;

    print("📍 USER LOCATION: $userLat , $userLng");
  }

  double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    return Geolocator.distanceBetween(lat1, lon1, lat2, lon2); // بالمتر
  }

  void sortSupermarketsByDistance() {
    if (userLat == null || userLng == null) return;

    for (var market in supermarket) {
      double lat = double.parse(market['supermarket_lat'].toString());
      double lng = double.parse(market['supermarket_long'].toString());

      double distance = calculateDistance(userLat!, userLng!, lat, lng);

      market['distance'] = distance; // 🔥 خزنها
    }

    supermarket.sort((a, b) {
      return a['distance'].compareTo(b['distance']);
    });
  }

  void generateMarkers() {
    markers.clear();


    if (userLat != null && userLng != null && userIcon != null) {
      markers.add(
        Marker(
          markerId: MarkerId("user_location"),
          position: LatLng(userLat!, userLng!),
          icon: userIcon!,
          anchor: Offset(0.5, 0.5), // يخليه في النص
          flat: true, // مهم للاتجاه
          rotation: userRotation, // بنعدلها لاحقاً
        ),
      );
    }


    // 🔵 موقع المستخدم كدائرة
    // if (userLat != null && userLng != null) {
    //   // circles.removeWhere((c) => c.circleId.value == "user_circle");
    //   //
    //   // circles.add(
    //   //   Circle(
    //   //     circleId: CircleId("user_circle"),
    //   //     center: LatLng(userLat!, userLng!),
    //   //     radius: 50,
    //   //     // حجم الدائرة (متر)
    //   //     fillColor: Colors.blue.withValues(alpha: 0.8),
    //   //     strokeColor: Colors.blue,
    //   //     strokeWidth: 2,
    //   //   ),
    //   // );
    // }

    for (var market in supermarket) {
      if (market['supermarket_lat'] != null &&
          market['supermarket_long'] != null) {
        bool isNearest = market == supermarket.first;
        markers.add(
          Marker(
            markerId: MarkerId(market['supermarket_id'].toString()),
            position: LatLng(
              market['supermarket_lat'],
              market['supermarket_long'],
            ),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              isNearest ? BitmapDescriptor.hueGreen : BitmapDescriptor.hueRed,
            ),

            infoWindow: InfoWindow(
              title: market['supermarket_name'],
              snippet: "اضغط للدخول",

              // 🔥 هذا المهم
              onTap: () {
                selectedMarket = market;
                update();
              },
              // onTap: () {
              //   goToCategories(
              //     supermarket,
              //     supermarket.indexOf(market),
              //     market['supermarket_id'].toString(),
              //     SupermarketModel.fromJson(market),
              //   );
              // },
            ),
          ),
        );
      }
    }

    update();
  }

  void moveToNearest() {
    if (supermarket.isEmpty) return;

    var nearest = supermarket.first;

    gmc?.animateCamera(
      CameraUpdate.newLatLng(
        LatLng(nearest['supermarket_lat'], nearest['supermarket_long']),
      ),
    );
  }

  DateTime lastUpdate = DateTime.now();

  void listenToCompass() {
    FlutterCompass.events?.listen((event) {
      if (event.heading != null) {
        if (DateTime.now().difference(lastUpdate).inMilliseconds > 150) {
          lastUpdate = DateTime.now();
          updateUserRotation(event.heading!);
        }
      }
    });
  }


  // void listenToCompass() {
  //   FlutterCompass.events?.listen((event) {
  //     double? heading = event.heading;
  //
  //     if (heading != null) {
  //       updateUserRotation(heading);
  //     }
  //   });
  // }



  // void updateUserRotation(double rotation) {
  //   userRotation = rotation;
  //   generateMarkers();
  // }

  void updateUserRotation(double rotation) {
    if ((rotation - userRotation).abs() < 5) return;
    userRotation = rotation;

    markers.removeWhere((m) => m.markerId.value == "user_location");

    if (userLat != null && userLng != null && userIcon != null) {
      markers.add(
        Marker(
          markerId: MarkerId("user_location"),
          position: LatLng(userLat!, userLng!),
          icon: userIcon!,
          anchor: Offset(0.5, 0.5),
          flat: true,
          rotation: userRotation,
        ),
      );
    }

    update(["map"]);// تحديث خفيف
  }

  @override
  goToCategories(supermarket, selectedsuper, supermarketId, supermarketModel) {
    Get.toNamed(
      AppRoute.supermarketDetailsPage,
      arguments: {
        "supermarket": supermarket,
        "selectedsuper": selectedsuper,
        "superid": supermarketId,
        "supermarketModel": supermarketModel,
      },
    );
  }
}
