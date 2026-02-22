
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/checkout/checkout_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imgaeasset.dart';
import '../../../data/model/address/address_view_model.dart';
import '../../widget/checkout/carddeliveerytype.dart';
import '../../widget/checkout/cardpaymentmethod.dart';
import '../../widget/checkout/cardshippingaddress.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutController controller = Get.put(CheckoutController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Checkout",
          style: TextStyle(
            color: AppColor.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: MaterialButton(
          textColor: Colors.white,
          color: AppColor.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onPressed: () {},
          child: Text("Checkout"),
        ),
      ),
      body: GetBuilder<CheckoutController>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: EdgeInsets.all(20),
              child: ListView(
                children: [
                  SizedBox(height: 10),
                  Text(
                    "Choose Payment Method",
                    style: TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(height: 15),
                  CardPaymentMethodCheckout(
                    onTap: () {
                      controller.choosePaymentMethod("cash");
                    },
                    title: "Cash On Delivery",
                    isActive: controller.paymentChoos == "cash" ? true : false,
                  ),
                  SizedBox(height: 10),
                  CardPaymentMethodCheckout(
                    onTap: () {
                      controller.choosePaymentMethod("card");
                    },
                    title: "Payment Card",
                    isActive: controller.paymentChoos == "card" ? true : false,
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Choose Delivery Type",
                    style: TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      CardDeliveryTypeCheckout(
                        onTap: () {
                          controller.chooseDeliveryMethod("delivery");
                        },
                        imagename: AppImageAsset.deliveryImage2,
                        title: "Delivery",
                        active:
                            controller.deliveryChoos == "delivery"
                                ? true
                                : false,
                      ),
                      SizedBox(width: 20),
                      CardDeliveryTypeCheckout(
                        onTap: () {
                          controller.chooseDeliveryMethod("pick");
                        },
                        imagename: AppImageAsset.drivethruImage,
                        title: "Pick Up",
                        active:
                            controller.deliveryChoos == "pick" ? true : false,
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  if (controller.deliveryChoos == "delivery")
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Shipping Address",
                          style: TextStyle(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(height: 15),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.listDataAddress.length,
                          itemBuilder: (context, index) {
                            return CardShppingAddressCheckout(
                              onTap: () {
                                controller.chooseAddress(
                                  controller
                                      .listDataAddress[index]
                                      .addressName!,
                                );
                              },
                              title:
                                  controller
                                      .listDataAddress[index]
                                      .addressName!,
                              body:
                                  "${controller
                                      .listDataAddress[index]
                                      .addressCity!} ${controller
                                      .listDataAddress[index]
                                      .addressStreet!}",
                              isactive:
                                  controller.addressChoos ==
                                          controller
                                              .listDataAddress[index]
                                              .addressName!
                                      ? true
                                      : false,
                            );
                          },
                        ),
                      ],
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
