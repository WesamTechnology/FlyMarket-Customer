
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/orders/order_pending_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../widget/order/orderslistcard.dart';

class OrderPending extends StatelessWidget {
  const OrderPending({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderPendingController());
    return Scaffold(
      body: GetBuilder<OrderPendingController>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: EdgeInsets.all(20),
              child: ListView.builder(
                itemCount: controller.listdata.length,
                itemBuilder: (context, index) {
                  return CardOrdersList(listdata: controller.listdata[index]);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
