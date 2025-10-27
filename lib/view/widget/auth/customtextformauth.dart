import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomTextFormAuth extends StatelessWidget {
  const CustomTextFormAuth(
      {super.key, required this.hintTextl, required this.labelTextl, required this.icon, this.controller, required this.val, this.keyboardType = TextInputType.text});

  final String hintTextl;
  final String labelTextl;
  final IconData icon;

  final TextEditingController? controller;
  final String? Function(String?)? val;
  final TextInputType? keyboardType ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType:keyboardType,
      validator: val,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 12).r,
        hintText: hintTextl,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: labelTextl,
        suffix: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20).r,
        ),
      ),
    );
  }
}
