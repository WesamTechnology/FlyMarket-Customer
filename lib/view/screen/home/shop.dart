import 'package:flutter/material.dart';
import 'package:flymarket_customer/core/constant/color.dart';
import 'package:flymarket_customer/view/widget/home/home_page/custom_gridview.dart';
import 'package:flymarket_customer/view/widget/home/home_page/custom_sarouselslider.dart';


class Shop extends StatelessWidget {
  const Shop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
        child: Column(
           children: [
             SizedBox(height: 50,),
             Text("Order to",style: TextStyle(color: AppColor.black,fontSize:20 ),),
             SizedBox(height: 5,),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Icon(Icons.location_on),
                 Text("Yemen, Sanaa")
               ]
             ),
             SizedBox(height: 20,),
             ImageSliderPage(),
             SizedBox(height: 20,),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text("The Shop",style: TextStyle(color: AppColor.black,fontSize:22 ),),
                 IconButton(onPressed: (){}, icon: Icon(Icons.drag_handle,size: 30,))
               ],
             ),
             SizedBox(height: 20,),
             CustomGridview()
             
           ],
        ),
      )
    );
  }
}
