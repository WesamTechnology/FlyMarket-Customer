import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statuserequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handling_data_controller.dart';
import '../../core/services/services.dart';
import '../../core/services/twilio_service.dart';
import '../../data/datasource/remote/auth/signup_data.dart';
import '../../data/datasource/remote/auth/verify_and_register_data.dart';

class SignupController extends GetxController {
  final TwilioService _twilioService = TwilioService();
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  SignupData signUpData = SignupData(Get.find());
  VerifyAndRegisterData verifyAndRegisterData =
  VerifyAndRegisterData(Get.find());

  // ================= Variables =================
  var isLoading = false.obs;
  var isCodeSent = false.obs;

  var name = ''.obs;
  var phoneNumber = ''.obs;

  // ================= Controllers =================
  late TextEditingController nameController;
  late TextEditingController otpController;

  // ================= Navigation =================
  goToLogin() {
    Get.offAllNamed(AppRoute.login);
  }

  // ==================================================
  // إرسال الكود (فحص الرقم فقط)
  // ==================================================
  Future<void> sendCode(String phone) async {
    if (nameController.text.isEmpty) {
      Get.snackbar('تنبيه', 'الرجاء إدخال الاسم الكامل');
      return;
    }

    if (phone.isEmpty) {
      Get.snackbar('تنبيه', 'الرجاء إدخال رقم الهاتف');
      return;
    }

    isLoading.value = true;

    name.value = nameController.text.trim();
    phoneNumber.value = phone.trim();

    // 1️⃣ فحص الرقم من السيرفر (بدون تخزين)
    statusRequest = StatusRequest.loding;
    var response = await signUpData.postdata(
      name.value,
      phoneNumber.value,
    );

    statusRequest = handlingData(response);

    if (statusRequest != StatusRequest.success ||
        response['status'] != "success") {
      isLoading.value = false;
      Get.snackbar("فشل", "رقم الهاتف مستخدم مسبقًا");
      return;
    }

    // 2️⃣ إرسال OTP من Twilio
    bool sent = await _twilioService.sendOTP(phoneNumber.value);

    isLoading.value = false;

    if (sent) {
      isCodeSent.value = true;
      Get.snackbar('نجاح', 'تم إرسال كود التحقق');
    } else {
      Get.snackbar('خطأ', 'فشل إرسال كود التحقق');
    }
  }

  // ==================================================
  // التحقق من الكود + إنشاء الحساب
  // ==================================================
  Future<void> verifyAndRegister() async {
    String code = otpController.text.trim();

    if (code.length < 4) {
      Get.snackbar('تنبيه', 'أدخل كود التحقق كامل');
      return;
    }

    isLoading.value = true;

    // 1️⃣ التحقق من الكود عبر Twilio
    bool verified =
    await _twilioService.verifyOTP(phoneNumber.value, code);

    if (!verified) {
      isLoading.value = false;
      Get.snackbar('خطأ', 'كود التحقق غير صحيح');
      return;
    }

    // 2️⃣ حفظ البيانات بعد التحقق
    statusRequest = StatusRequest.loding;

    var response = await verifyAndRegisterData.postdata(
      name.value,
      phoneNumber.value,
    );

    statusRequest = handlingData(response);
    isLoading.value = false;

    if (statusRequest == StatusRequest.success &&
        response['status'] == "success") {

      // 🔴 هنا التعديل المهم
      var user = response['message'];

      myServices.sharedPreferences.setString(
          "id", user['users_id'].toString());
      myServices.sharedPreferences.setString(
          "username", user['users_name']);
      myServices.sharedPreferences.setString(
          "phone", user['users_phone']);
      myServices.sharedPreferences.setString(
          "approve", user['users_approve']);
      myServices.sharedPreferences.setString("step", "2");

      Get.offAllNamed(AppRoute.homepage);
    } else {
      Get.snackbar('فشل', 'حدث خطأ أثناء إنشاء الحساب');
    }
  }


  // ================= Lifecycle =================
  @override
  void onInit() {
    nameController = TextEditingController();
    otpController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    nameController.dispose();
    otpController.dispose();
    super.dispose();
  }
}
