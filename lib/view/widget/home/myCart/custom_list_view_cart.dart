import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymarket_customer/core/class/handlingdataview.dart';
import 'package:get/get.dart';

import '../../../../controller/cart/cart_controller.dart';
import 'cart_item_widget.dart';

class CustomListViewCart extends GetView<CartController> {
  const CustomListViewCart({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: (context, index) {
              return CartItemWidget(
                name: controller.data[index].itmesName!,
                description: controller.data[index].itmesDesc!,
                image: controller.data[index].itmesImage!,
                price: controller.data[index].itemsprice.toString(),
                count: controller.data[index].countitems.toString(),
                add: () async {
                  await controller.add(controller.data[index].itmesId);
                  controller.refreshPage();
                },
                delete: () async {
                  await controller.delete(controller.data[index].itmesId);
                  controller.refreshPage();
                },
              );
            },
          ),
        );
      },
    );
  }
}
