import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomListSetting extends StatelessWidget {
  const CustomListSetting({super.key, required this.title, required this.iconLeading, required this.iconTrailing,this.onTap});
final String title;
final IconData iconLeading,iconTrailing;
 final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6.h),
      padding: EdgeInsets.only(bottom: 3.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black12, width: 1.5),
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: ListTile(
          leading: Icon(iconLeading),
          title: Text(
            title,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
          ),
          trailing: Icon(iconTrailing, color: Colors.grey),
        ),
      ),
    );
  }
}
