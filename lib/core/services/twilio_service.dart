import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class TwilioService {
  // ---------------------------------------------------------------------------
  // إعدادات Twilio (Twilio Configuration)
  // ---------------------------------------------------------------------------
  // قم باستبدال هذه القيم بالبيانات الخاصة بحسابك من لوحة تحكم Twilio
  // للحصول عليها مجاناً (حساب تجريبي):
  // 1. سجل في twilio.com
  // 2. احصل على Account SID و Auth Token من الصفحة الرئيسية (Dashboard)
  // 3. اذهب إلى Verify > Services وأنشئ خدمة جديدة للحصول على Service SID

  static  String accountSid = dotenv.env['TWILIO_ACCOUNT_SID'] ?? '' ;
      // ضع Account SID هنا
  static  String authToken =
      dotenv.env['TWILIO_AUTH_TOKEN'] ?? ''; // ضع Auth Token هنا
  static  String serviceSid =
      dotenv.env['TWILIO_service_SID'] ?? ''; // ضع Service SID هنا

  // ---------------------------------------------------------------------------
  // الوظائف (Functions)
  // ---------------------------------------------------------------------------

  /// إرسال رمز التحقق (OTP) إلى رقم الهاتف
  /// [phoneNumber]: رقم الهاتف بصيغة دولية (مثال: +967770000000)
  Future<bool> sendOTP(String phoneNumber) async {
    // رابط الـ API الخاص بإرسال الكود
    final String url =
        'https://verify.twilio.com/v2/Services/$serviceSid/Verifications';

    try {
      final response = await http.post(
        Uri.parse(url),
        // المصادقة باستخدام Basic Auth (SID + Token)
        headers: {
          'Authorization':
              'Basic ' + base64Encode(utf8.encode('$accountSid:$authToken')),
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        // البيانات المرسلة: الرقم والقناة (sms)
        body: {'To': phoneNumber, 'Channel': 'sms'},
      );

      // التحقق من نجاح العملية (Status Code 200-299)
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('✅ تم إرسال الكود بنجاح إلى $phoneNumber');
        return true;
      } else {
        // طباعة الخطأ في حال الفشل
        print('❌ فشل إرسال الكود: ${response.body}');
        Get.snackbar(
          'خطأ',
          'فشل إرسال الكود: ${jsonDecode(response.body)['message']}',
        );
        return false;
      }
    } catch (e) {
      print('❌ حدث خطأ أثناء الاتصال: $e');
      Get.snackbar('خطأ', 'تأكد من الاتصال بالإنترنت');
      return false;
    }
  }

  /// التحقق من الرمز المدخل (Verify OTP)
  /// [phoneNumber]: رقم الهاتف
  /// [code]: الكود الذي أدخله المستخدم
  Future<bool> verifyOTP(String phoneNumber, String code) async {
    // رابط الـ API الخاص بالتحقق
    final String url =
        'https://verify.twilio.com/v2/Services/$serviceSid/VerificationCheck';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Authorization':
              'Basic ' + base64Encode(utf8.encode('$accountSid:$authToken')),
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        // البيانات: الرقم والكود
        body: {'To': phoneNumber, 'Code': code},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        // التحقق من حالة الموافقة من استجابة Twilio
        if (data['status'] == 'approved') {
          print('✅ تم التحقق من الكود بنجاح!');
          return true;
        } else {
          print('❌ الكود غير صحيح أو انتهت صلاحيته');
          Get.snackbar('تنبيه', 'الكود غير صحيح');
          return false;
        }
      } else {
        print('❌ فشل التحقق: ${response.body}');
        Get.snackbar(
          'خطأ',
          'فشل التحقق: ${jsonDecode(response.body)['message']}',
        );
        return false;
      }
    } catch (e) {
      print('❌ حدث خطأ: $e');
      Get.snackbar('خطأ', 'حدث خطأ غير متوقع');
      return false;
    }
  }
}
