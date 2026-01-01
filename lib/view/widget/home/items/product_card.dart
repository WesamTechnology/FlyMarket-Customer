import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymarket_customer/controller/home/items_controller.dart';
import 'package:flymarket_customer/core/class/handlingdataview.dart';
import 'package:flymarket_customer/core/constant/color.dart';
import 'package:flymarket_customer/core/functions/translate_database.dart';
import 'package:flymarket_customer/data/model/itemsmodel.dart';
import 'package:flymarket_customer/link_api.dart';
import 'package:get/get.dart';
import '../../../../controller/favorite/favorite_controller.dart';
import '../../../../core/services/services.dart';
import '../../../../data/model/product_model.dart';

class ProductCard extends GetView<ItemsControllerImp> {
  const ProductCard({super.key, required this.itemsModel});

  final ItemsModel itemsModel;

  @override
  Widget build(BuildContext context) {
    //Get.put(FavoriteController());

    MyServices myServices = Get.find();
    print(
      "====================== User Id : ${myServices.sharedPreferences.getString("id")}",
    );
    return GetBuilder<ItemsControllerImp>(
      builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(14.r),
              onTap: () {
                controller.goToItemsDetails(itemsModel);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    /// --- Product Image ---
                    Expanded(
                      flex: 6,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(14.r),
                            ),
                            child: Hero(
                              tag: "${itemsModel.itmesId}",
                              child: CachedNetworkImage(
                                imageUrl:
                                    "${AppLink.imageItems}/${itemsModel.itmesImage}",
                                fit: BoxFit.fitHeight,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 8.h,
                            right: 8.w,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.9),
                                shape: BoxShape.circle,
                              ),
                              child: GetBuilder<FavoriteController>(
                                builder: (controllerFav) {
                                  final fav = controllerFav
                                      .isFavorite[itemsModel.itmesId];

                                  return IconButton(
                                    onPressed: () {
                                      if (fav == 1) {
                                        controllerFav.setFavorite(
                                          itemsModel.itmesId!,
                                          0,
                                        );
                                        controllerFav.removeFavorite(
                                          itemsModel.itmesId!,
                                        );
                                      } else {
                                        controllerFav.setFavorite(
                                          itemsModel.itmesId!,
                                          1,
                                        );
                                        controllerFav.addFavorite(
                                          itemsModel.itmesId!,
                                        );
                                      }
                                    },
                                    icon: fav == 1
                                        ? Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                          )
                                        : Icon(Icons.favorite_border_outlined),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// --- Product Info ---
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: EdgeInsets.all(10.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              translateDatabase(
                                itemsModel.itmesNameAr!,
                                itemsModel.itmesName!,
                              ),
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  translateDatabase(
                                    "${itemsModel.itmesPrice} ريال يمني",
                                    "${itemsModel.itmesPrice} RYE",
                                  ),
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green[700],
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10.w,
                                      vertical: 6.h,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    elevation: 0,
                                    backgroundColor: Colors.green[600],
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.add_shopping_cart,
                                        size: 14.sp,
                                        color: Colors.white,
                                      ),
                                      SizedBox(width: 4.w),
                                      Text(
                                        "Add",
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          color: Colors.white,
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
