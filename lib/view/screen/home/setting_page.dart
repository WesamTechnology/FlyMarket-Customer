import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymarket_customer/core/constant/color.dart';
import 'package:flymarket_customer/core/constant/routes.dart';
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
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                      title: translateDatabase("المساعدة", "Help"),
                      iconLeading: Icons.help_outline,
                      iconTrailing: Icons.arrow_forward_ios_outlined,
                      onTap: (){
                        Get.to(HelpPage());
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
                      onPressed: () {},
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
