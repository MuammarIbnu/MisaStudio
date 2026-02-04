import 'package:flutter/material.dart';
import 'package:misastudio/theme/app_text.dart';
import 'package:misastudio/theme/app_color.dart';

class SocialButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final double iconSize;
  final VoidCallback onPressed;

  const SocialButton({
    super.key,
    required this.text,
    required this.icon,
    this.iconSize = 24,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColor.white,
          foregroundColor: AppColor.black,
          side: BorderSide(
            color: AppColor.grey.shade300,
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          overlayColor: AppColor.black.withOpacity(0.05), // => EFEK DI PRESS
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: iconSize),
            const SizedBox(width: 12),
            Text(
              text,
              style: AppText.button(context, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}