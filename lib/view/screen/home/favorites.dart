import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymarket_customer/core/constant/imgaeasset.dart';
import 'package:flymarket_customer/view/widget/home/favorites/custom_card_favorites.dart';
import 'package:flymarket_customer/view/widget/home/myCart/custom_title.dart';
import 'package:get/get.dart';

import '../../../controller/favorite/my_favorite_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../widget/myfavorite/custom_list_favorite_items.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            CustomTitle(title: "Favorites"),
            SizedBox(height: 10),
            GetBuilder<MyFavoriteController>(
              builder: (controller) {
                return HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.data.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                    ),
                    itemBuilder: (context, index) {
                      return CustomListFavoriteItems(
                        itemsModel: controller.data[index],
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
