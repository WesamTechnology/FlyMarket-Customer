import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/color.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({super.key, this.myControlle, this.onChanged, this.onPressedSearch});

  final TextEditingController? myControlle;
  final void Function(String)? onChanged;
  final void Function()? onPressedSearch;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20).r,
      child: TextField(
        controller: myControlle,
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: IconButton(
            onPressed: onPressedSearch,
            icon: Icon(Icons.search),
          ),
          hintText: "Search",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20).r,
            borderSide: BorderSide(color: AppColor.primaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20).r,
            borderSide: BorderSide(color: AppColor.primaryColor),
          ),
          fillColor: Color(0xffe4f3e4),
          filled: true,
        ),
      ),
    );
  }
}
