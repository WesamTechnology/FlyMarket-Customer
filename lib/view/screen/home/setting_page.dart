import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymarket_customer/core/constant/color.dart';

import 'package:flymarket_customer/view/widget/home/myCart/custom_title.dart';
import 'package:flymarket_customer/view/widget/home/setting/custom_list_info_setting.dart';
import 'package:flymarket_customer/view/widget/home/setting/custom_list_setting.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            CustomTitle(title: "Setting"),
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
                      title: "Order",
                      iconLeading: Icons.shopping_bag_outlined,
                      iconTrailing: Icons.arrow_forward_ios_outlined,
                    ),
                    CustomListSetting(
                      title: "Delivery Address",
                      iconLeading: Icons.location_on_outlined,
                      iconTrailing: Icons.arrow_forward_ios_outlined,
                    ),
                    CustomListSetting(
                      title: "Payment Methods",
                      iconLeading: Icons.payment_outlined,
                      iconTrailing: Icons.arrow_forward_ios_outlined,
                    ),
                    CustomListSetting(
                      title: "Notifications",
                      iconLeading: Icons.notifications_active_outlined,
                      iconTrailing: Icons.arrow_forward_ios_outlined,
                    ),
                    CustomListSetting(
                      title: "Help",
                      iconLeading: Icons.help_outline,
                      iconTrailing: Icons.arrow_forward_ios_outlined,
                    ),
                    CustomListSetting(
                      title: "Languages",
                      iconLeading: Icons.language_outlined,
                      iconTrailing: Icons.arrow_forward_ios_outlined,
                    ),
                    CustomListSetting(
                      title: "About",
                      iconLeading: Icons.info_outline,
                      iconTrailing: Icons.arrow_forward_ios_outlined,
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
                            "Log Out",
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
