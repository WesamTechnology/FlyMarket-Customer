import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statuserequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handling_data_controller.dart';
import '../../core/services/services.dart';
import '../../core/services/twilio_service.dart';
import '../../data/datasource/remote/auth/login_data.dart';

class LoginController extends GetxController {
  final TwilioService _twilioService = TwilioService();
  final LoginData loginData = LoginData(Get.find());
  final MyServices myServices = Get.find();

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;

  var isLoading = false.obs;
  var isCodeSent = false.obs;

  /// نخزن الرقم المحلي فقط (بدون +967)
  var phoneNumber = ''.obs;

  late TextEditingController otpController;

  // ---------------------------
  // Helpers
  // ---------------------------
  String localPhone(String phone) {
    return phone.replaceAll(RegExp(r'^\+967'), '');
  }

  String twilioPhone(String phone) {
    if (phone.startsWith('+967')) return phone;
    return '+967$phone';
  }

  // ---------------------------
  // إرسال كود التحقق
  // ---------------------------
  Future<void> sendCode(String phone) async {
    if (phone.isEmpty) {
      Get.snackbar('تنبيه', 'الرجاء إدخال رقم الهاتف');
      return;
    }

    isLoading.value = true;

    final phoneLocal = localPhone(phone);
    final phoneTwilio = twilioPhone(phone);

    // 1️⃣ فحص الرقم في قاعدة البيانات فقط
    final response = await loginData.postdata(phoneLocal);
    statusRequest = handlingData(response);
    if (statusRequest != StatusRequest.success ||
        response['status'] != 'success') {
      isLoading.value = false;
      Get.snackbar('فشل', 'رقم الهاتف غير مسجل');
      return;
    }

    // 2️⃣ إرسال OTP عبر Twilio
    final sent = await _twilioService.sendOTP(phoneTwilio);

    isLoading.value = false;

    if (sent) {
      phoneNumber.value = phoneLocal; // نخزن المحلي
      isCodeSent.value = true;
      Get.snackbar('نجاح', 'تم إرسال كود التحقق');
    }
  }

  // ---------------------------
  // التحقق من الكود وتسجيل الدخول
  // ---------------------------
  Future<void> verifyCode() async {
    final code = otpController.text.trim();

    if (code.length < 4) {
      Get.snackbar('تنبيه', 'أدخل كود التحقق كامل');
      return;
    }

    isLoading.value = true;

    // 3️⃣ التحقق من OTP
    final verified = await _twilioService.verifyOTP(
      twilioPhone(phoneNumber.value),
      code,
    );

    if (!verified) {
      isLoading.value = false;
      Get.snackbar('خطأ', 'كود التحقق غير صحيح');
      return;
    }


    /// 4️⃣ جلب بيانات المستخدم بعد التحقق
    final response = await loginData.postdata(phoneNumber.value);

    if (response['status'] == 'success') {
      final user = response['data'];

      myServices.sharedPreferences.setString(
          "id", user['users_id'].toString());
      myServices.sharedPreferences.setString(
          "username", user['users_name']);
      myServices.sharedPreferences.setString(
          "phone", user['users_phone']);
      String userId = myServices.sharedPreferences.getString("id")!;
      FirebaseMessaging.instance.subscribeToTopic("users");
      FirebaseMessaging.instance.subscribeToTopic("users${userId}");
      myServices.sharedPreferences.setString("step", "2");

      isLoading.value = false;
      Get.offAllNamed(AppRoute.homepage);
    } else {
      isLoading.value = false;
      Get.snackbar('خطأ', 'فشل تسجيل الدخول');
    }


}

  // ---------------------------
  goToSignUP() {
    Get.offAllNamed(AppRoute.signUp);
  }

  // ---------------------------
  @override
  void onInit() {
    otpController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }
}
