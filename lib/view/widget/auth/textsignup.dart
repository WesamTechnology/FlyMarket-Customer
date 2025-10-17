import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class TextSignUpOrSignIn extends StatelessWidget {
  const TextSignUpOrSignIn({super.key, required this.textOne, required this.textTow, this.onPressed});

  final String textOne;
  final String textTow;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(textOne),
        TextButton(
          onPressed: onPressed,
          child: Text(
            textTow,
            style: TextStyle(color: AppColor.primaryColor),
          ),
        ),
      ],
    );
  }
}
