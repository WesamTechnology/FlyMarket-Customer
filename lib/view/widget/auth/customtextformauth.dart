import 'package:flutter/material.dart';


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
        contentPadding: EdgeInsets.symmetric(horizontal: 25),
        hintText: hintTextl,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: labelTextl,
        suffix: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
