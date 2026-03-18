
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/orders/order_pending_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/translate_database.dart';
import '../../widget/order/orderslistcard.dart';

class OrderPending extends StatelessWidget {
  const OrderPending({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderPendingController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            translateDatabase("الطلبات قيد الانتظار", "Orders Pending"),
            style: TextStyle(
                color: AppColor.primaryColor,
                fontWeight: FontWeight.bold
            ),
          )
      ),
      body: GetBuilder<OrderPendingController>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: RefreshIndicator(
              onRefresh: ()=> controller.getOrdersData()
              ,
              child: Container(
                padding: EdgeInsets.all(10),
                child: ListView.builder(
                  itemCount: controller.listdata.length,
                  itemBuilder: (context, index) {
                    final reversedIndex =
                        controller.listdata.length - 1 - index;

                    return CardOrdersList(
                      listdata: controller.listdata[index],
                    );
                  },
                )
              ),
            ),
          );
        },
      ),
    );
  }
}
