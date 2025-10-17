import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class Customtexttitleauth extends StatelessWidget {
  const Customtexttitleauth({super.key, required this.text});
final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineMedium,
      textAlign: TextAlign.center,
    );
  }
}
