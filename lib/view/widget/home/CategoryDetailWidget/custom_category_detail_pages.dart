import 'package:flutter/material.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 0.8,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final item = categories[index];
          return InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black26, width: 1.5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(item['image'], fit: BoxFit.contain),
                    ),
                  ),
                  Text(
                    item['title'],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Text("180 gm",textAlign: TextAlign.start, style: const TextStyle(fontSize: 15)),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 5,bottom: 5) ,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("\$ 199 "),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xff53B175),
                            borderRadius: BorderRadius.circular(21),
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
