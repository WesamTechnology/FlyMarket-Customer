
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../controller/notification/notification_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationController controller = Get.put(NotificationController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notification",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 23,
            color: AppColor.primaryColor,
          ),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<NotificationController>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.all(12),
              child: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: AppColor.primaryColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                Icons.notifications_active,
                                color: AppColor.primaryColor,
                                size: 28,
                              ),
                            ),

                            const SizedBox(width: 12),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller
                                        .data[index]['notification_title'],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),

                                  const SizedBox(height: 6),

                                  Text(
                                    controller.data[index]['notification_body'],
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[700],
                                    ),
                                  ),

                                  const SizedBox(height: 8),

                                  Text(
                                    Jiffy.parse(
                                      controller
                                          .data[index]['notification_datetime'],
                                    ).fromNow(),
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColor.primaryColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
