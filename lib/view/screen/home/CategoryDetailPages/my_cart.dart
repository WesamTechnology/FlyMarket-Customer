import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymarket_customer/view/widget/home/myCart/custom_button_cart.dart';
import 'package:flymarket_customer/view/widget/home/myCart/custom_list_view_cart.dart';
import 'package:flymarket_customer/view/widget/home/myCart/custom_title.dart';


class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CustomTitle(title: "My Cart",),
          Expanded(
            child: CustomListViewCart(),
          ),
          CustomButtonCart(),
        ],
      ),
    );
  }
}
