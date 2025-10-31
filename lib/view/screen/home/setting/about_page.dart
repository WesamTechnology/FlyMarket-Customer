import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constant/color.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About FlyMarket'),
        backgroundColor: AppColor.primaryColor,
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColor.primaryColor.withOpacity(0.01),
              Colors.white,
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.shopping_cart,
                      size: 100.sp, color: AppColor.primaryColor),
                ),
              ),
              SizedBox(height: 30.h),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.w),
                  child: Column(
                    children: [
                      Text(
                        'FlyMarket v1.0.0',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24.sp,
                          color: AppColor.primaryColor,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        'Developed by FlyMarket Team',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        'Al-Saeeda University, Yemen',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25.h),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About FlyMarket',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        'FlyMarket is a smart supermarket delivery app that revolutionizes your shopping experience. Browse nearby markets, compare prices in real-time, and place orders directly from your phone with our intuitive interface.',
                        style: TextStyle(
                          fontSize: 15.sp,
                          height: 1.6,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25.h),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Key Features',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      _buildFeatureItem(Icons.store, 'Browse Local Markets'),
                      _buildFeatureItem(Icons.compare_arrows, 'Price Comparison'),
                      _buildFeatureItem(Icons.shopping_bag, 'Easy Ordering'),
                      _buildFeatureItem(Icons.local_shipping, 'Fast Delivery'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25.h),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Contact Us',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Row(
                        children: [
                          Icon(Icons.email, color: AppColor.primaryColor),
                          SizedBox(width: 10.w),
                          Text(
                            'contact@flymarket.com',
                            style: TextStyle(fontSize: 14.sp),
                          ),
                       ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Icon(Icons.phone, color: AppColor.primaryColor),
                          SizedBox(width: 10.w),
                          Text(
                            '+967 123 456 789',
                            style: TextStyle(fontSize: 14.sp),
                          ),
                       ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureItem(IconData icon, String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Row(
        children: [
          Icon(icon, color: AppColor.primaryColor, size: 20.sp),
          SizedBox(width: 10.w),
          Text(
            text,
            style: TextStyle(fontSize: 15.sp),
          ),
       ],
      ),
    );
  }
}
