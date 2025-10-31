import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymarket_customer/core/constant/imgaeasset.dart';

import '../../../../data/model/supermarket_model.dart';
import '../../../screen/home/SupermarketDetails/supermarket_details_page.dart';

class CustomGridview extends StatelessWidget {
  const CustomGridview({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // عدد الأعمدة
        crossAxisSpacing: 9.w,
        mainAxisSpacing: 9.h,
        childAspectRatio: 0.7.h, // يتحكم بنسبة الطول إلى العرض
      ),
      itemCount: 8, // عدد العناصر
      padding: const EdgeInsets.all(5).r,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: Color(0xffe7fae7),
            borderRadius: BorderRadius.circular(15).r,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 4,
                offset: const Offset(2, 2),
              ),
            ],
          ),
          child: GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SupermarketDetailsPage(
                    name: "FlyMarket",
                    image: AppImageAsset.shop,
                    location: "Sanaa",
                    rating: 4.8,
                    products:  [
                      ProductModel(name: "Pepper Red", price: 500, image: AppImageAsset.pepper_red, id: ''),
                      ProductModel(name: "Sprite Can", price: 300, image: AppImageAsset.spriteCan, id: ''),
                      ProductModel(name: "Pepper Red", price: 500, image: AppImageAsset.pepper_red, id: ''),
                      ProductModel(name: "Sprite Can", price: 300, image: AppImageAsset.spriteCan, id: ''),
                      ProductModel(name: "Pepper Red", price: 500, image: AppImageAsset.pepper_red, id: ''),
                      ProductModel(name: "Sprite Can", price: 300, image: AppImageAsset.spriteCan, id: ''),

                    ],
                  ),
                ),
              );

            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(13).r,
                    ),
                    child: Image.asset(
                      AppImageAsset.shop,
                      fit: BoxFit.fill,
                      width: double.infinity,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(7.0).r,
                  child: Text(
                    'FlyMarket ',
                    style: TextStyle(
                      fontSize: 14.5.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
