import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cart_item_widget.dart';


class CustomListViewCart extends StatelessWidget {
  const CustomListViewCart({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CartItemWidget(),
        CartItemWidget(),
        CartItemWidget(),
        CartItemWidget(),
        CartItemWidget(),
      ],
    );
  }
}
