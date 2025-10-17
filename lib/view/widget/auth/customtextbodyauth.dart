import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class Customtextbodyauth extends StatelessWidget {
  const Customtextbodyauth({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
