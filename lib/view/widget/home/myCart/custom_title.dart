import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key, required this.title});
  final String title ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.black, fontSize: 20.sp),
        ),
        SizedBox(height: 10.h),
        Divider(color: Colors.grey[400],),
      ],
    );
  }
}
