import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/cart/cart_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';
import '../../../core/functions/translate_database.dart';
import 'custom_button_cart.dart';
import 'custom_button_coupon.dart';

class BottomNavgationBarCart extends GetView<CartController> {
  final String price;
  final String discount;
  // final String shipping;
  final String totalprice;
  final TextEditingController controllercoupon;
  final void Function()? onApplyCoupon;

  const BottomNavgationBarCart({
    Key? key,
    required this.price,
    required this.discount,
    // required this.shipping,
    required this.totalprice,
    required this.controllercoupon,
    this.onApplyCoupon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GetBuilder<CartController>(
            builder: (controller) => controller.couponname == null
                ? Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: controllercoupon,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 10,
                              ),
                              hintText: translateDatabase(
                                "كود الكوبون",
                                "Coupon Code",
                              ),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          flex: 1,
                          child: CustomButtonCoupon(
                            textbutton: translateDatabase("تطبيق", "Apply"),
                            onPressed: onApplyCoupon,
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(
                    child: Text(
                      translateDatabase(
                        "كود الكوبون ${controller.couponname!}",
                        "Coupon Code ${controller.couponname!}",
                      ),
                      style: TextStyle(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.primaryColor, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(translateDatabase("السعر", "Price"), style: TextStyle(fontSize: 16)),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(translateDatabase("$price ريال", "$price RYE"), style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(translateDatabase("الخصم", "Discount"), style: TextStyle(fontSize: 16)),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("$discount ", style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     // Container(
                //     //   padding: EdgeInsets.symmetric(horizontal: 20),
                //     //   child: Text(translateDatabase("الشحن", "Shipping"), style: TextStyle(fontSize: 16)),
                //     // ),
                //     Container(
                //       padding: EdgeInsets.symmetric(horizontal: 20),
                //       child: Text("$shipping ", style: TextStyle(fontSize: 16)),
                //     ),
                //   ],
                // ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        translateDatabase("السعر الإجمالي", "Total Price"),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        translateDatabase("$totalprice ريال", "$totalprice RYE"),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          CustomButtonCart(
            textbutton: translateDatabase("تأكيد الطلب", "Place Order"),
            onPressed: () {
              controller.goToCheckout();
              // Get.toNamed(AppRoute.checkout);
            },
          ),
        ],
      ),
    );
  }
}
