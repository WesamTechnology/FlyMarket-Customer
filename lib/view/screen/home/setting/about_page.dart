import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/functions/translate_database.dart';


class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      appBar: AppBar(
        title:  Text(
          translateDatabase("حول FlyMarket", "About FlyMarket"),
          style: TextStyle(fontWeight: FontWeight.bold, color: AppColor.fourthColor),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: AppColor.fourthColor, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // قسم الهيدر مع اللوجو
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 40.h),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(25.w),
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.shopping_cart_rounded,
                      size: 80.r,
                      color: AppColor.primaryColor,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'FlyMarket',
                    style: TextStyle(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColor.fourthColor,
                    ),
                  ),
                  Text(
                    'Version 1.0.0',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey[500],
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // بطاقة الوصف
                  _buildSectionCard(
                    title: translateDatabase("رؤيتنا", "Our Vision"),
                    child: Text(
                      translateDatabase(
                        "FlyMarket هو تطبيق ذكي لتوصيل السوبرماركت يغيّر تجربة التسوق الخاصة بك. تصفّح الأسواق القريبة، قارن الأسعار في الوقت الفعلي، واطلب مباشرة من هاتفك عبر واجهة سهلة الاستخدام.",
                        "FlyMarket is a smart supermarket delivery app that revolutionizes your shopping experience. Browse nearby markets, compare prices in real-time, and place orders directly from your phone with our intuitive interface.",
                      ),
                      style: TextStyle(
                        fontSize: 15.sp,
                        height: 1.6,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),

                  SizedBox(height: 20.h),

                  // بطاقة المميزات
                  _buildSectionCard(
                    title: translateDatabase("الميزات الرئيسية", "Key Features"),
                    child: Column(
                      children: [
                        _buildFeatureItem(Icons.store_rounded, translateDatabase("تصفح الأسواق المحلية", "Browse Local Markets")),
                        _buildFeatureItem(Icons.compare_arrows_rounded, translateDatabase("مقارنة الأسعار", "Price Comparison")),
                        _buildFeatureItem(Icons.shopping_bag_rounded, translateDatabase("طلب سهل", "Easy Ordering")),
                        _buildFeatureItem(Icons.local_shipping_rounded, translateDatabase("توصيل سريع", "Fast Delivery")),
                      ],
                    ),
                  ),

                  SizedBox(height: 20.h),

                  _buildSectionCard(
                    title: translateDatabase("تواصل معنا", "Contact Us"),
                    child: Column(
                      children: [
                        _buildContactItem(
                          Icons.email_outlined,
                          'contact@flymarket.com',
                              () {},
                        ),
                        const Divider(height: 20),
                        _buildContactItem(
                          Icons.phone_iphone_rounded,
                          '+967 123 456 789',
                              () {},
                        ),
                        const Divider(height: 20),
                        _buildContactItem(
                          Icons.language_rounded,
                          'www.flymarket.com',
                              () {},
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 30.h),

                  Center(
                    child: Text(
                      translateDatabase("© 2026 فريق FlyMarket. جميع الحقوق محفوظة.", "© 2026 FlyMarket Team. All rights reserved."),
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey[400]),
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionCard({required String title, required Widget child}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
              color: AppColor.fourthColor,
            ),
          ),
          SizedBox(height: 15.h),
          child,
        ],
      ),
    );
  }

  Widget _buildFeatureItem(IconData icon, String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color: AppColor.primaryColor.withOpacity(0.08),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(icon, color: AppColor.primaryColor, size: 20.sp),
          ),
          SizedBox(width: 15.w),
          Text(
            text,
            style: TextStyle(fontSize: 15.sp, color: AppColor.fourthColor, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String text, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: AppColor.primaryColor, size: 22.sp),
          SizedBox(width: 15.w),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 15.sp, color: Colors.grey[800]),
            ),
          ),
          Icon(Icons.arrow_forward_ios, size: 14.r, color: Colors.grey[300]),
        ],
      ),
    );
  }
}