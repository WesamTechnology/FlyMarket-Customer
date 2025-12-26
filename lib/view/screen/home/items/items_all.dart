import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymarket_customer/controller/home/items_controller.dart';
import 'package:flymarket_customer/core/class/handlingdataview.dart';
import 'package:flymarket_customer/data/model/itemsmodel.dart';
import 'package:flymarket_customer/view/widget/home/items/product_card.dart';
import 'package:get/get.dart';

import '../../../../controller/home/items_all_controller.dart';
import '../../../widget/home/categories/custom_Search.dart';
import '../../../widget/home/items/product_all_card.dart';

class ItemsAll extends StatelessWidget {
  const ItemsAll({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsAllControllerImp());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(7.0).r,
        child: Column(
          children: [
            SizedBox(height: 60.h),
            CustomSearch(),
            SizedBox(height: 10.h),
            GetBuilder<ItemsAllControllerImp>(
              builder: (controller) {
                return HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: GridView.builder(
                    itemCount: controller.itemsAll.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                    ),
                    itemBuilder: (BuildContext context, index) {
                      print(
                        "===========================lenth = ${controller.data.length}==================================",
                      );
                      return ProductAllCard(
                        itemsModel: ItemsModel.fromJson(
                          controller.itemsAll[index],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
