

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/orders/order_pending_controller.dart';
import '../../../core/constant/color.dart';
import '../../../data/model/orders/order_pending_model.dart';
class CardOrdersList extends GetView<OrderPendingController> {
  final OrderPendingModel listdata;
  const CardOrdersList({Key? key, required this.listdata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// ===== Header =====
            Row(
              children: [
                Text(
                  "Order #${listdata.ordersId}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Chip(
                  label: Text(
                    controller.printOrderStatus(
                        listdata.ordersStatus!.toString()),
                    style: const TextStyle(color: Colors.white),
                  ),
                  backgroundColor: AppColor.primaryColor,
                ),
              ],
            ),

            const SizedBox(height: 10),
            const Divider(),

            /// ===== Info =====
            _buildInfoRow(
              icon: Icons.local_shipping,
              title: "Order Type",
              value: controller.printOrderType(
                  listdata.ordersType!.toString()),
            ),
            _buildInfoRow(
              icon: Icons.attach_money,
              title: "Order Price",
              value: "${listdata.ordersPrice} \$",
            ),
            _buildInfoRow(
              icon: Icons.delivery_dining,
              title: "Delivery",
              value: "${listdata.ordersPricedelivery} \$",
            ),
            _buildInfoRow(
              icon: Icons.payment,
              title: "Payment",
              value: controller.printPaymentMethod(
                  listdata.ordersPaymentmethod!.toString()),
            ),

            const Divider(height: 30),

            /// ===== Footer =====
            Row(
              children: [
                Text(
                  "Total: ${listdata.ordersPrice} \$",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primaryColor,
                  ),
                ),
                const Spacer(),

                OutlinedButton(
                  onPressed: () {
                    // Get.toNamed(AppRoute.ordersdetails,
                    // arguments: {"ordersmodel": listdata});
                  },
                  child: const Text("Details"),
                ),

                const SizedBox(width: 8),

                if (listdata.ordersStatus == "0")
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () {
                      // controller.deleteOrder(listdata.ordersId!);
                    },
                    child: const Text("Delete"),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppColor.primaryColor),
          const SizedBox(width: 8),
          Text(
            "$title : ",
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}