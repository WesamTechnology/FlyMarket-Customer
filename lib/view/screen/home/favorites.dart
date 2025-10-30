import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymarket_customer/core/constant/imgaeasset.dart';
import 'package:flymarket_customer/view/widget/home/favorites/custom_card_favorites.dart';
import 'package:flymarket_customer/view/widget/home/myCart/custom_title.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            CustomTitle(title: "Favorites"),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return CustomCardFavorites(
                    title: "Sprite Can",
                    subtitle: "325ml, Price",
                    image: AppImageAsset.spriteCan,
                    price: r"$1.50",
                    onPressedFavorite: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
