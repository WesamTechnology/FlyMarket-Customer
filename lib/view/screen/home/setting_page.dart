import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymarket_customer/core/constant/color.dart';
import 'package:flymarket_customer/core/constant/routes.dart';
import 'package:flymarket_customer/core/services/services.dart';
import 'package:flymarket_customer/view/screen/address/view_address.dart';
import 'package:flymarket_customer/view/screen/auth/language.dart';
import 'package:flymarket_customer/view/screen/home/setting/about_page.dart';
import 'package:flymarket_customer/view/screen/home/setting/help_age.dart';



import 'package:flymarket_customer/view/widget/home/myCart/custom_title.dart';
import 'package:flymarket_customer/view/widget/home/setting/custom_list_info_setting.dart';
import 'package:flymarket_customer/view/widget/home/setting/custom_list_setting.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/functions/translate_database.dart';

class SettingPage extends StatelessWidget {
 const  SettingPage({super.key});


  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            CustomTitle(title: translateDatabase("الإعدادات", "Setting"),),
            const SizedBox(height: 10),
            CustomListInfoSetting(),
            Divider(
              height: 20.h,
              color: Colors.grey[400],
              endIndent: 80,
              indent: 80,
              thickness: 2,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomListSetting(
                      title: translateDatabase("الطلبات", "Order"),
                      iconLeading: Icons.shopping_bag_outlined,
                      iconTrailing: Icons.arrow_forward_ios_outlined,
                      onTap: (){
                        Get.toNamed(AppRoute.orderspending);
                      },
                    ),
                    CustomListSetting(
                      title: translateDatabase("أرشيف الطلبات", "Order Archive"),
                      iconLeading: Icons.shopping_bag_sharp,
                      iconTrailing: Icons.arrow_forward_ios_outlined,
                      onTap: (){
                        Get.toNamed(AppRoute.ordersarchive);
                      },
                    ),

                    CustomListSetting(
                      title: translateDatabase("عناويني", "My Address"),
                      iconLeading: Icons.location_on_outlined,
                      iconTrailing: Icons.arrow_forward_ios_outlined,
                      onTap: (){
                        Get.to(ViewAddress());
                      },
                    ),
                    CustomListSetting(
                      title: translateDatabase("الإشعارات", "Notifications"),
                      iconLeading: Icons.notifications_active_outlined,
                      iconTrailing: Icons.arrow_forward_ios_outlined,
                      onTap: (){
                        Get.toNamed(AppRoute.notification);
                      },
                    ),

                    CustomListSetting(
                      title: translateDatabase("اللغات", "Languages"),
                      iconLeading: Icons.language_outlined,
                      iconTrailing: Icons.arrow_forward_ios_outlined,
                      onTap: (){
                        Get.dialog(Language(appRoute: AppRoute.homepage,));
                      },
                    ),
                    CustomListSetting(
                      title: translateDatabase("المساعدة", "Help"),
                      iconLeading: Icons.help_outline,
                      iconTrailing: Icons.arrow_forward_ios_outlined,
                      onTap: (){
                        Get.to(HelpPage());
                      },
                    ),
                    CustomListSetting(
                      title: translateDatabase("حول التطبيق", "About"),
                      iconLeading: Icons.info_outline,
                      iconTrailing: Icons.arrow_forward_ios_outlined,
                      onTap: (){
                        Get.to(AboutPage());
                      },
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 35.h),
                        backgroundColor: AppColor.primaryColor,
                      ),
                      onPressed: () {
                        Get.dialog(
                          Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.logout,
                                    size: 60,
                                    color: Colors.red,
                                  ),
                                  const SizedBox(height: 15),
                                  Text(
                                    "تسجيل الخروج",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "هل أنت متأكد أنك تريد تسجيل الخروج؟",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 20),

                                  Row(
                                    children: [
                                      // زر إلغاء
                                      Expanded(
                                        child: OutlinedButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          style: OutlinedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                          ),
                                          child: Text("إلغاء"),
                                        ),
                                      ),

                                      const SizedBox(width: 10),

                                      // زر تأكيد
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            String userId = myServices.sharedPreferences.getString("id")!;

                                            FirebaseMessaging.instance.unsubscribeFromTopic("users");
                                            FirebaseMessaging.instance.unsubscribeFromTopic("users$userId");

                                            myServices.sharedPreferences.clear();

                                            Get.offAllNamed(AppRoute.login);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.red,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                          ),
                                          child: Text("تأكيد",style: TextStyle(color: Colors.white),),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            translateDatabase("تسجيل الخروج", "Log Out"),
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Icon(
                            Icons.logout_outlined,
                            size: 24,
                            color: Colors.red,

                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
