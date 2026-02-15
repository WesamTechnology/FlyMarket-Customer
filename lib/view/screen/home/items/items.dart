import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymarket_customer/controller/home/items_controller.dart';
import 'package:flymarket_customer/core/class/handlingdataview.dart';
import 'package:flymarket_customer/data/model/itemsmodel.dart';
import 'package:flymarket_customer/view/widget/home/items/product_card.dart';
import 'package:get/get.dart';

import '../../../../controller/favorite/favorite_controller.dart';
import '../../../../link_api.dart';
import '../../../widget/home/categories/custom_Search.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    FavoriteController controllerFav = Get.put(FavoriteController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(7.0).r,
        child: GetBuilder<ItemsControllerImp>(
          builder: (controller) {
            return  Column(
                children: [
                  SizedBox(height: 60.h),
                  CustomSearch(
                    myControlle: controller.search,
                    onChanged: (val) {
                      controller.checkSearch(val);
                    },
                    onPressedSearch: () {
                      controller.onSearchItem();
                    },
                  ),
                  SizedBox(height: 10.h),
                  HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget:!controller.isSearch
                        ?
                    GridView.builder(
                    itemCount: controller.items.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                    ),
                    itemBuilder: (BuildContext context, index) {
                      // print(
                      //   "===========================lenth = ${controller.items.length}==================================",
                      // );
                      return ProductCard(
                        itemsModel: ItemsModel.fromJson(
                          controller.items[index],
                        ),
                      );
                    },
                  ): ListSearch(listSearchData: controller.listData),)
                ],

            );
          },
        ),
      ),
    );
  }
}


class ListSearch extends GetView<ItemsControllerImp> {
  const ListSearch({super.key, required this.listSearchData});

  final List<ItemsModel> listSearchData;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: listSearchData.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final item = listSearchData[index];

        return InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: () {
            controller.goToItemsDetails(item);
          },
          child: Card(
            elevation: 3,
            shadowColor: Colors.black12,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // 🖼️ Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      imageUrl:
                      "${AppLink.imageItems}/${item.itmesImage}",
                      width: 80,
                      height: 80,
                      fit: BoxFit.contain,
                      placeholder: (context, url) => Container(
                        width: 80,
                        height: 80,
                        alignment: Alignment.center,
                        color: Colors.grey.shade200,
                        child: const CircularProgressIndicator(strokeWidth: 2),
                      ),
                      errorWidget: (context, url, error) =>
                      const Icon(Icons.broken_image, size: 40),
                    ),
                  ),

                  const SizedBox(width: 12),

                  // 📝 Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.itmesName ?? "",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const SizedBox(height: 6),

                        Text(
                          item.itmesDesc ?? "",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey.shade600,
                          ),
                        ),

                        const SizedBox(height: 8),

                        // 💰 Price
                        Row(
                          children: [
                            Text(
                              "${item.itmesPrice} \$",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                            const SizedBox(width: 6),
                            if (item.itmesDiscount != null &&
                                item.itmesDiscount! > 0)
                              Text(
                                "-${item.itmesDiscount}%",
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // 👉 Arrow
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
