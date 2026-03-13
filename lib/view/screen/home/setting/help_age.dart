import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constant/color.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Help & Support',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: AppColor.primaryColor,
        centerTitle: true,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.r)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // قسم الترحيب العلوي
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
              decoration: BoxDecoration(
                color: AppColor.primaryColor.withOpacity(0.05),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(30.r)),
              ),
              child: Column(
                children: [
                  Icon(Icons.support_agent_rounded, size: 60.r, color: AppColor.primaryColor),
                  SizedBox(height: 15.h),
                  Text(
                    'How can we help you?',
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColor.fourthColor,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Our team is here to support you 24/7',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 25.h),

            // قائمة خيارات الدعم
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  _helpTile(
                    Icons.chat_bubble_outline_rounded,
                    'Live Chat Support',
                    'Chat with our experts right now',
                    'Start Chat',
                    Colors.blue,
                  ),
                  _helpTile(
                    Icons.alternate_email_rounded,
                    'Email Support',
                    'Response time: within 24 hours',
                    'support@flymarket.com',
                    Colors.orange,
                  ),
                  _helpTile(
                    Icons.phone_in_talk_rounded,
                    'Call Center',
                    'Sunday - Thursday (9AM - 6PM)',
                    '+967 775 904 988',
                    Colors.green,
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.h),

            // قسم إضافي للمعلومات
            Container(
              margin: EdgeInsets.all(16.w),
              padding: EdgeInsets.all(20.r),
              decoration: BoxDecoration(
                color: AppColor.fourthColor,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Frequently Asked Questions',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          'Find quick answers to common issues',
                          style: TextStyle(color: Colors.white70, fontSize: 12.sp),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, color: Colors.white, size: 20.r),
                ],
              ),
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }

  Widget _helpTile(IconData icon, String title, String description, String actionText, Color iconColor) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(18.r),
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.all(16.r),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(12.r),
                  decoration: BoxDecoration(
                    color: iconColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Icon(icon, color: iconColor, size: 28.r),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColor.fourthColor,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        description,
                        style: TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        actionText,
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey[300], size: 16.r),
              ],
            ),
          ),
        ),
      ),
    );
  }
}