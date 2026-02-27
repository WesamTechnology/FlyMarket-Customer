
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flymarket_customer/core/constant/color.dart';
import 'package:flymarket_customer/view/screen/home/my_cart.dart';
import 'package:flymarket_customer/view/screen/home/categories.dart';
import 'package:flymarket_customer/view/screen/home/favorites.dart';
import 'package:flymarket_customer/view/screen/home/setting_page.dart';
import 'package:flymarket_customer/view/screen/home/shop.dart';
import 'package:flymarket_customer/view/screen/onboarding/onboarding.dart';
import 'package:get/get.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';

import '../../../controller/cart/cart_controller.dart';
import '../../../controller/favorite/my_favorite_controller.dart';
import '../../../controller/home/categories_all_controller.dart';
import '../../../controller/home/home_shop_controller.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  // TabController _tabController;
  MotionTabBarController? _motionTabBarController;

  @override
  void initState() {
    super.initState();

    //// Use normal tab controller
    // _tabController = TabController(
    //   initialIndex: 1,
    //   length: 4,
    //   vsync: this,
    // );

    //// use "MotionTabBarController" to replace with "TabController", if you need to programmatically change the tab
    _motionTabBarController = MotionTabBarController(
      initialIndex: 0,
      length: 5,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();

    // _tabController.dispose();
    _motionTabBarController!.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MotionTabBar(
        controller: _motionTabBarController, // ADD THIS if you need to change your tab programmatically
        initialSelectedTab: "Home",
        labels: const ["Home", "Categories","My Cart","Favourite","Setting"],
        icons: const [
         // Icons.home,
          Icons.home_outlined, // Using a mosque icon for prayers
          Icons.category_outlined,
          Icons.add_shopping_cart_outlined,
          Icons.favorite_border,
          Icons.person_outline,
          // Using a book icon for Quran
         // Icons.settings
        ],

        // optional badges, length must be same with labels

        tabSize: 48.r,
        tabBarHeight: 48.h,
        textStyle:  TextStyle(
          fontSize: 11.sp,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        tabIconColor: AppColor.primaryColor2,
        tabIconSize: 27.0.r,
        tabIconSelectedSize: 26.0.r,
        tabSelectedColor: AppColor.primaryColor,
        tabIconSelectedColor: Colors.white,
        tabBarColor: Colors.white,
          onTabItemSelected: (int value) {
            setState(() {
              _motionTabBarController!.index = value;

              switch (value) {
                case 0:
                  Get.find<HomeShopControllerImp>().refreshPage();
                  break;
                case 1:
                  Get.find<CategoriesAllControllerImp>().refreshPage();
                  break;
                case 2:
                  Get.find<CartController>().refreshPage();
                  break;
                case 3:
                  Get.find<MyFavoriteController>().refreshPage();
                  break;
              }
            });
          }
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(), // swipe navigation handling is not supported
        // controller: _tabController,
        controller: _motionTabBarController,
        children: <Widget>[
          // const Center(
          //   child: Study(),
          // ),
          const Center(
            child: Shop(),
          ),
          const Center(
            child: Categories(),
          ),
          const Center(
            child: MyCart(),
          ),
          const Center(
            child: Favorites(),
          ),
          const Center(
            child: SettingPage(),
          ),
        ],
      ),
    );
  }
}
