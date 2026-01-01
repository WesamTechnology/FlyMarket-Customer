import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
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
    Get.put(MyFavoriteController());
    return GetBuilder<MyFavoriteController>(
      builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: InkWell(
            onTap: () {
              //controller.goToProductDetails(itemsModel);
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: CachedNetworkImage(
                        imageUrl:
                            AppLink.imageItems + "/" + itemsModel.itmesImage!,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        translateDatabase(
                          itemsModel.itmesNameAr!,
                          itemsModel.itmesName!,
                        ),
                        style: TextStyle(fontSize: 20, color: AppColor.black),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          translateDatabase(
                            itemsModel.itmesDescAr!,
                            itemsModel.itmesDesc!,
                          ),
                          style: TextStyle(fontSize: 15, color: AppColor.grey2),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${itemsModel.itmesPrice}\$",
                            style: TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 20,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              controller.deleteFromFavorite(
                                itemsModel.favoriteId!.toString(),
                              );
                            },
                            icon: Icon(Icons.delete_outline, color: Colors.red),
                          ),
                        ],
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
