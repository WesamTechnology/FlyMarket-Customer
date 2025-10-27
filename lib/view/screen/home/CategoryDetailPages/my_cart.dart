import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymarket_customer/view/widget/home/myCart/custom_button_cart.dart';
import 'package:flymarket_customer/view/widget/home/myCart/custom_list_view_cart.dart';


class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Text(
            "My Cart",
            style: TextStyle(color: Colors.black, fontSize: 20.sp),
          ),
          SizedBox(height: 10.h),
          Divider(color: Colors.grey[400],),
          Expanded(
            child: CustomListViewCart(),
          ),
          CustomButtonCart(),
        ],
      ),
    );
  }
}
