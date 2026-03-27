import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/checkout/checkout_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imgaeasset.dart';
import '../../../core/constant/routes.dart';
import '../../../core/functions/translate_database.dart';
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
          translateDatabase("إتمام الطلب", "Checkout"),
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
          onPressed: () {
            // print("======================== checkout supermarketId = ${controller.supermarketId} ");
            // print("======================== checkout couponId = ${controller.couponId} ");
            controller.checkout();
          },
          child: Text(
            translateDatabase("إتمام الطلب", "Checkout"),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
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
                    translateDatabase(
                      "اختر طريقة الدفع",
                      "Choose Payment Method",
                    ),
                    style: TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(height: 15),
                  CardPaymentMethodCheckout(
                    onTap: () {
                      controller.choosePaymentMethod("0"); // 0 = > cash
                    },
                    title: translateDatabase(
                      "الدفع عند الاستلام",
                      "Cash On Delivery",
                    ),
                    isActive: controller.paymentChoos == "0" ? true : false,
                  ),
                  SizedBox(height: 10),
                  CardPaymentMethodCheckout(
                    onTap: () {
                      controller.choosePaymentMethod("1"); // 1 => card
                    },
                    title: translateDatabase("الدفع عبر محفظة جيب", "Payment via Jaib Wallet"),
                    isActive: controller.paymentChoos == "1" ? true : false,
                  ),
                  SizedBox(height: 30),
                  Text(
                    translateDatabase(
                      "اختر نوع التوصيل",
                      "Choose Delivery Type",
                    ),
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
                          controller.chooseDeliveryMethod("0"); // 0 => delivery
                        },
                        imagename: AppImageAsset.deliveryImage2,
                        title: translateDatabase("توصيل", "Delivery"),
                        active: controller.deliveryChoos == "0" ? true : false,
                      ),
                      SizedBox(width: 20),
                      CardDeliveryTypeCheckout(
                        onTap: () {
                          controller.chooseDeliveryMethod("1"); // 1 => pick
                        },
                        imagename: AppImageAsset.drivethruImage,
                        title: translateDatabase("استلام", "Pick Up"),
                        active: controller.deliveryChoos == "1" ? true : false,
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  if (controller.deliveryChoos == "0")
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          translateDatabase("عنوان الشحن", "Shipping Address"),
                          style: TextStyle(
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                        SizedBox(height: 15),
                        if (controller.listDataAddress.isEmpty)
                          InkWell(
                            onTap: () {
                              Get.toNamed(AppRoute.addressadd);
                            },
                            child: Center(
                              child: Text(
                                translateDatabase(
                                  "يرجى إضافة عنوان الشحن \n اضغط هنا",
                                  "Please Add Shipping Address \n Click Here",
                                ),
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.listDataAddress.length,
                          itemBuilder: (context, index) {
                            return CardShppingAddressCheckout(
                              onTap: () {
                                controller.chooseAddress(
                                  controller.listDataAddress[index].addressId!
                                      .toString(),
                                );
                              },
                              title: controller
                                  .listDataAddress[index]
                                  .addressName!,
                              body:
                                  "${controller.listDataAddress[index].addressCity!} ${controller.listDataAddress[index].addressStreet!}",
                              isactive:
                                  controller.addressChoos ==
                                      controller
                                          .listDataAddress[index]
                                          .addressId!
                                          .toString()
                                  ? true
                                  : false,
                            );
                          },
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "سعر التوصيل",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${controller.deliveryPrice.toStringAsFixed(0)} ريال",
                                style: TextStyle(
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
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
