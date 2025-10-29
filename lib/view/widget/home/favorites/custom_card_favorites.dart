import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/imgaeasset.dart';

class CustomCardFavorites extends StatelessWidget {
  const CustomCardFavorites({super.key, required this.title, required this.subtitle, required this.image, required this.price, this.onPressedFavorite});
  final String title,subtitle,image, price;
  final void Function()? onPressedFavorite ;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
        side: BorderSide(
          style: BorderStyle.solid,
          color: Colors.green.shade100,
        ),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.only(left: 17.w, top: 16.h,bottom: 16.h),
        leading: Image.asset(image),
        title: Text(
          title,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              price,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 5.w),
            IconButton(
              onPressed: onPressedFavorite,
              icon: Icon(Icons.favorite, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
