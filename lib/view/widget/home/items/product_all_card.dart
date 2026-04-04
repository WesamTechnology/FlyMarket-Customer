import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymarket_customer/controller/home/items_controller.dart';
import 'package:flymarket_customer/core/constant/color.dart';
import 'package:flymarket_customer/core/functions/translate_database.dart';
import 'package:flymarket_customer/data/model/itemsmodel.dart';
import 'package:flymarket_customer/link_api.dart';
import 'package:get/get.dart';
import '../../../../controller/favorite/favorite_controller.dart';
import '../../../../controller/home/items_all_controller.dart';
import '../../../../data/model/product_model.dart';

class ProductAllCard extends GetView<ItemsAllControllerImp> {
  const ProductAllCard({super.key, required this.itemsModel});

  final ItemsModel itemsModel;

  bool _isNetworkImage(String path) {
    return path.startsWith('http') || path.startsWith('https');
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(14.r),
        onTap: () {
          controller.goItemsAllDetails(itemsModel);
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
                        child:GetBuilder<FavoriteController>(
                          builder: (controllerFav) {
                            final fav = controllerFav.isFavorite[itemsModel.itmesId] ?? 0;

                            return IconButton(
                              onPressed: () {
                                if (fav == 1) {
                                  controllerFav.setFavorite(
                                    itemsModel.itmesId!,
                                    0,
                                  );
                                  controllerFav.removeFavorite(
                                      itemsModel.itmesId!,
                                      itemsModel.itmesSuper
                                  );
                                } else {
                                  controllerFav.setFavorite(
                                    itemsModel.itmesId!,
                                    1,
                                  );
                                  controllerFav.addFavorite(
                                      itemsModel.itmesId!,
                                      itemsModel.itmesSuper
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
                   if( itemsModel.itmesDiscount !=0)
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
                           "${itemsModel.itmesDiscount?.toStringAsFixed(1)}%",
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
              ),

              /// --- Product Info ---
              Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.all(10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              translateDatabase(
                                "${itemsModel.itemspricedisount?.toStringAsFixed(2)} ريال يمني",
                                "${itemsModel.itemspricedisount?.toStringAsFixed(2)} RYE",
                              ),
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.green[700],
                              ),
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
    );
  }
}
