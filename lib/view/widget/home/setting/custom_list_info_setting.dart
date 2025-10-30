import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/constant/imgaeasset.dart';

class CustomListInfoSetting extends StatelessWidget {
  const CustomListInfoSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(50.r),
        child: Image.asset(AppImageAsset.me, fit: BoxFit.cover),
      ),
      title: Text(
        "Wesam AL-Junaid",
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      subtitle: Text(
        "775904988",
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.bold,
          color: AppColor.grey,
        ),
      ),
      trailing: IconButton(onPressed: () {}, icon: Icon(Icons.edit_outlined)),
    );
  }
}
