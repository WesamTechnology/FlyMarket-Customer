import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';import 'package:image_picker/image_picker.dart';
import '../../../../core/services/services.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();

  String? username;
  String? phone;
  String? imagePath;

  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    // تحميل البيانات المحفوظة عند فتح الصفحة
    username = myServices.sharedPreferences.getString("username") ?? "Wesam AL-Junaid";
    phone = myServices.sharedPreferences.getString("phone") ?? "775904988";
    imagePath = myServices.sharedPreferences.getString("user_image");
    super.onInit();
  }

  // دالة لتغيير الاسم
  void updateUserName(String newName) {
    username = newName;
    myServices.sharedPreferences.setString("username", newName);
    update();
  }

  // دالة لاختيار صورة من المعرض
  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (image != null) {
      imagePath = image.path;
      myServices.sharedPreferences.setString("user_image", image.path);
      update();
    }
  }
}