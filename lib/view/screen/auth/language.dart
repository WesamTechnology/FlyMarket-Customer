
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';
import '../../../core/localization/changelocal.dart';
import '../../widget/languages.dart';

class Language extends GetView<LocaleController> {
  const Language(  {super.key, required this.appRoute});

 final String appRoute ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20).r,
          ),
          margin:  EdgeInsets.symmetric(horizontal: 24.w),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.language,
                  size: 60.r,
                  color: AppColor.primaryColor,
                ),
                const SizedBox(height: 16),
                Text(
                  "1".tr, // النص المترجم
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColor.black,
                  ),
                ),
                 SizedBox(height: 30.h),
                buildLanguageButton(
                  context:  context,
                 text:  'English',
                color:   AppColor.primaryColor,
                 icon:  Icons.flag,
                onPressed:   () {
                     controller.changeLang("en");
                     Get.offAllNamed(appRoute );
                  },
                ),
                 SizedBox(height: 16.h),
                buildLanguageButton(
                 context:  context,
                 text:  'العربية',
                color:   AppColor.primaryColor,
                 icon:  Icons.translate,
                  onPressed:     () {
                    controller.changeLang("ar");
                    Get.offAllNamed(appRoute);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }}
//
//   Widget _buildLanguageButton(
//       BuildContext context,
//       String text,
//       Color color,
//       IconData icon,
//       void Function()? onPressed,
//       ) {
//     return SizedBox(
//       width: double.infinity,
//       child: ElevatedButton.icon(
//         onPressed: onPressed,
//         icon: Icon(icon, color: Colors.white),
//         label: Text(
//           text,
//           style: const TextStyle(
//             fontSize: 18,
//             color: Colors.white,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         style: ElevatedButton.styleFrom(
//           backgroundColor: color,
//           padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//           elevation: 4,
//         ),
//       ),
//     );
//   }
// }
