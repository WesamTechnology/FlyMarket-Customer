import 'package:flutter/material.dart';
import 'package:flymarket_customer/view/widget/order/show_rating.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../controller/orders/order_archive_controller.dart';
import '../../../controller/orders/order_pending_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';
import '../../../core/functions/translate_database.dart';
import '../../../data/model/orders/order_pending_model.dart';

class CardOrdersListArchive extends GetView<OrderArchiveController> {
  final OrderPendingModel listdata;

  const CardOrdersListArchive({Key? key, required this.listdata})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.primaryColor3,
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ===== Header =====
            Row(
              children: [
                Text(
                  translateDatabase(
                    "الطلب #${listdata.ordersId}",
                    "Order #${listdata.ordersId}",
                  ),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Chip(
                  label: Text(
                    controller.printOrderStatus(
                      listdata.ordersStatus!.toString(),
                    ),
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
              title: translateDatabase("نوع الطلب", "Order Type"),
              value: controller.printOrderType(listdata.ordersType!.toString()),
            ),
            _buildInfoRow(
              icon: Icons.attach_money,
              title: translateDatabase("سعر الطلب", "Order Price"),
              value: translateDatabase(
                "${listdata.ordersPrice} ريال",
                "${listdata.ordersPrice} RYE",
              ),
            ),
            _buildInfoRow(
              icon: Icons.delivery_dining,
              title: translateDatabase("التوصيل", "Delivery"),
              value: translateDatabase(
                "${listdata.ordersPricedelivery} ريال",
                "${listdata.ordersPricedelivery} RYE",
              ),
            ),
            _buildInfoRow(
              icon: Icons.payment,
              title: translateDatabase("الدفع", "Payment"),
              value: controller.printPaymentMethod(
                listdata.ordersPaymentmethod!.toString(),
              ),
            ),
            _buildInfoRow(
              icon: Icons.watch_later_outlined,
              title: translateDatabase("التاريخ والوقت", "Date Time"),
              value: "${Jiffy.parse('${listdata.ordersDatetime}').fromNow()}",
            ),

            const Divider(height: 30),

            /// ===== Footer =====
            Row(
              children: [
                Expanded(
                  child: Text(
                    translateDatabase(
                      "الإجمالي: ${listdata.ordersTotalprice} ريال",
                      "Total: ${listdata.ordersTotalprice} RYE",
                    ),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ),
                const SizedBox(width: 2),

                OutlinedButton(
                  onPressed: () {
                    print(
                      "================================== pp ${listdata.addressLat}",
                    );
                    Get.toNamed(
                      AppRoute.ordersdetails,
                      arguments: {"ordersmodel": listdata},
                    );
                  },
                  child: Text(translateDatabase("التفاصيل", "Details")),
                ),

                const SizedBox(width: 5),
                if (listdata.ordersRating == 0)
                  OutlinedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                        AppColor.primaryColor,
                      ),
                      foregroundColor: WidgetStateProperty.all<Color>(
                        Colors.white,
                      ),
                    ),
                    onPressed: () {
                      showRatingDialog(context, listdata.ordersId.toString());
                    },
                    child: Text(translateDatabase("التقييم", "Rating")),
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
            child: Text(value, style: const TextStyle(color: Colors.black54)),
          ),
        ],
      ),
    );
  }
}
