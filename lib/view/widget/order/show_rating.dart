
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';

import '../../../controller/orders/order_archive_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imgaeasset.dart';

showRatingDialog(BuildContext context,String ordersId) {
  showDialog(
    context: context,
    barrierDismissible: true, // set to false if you want to force a rating
    builder: (context) => RatingDialog(
    initialRating: 1.0,

    title: Text(
      'Rating Dialog',
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    ),

    message: Text(
      'Tap a star to set your rating. Add more description here if you want.',
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 15),
    ),
    // your app's logo?
    image:Container(
      width: 100,
      height: 170,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
        border: Border.all(
          color: Colors.white,
          width: 4,
        ),
      ),
      child: ClipOval(
        child: Image.asset(
          AppImageAsset.splash2,
          fit: BoxFit.cover,
        ),
      ),
    ),
    submitButtonText: 'Submit',
    commentHint: 'Set your custom comment hint',
    onCancelled: () => print('cancelled'),
    submitButtonTextStyle: TextStyle(color: AppColor.primaryColor),
    onSubmitted: (response) {
      OrderArchiveController controller = Get.find();
      //print('rating: ${response.rating}, comment: ${response.comment}');
      controller.submentRating(ordersId, response.rating.toString(), response.comment);
    },
  ));
}
