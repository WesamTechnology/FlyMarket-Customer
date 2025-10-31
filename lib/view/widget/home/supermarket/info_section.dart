import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymarket_customer/view/widget/home/categories/custom_Search.dart';

class InfoSection extends StatelessWidget {
  final double rating;
  final String location;

  const InfoSection({
    super.key,
    required this.rating,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF6F7FB),
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.star, color: Colors.amber, size: 18.sp),
              SizedBox(width: 5.w),
              Text(
                rating.toStringAsFixed(1),
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(width: 15.w),
              Icon(Icons.location_on, color: Colors.red, size: 18.sp),
              SizedBox(width: 5.w),
              Expanded(
                child: Text(
                  location,
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey[700]),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(height: 15.h),
          const CustomSearch(),
          SizedBox(height: 15.h),
          Text(
            "Available Products",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
