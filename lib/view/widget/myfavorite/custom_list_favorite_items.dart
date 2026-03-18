import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/favorite/my_favorite_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/translate_database.dart';
import '../../../data/model/my_favorite_model.dart';
import '../../../link_api.dart';

class CustomListFavoriteItems extends GetView<MyFavoriteController> {
  const CustomListFavoriteItems({super.key, required this.itemsModel});

  final MyFavoriteModel itemsModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItemsDetails(itemsModel);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // صورة المنتج
                  Expanded(
                    flex: 4,
                    child: Center(
                      child: Hero(
                        tag: "${itemsModel.itmesId}",
                        child: CachedNetworkImage(
                          imageUrl: "${AppLink.imageItems}/${itemsModel.itmesImage!}",
                          fit: BoxFit.contain,
                          placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(
                              color: AppColor.primaryColor.withOpacity(0.3),
                              strokeWidth: 2,
                            ),
                          ),
                          errorWidget: (context, url, error) => const Icon(Icons.error_outline),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // اسم المنتج
                  Text(
                    translateDatabase(
                      itemsModel.itmesNameAr!,
                      itemsModel.itmesName!,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColor.black,
                    ),
                  ),

                  const SizedBox(height: 4),

                  // وصف المنتج (مختصر)
                  Text(
                    translateDatabase(
                      itemsModel.itmesDescAr!,
                      itemsModel.itmesDesc!,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                      height: 1.2,
                    ),
                  ),

                  const Spacer(),

                  // السعر وزر الحذف
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        translateDatabase("${itemsModel.itemspricedisount} ريال", "${itemsModel.itemspricedisount} RYE"),
                        style: const TextStyle(
                          color: AppColor.primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: "sans-serif",
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.red[50] ,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          constraints: const BoxConstraints(),
                          padding: const EdgeInsets.all(6),
                          onPressed: () {
                            controller.deleteFromFavorite(
                              itemsModel.favoriteId!.toString(),
                            );
                          },
                          icon: const Icon(
                            Icons.delete_rounded,
                            color: Colors.redAccent,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // شارة الخصم (Discount Badge)
            if (itemsModel.itmesDiscount != "0")
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: Text(
                    "- ${itemsModel.itmesDiscount}%",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}