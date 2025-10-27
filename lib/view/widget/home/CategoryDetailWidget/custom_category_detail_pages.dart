import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/constant/imgaeasset.dart';

class CustomCategoryDetailPages extends StatelessWidget {
  const CustomCategoryDetailPages({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {'title': 'Fresh Fruits & Vegetable', 'image': AppImageAsset.fruits},
      {'title': 'Cooking Oil & Ghee', 'image': AppImageAsset.oil},
      {'title': 'Meat & Fish', 'image': AppImageAsset.meat},
      {'title': 'Bakery & Snacks', 'image': AppImageAsset.bakery},
      {'title': 'Dairy & Eggs', 'image': AppImageAsset.dairy},
      {'title': 'Beverages', 'image': AppImageAsset.beverages},
    ];

    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7).r,
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 13.w,
          mainAxisSpacing: 13.h,
          childAspectRatio: 0.61.h,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final item = categories[index];
          return InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20).r,
                border: Border.all(color: Colors.black26, width: 1.3.w),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0).r,
                      child: Image.asset(item['image'], fit: BoxFit.contain),
                    ),
                  ),
                  Text(
                    item['title'],
                    textAlign: TextAlign.center,
                    style:  TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Text("180 gm",textAlign: TextAlign.start, style:  TextStyle(fontSize: 13.sp)),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 5,bottom: 5).r ,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("\$ 199 "),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xff92dd84),
                            borderRadius: BorderRadius.circular(16).r,
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.add),
                          ),
                        ),
                      ],
                    ),
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
