
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/orders/order_archive_controller.dart';
import '../../../controller/orders/order_pending_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../widget/order/orderslistcardarchive.dart';

class OrderArchiveView extends StatelessWidget {
  const OrderArchiveView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderArchiveController());
    return Scaffold(
      body: GetBuilder<OrderArchiveController>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
                padding: EdgeInsets.all(20),
                child:ListView.builder(
                  itemCount: controller.listdata.length,
                  itemBuilder: (context, index) {
                    final reversedIndex =
                        controller.listdata.length - 1 - index;

                    return CardOrdersListArchive(
                      listdata: controller.listdata[reversedIndex],
                    );
                  },
                )
            ),
          );
        },
      ),
    );
  }
}
