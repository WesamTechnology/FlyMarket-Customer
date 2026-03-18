import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controller/home/settings/settings_controller.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/constant/imgaeasset.dart';
import '../../../../core/functions/translate_database.dart';

class CustomListInfoSetting extends StatelessWidget {
  const CustomListInfoSetting({super.key});

  @override
  Widget build(BuildContext context) {
    // ربط الكنترولر
    SettingsController controller = Get.put(SettingsController());

    return GetBuilder<SettingsController>(builder: (controller) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: Row(
          children: [
            // قسم الصورة الشخصية مع زر التعديل
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColor.primaryColor.withOpacity(0.2), width: 3),
                  ),
                  child: CircleAvatar(
                    radius: 35.r,
                    backgroundColor: Colors.grey[200],
                    backgroundImage: controller.imagePath != null
                        ? FileImage(File(controller.imagePath!)) as ImageProvider
                        : const AssetImage(AppImageAsset.me),
                  ),
                ),
                InkWell(
                  onTap: () => controller.pickImage(),
                  child: Container(
                    padding: EdgeInsets.all(5.r),
                    decoration: const BoxDecoration(
                      color: AppColor.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.camera_alt, color: Colors.white, size: 18.r),
                  ),
                ),
              ],
            ),

            SizedBox(width: 20.w),

            // قسم المعلومات (الاسم والهاتف)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          controller.username!,
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColor.fourthColor,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () => _showEditNameDialog(context, controller),
                        icon: Icon(Icons.edit_note_rounded, color: AppColor.primaryColor, size: 24.r),
                      ),
                    ],
                  ),
                  Text(
                    controller.phone!,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey[600],
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  // نافذة منبثقة لتعديل الاسم
  void _showEditNameDialog(BuildContext context, SettingsController controller) {
    TextEditingController nameController =
    TextEditingController(text: controller.username);

    Get.defaultDialog(
      title: "",
      titlePadding: EdgeInsets.zero,
      radius: 20,
      content: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColor.primaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.edit,
                color: AppColor.primaryColor,
                size: 35,
              ),
            ),

            SizedBox(height: 12),

            Text(
              translateDatabase("تعديل الاسم", "Edit Name"),
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 5),

            Text(
              translateDatabase("قم بتحديث اسم حسابك", "Update your account name"),
              style: TextStyle(
                fontSize: 13.sp,
                color: Colors.grey,
              ),
            ),

            SizedBox(height: 15),

            TextFormField(
              controller: nameController,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                hintText: translateDatabase("أدخل اسمك", "Enter your name"),
                prefixIcon: Icon(Icons.person_outline),
                filled: true,
                fillColor: Colors.grey.shade100,
                contentPadding:
                EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      side: BorderSide(color: AppColor.primaryColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () => Get.back(),
                    child: Text(
                      translateDatabase("إلغاء", "Cancel"),
                      style: TextStyle(color: AppColor.primaryColor),
                    ),
                  ),
                ),

                SizedBox(width: 10),

                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.primaryColor,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      if (nameController.text.trim().isNotEmpty) {
                        controller.updateUserName(nameController.text.trim());
                        Get.back();
                      }
                    },
                    child: Text(
                      translateDatabase("حفظ", "Save"),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}