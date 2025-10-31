import 'package:flutter/material.dart';


class buildLanguageButton extends StatelessWidget {
  const buildLanguageButton({super.key, required this.context, required this.text, required this.color, required this.icon, this.onPressed});
 final BuildContext context;
  final String text;
  final Color color;
 final IconData icon;
 final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {


      return SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: onPressed,
          icon: Icon(icon, color: Colors.white),
          label: Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4,
          ),
        ),
      );
    }
  }


