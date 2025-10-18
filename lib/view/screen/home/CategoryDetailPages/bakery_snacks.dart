import 'package:flutter/material.dart';
import 'package:flymarket_customer/view/widget/home/CategoryDetailWidget/custom_category_detail_pages.dart';
import 'package:flymarket_customer/view/widget/home/categories/custom_Search.dart';


class BakerySnacks extends StatelessWidget {
  const BakerySnacks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 70,),
            CustomSearch(),
            SizedBox(height: 10,),
            CustomCategoryDetailPages(),
          ],
        ),
      )
    );
  }
}
