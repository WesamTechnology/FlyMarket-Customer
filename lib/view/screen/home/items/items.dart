import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymarket_customer/controller/home/items_controller.dart';
import 'package:flymarket_customer/core/class/handlingdataview.dart';
import 'package:flymarket_customer/data/model/itemsmodel.dart';
import 'package:flymarket_customer/view/widget/home/items/product_card.dart';
import 'package:get/get.dart';

import '../../../../controller/favorite/favorite_controller.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/functions/translate_database.dart';
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
            return  SingleChildScrollView(
              child: Column(
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
                      itemCount:controller.items.length,
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

              ),
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
      padding: EdgeInsets.symmetric(vertical: 10.h),
      separatorBuilder: (_, __) => SizedBox(height: 12.h),
      itemBuilder: (context, index) {
        final item = listSearchData[index];

        return InkWell(
          onTap: () => controller.goToItemsDetails(item),
          borderRadius: BorderRadius.circular(16.r),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(12.r),
              child: Row(
                children: [
                  // 🖼️ قسم الصورة مع شارة الخصم
                  Stack(
                    children: [
                      Container(
                        width: 90.w,
                        height: 90.w,
                        decoration: BoxDecoration(
                          color: AppColor.backgroundcolor,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.r),
                          child: Hero(
                            tag: "${item.itmesId}_search",
                            child: CachedNetworkImage(
                              imageUrl: "${AppLink.imageItems}/${item.itmesImage}",
                              fit: BoxFit.contain,
                              placeholder: (context, url) => Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: AppColor.primaryColor.withOpacity(0.3),
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                              const Icon(Icons.image_not_supported_outlined, color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      if (item.itmesDiscount != null && item.itmesDiscount! > 0)
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12.r),
                                bottomRight: Radius.circular(12.r),
                              ),
                            ),
                            child: Text(
                              "${item.itmesDiscount}%",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),

                  SizedBox(width: 15.w),

                  // 📝 قسم البيانات
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          translateDatabase(item.itmesNameAr!, item.itmesName!),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColor.fourthColor,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          translateDatabase(item.itmesDescAr!, item.itmesDesc!),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey[600],
                            height: 1.3,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (item.itmesDiscount != null && item.itmesDiscount! > 0)
                                  Text(
                                    translateDatabase("${item.itmesPrice} ريال", "${item.itmesPrice} RYE"),
                                    style: TextStyle(
                                      fontSize: 11.sp,
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                Text(
                                  translateDatabase("${item.itemspricedisount} ريال", "${item.itemspricedisount} RYE"),
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                            // أيقونة سهم صغيرة للانتقال
                            Container(
                              padding: EdgeInsets.all(4.r),
                              decoration: BoxDecoration(
                                color: AppColor.primaryColor.withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 14.r,
                                color: AppColor.primaryColor,
                              ),
                            ),
                          ],
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
    );
  }
}
