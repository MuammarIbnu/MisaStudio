import 'package:flutter/material.dart';
import 'package:misastudio/theme/app_text.dart';
import 'package:misastudio/theme/app_color.dart';

class ContinueButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ContinueButton({super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.black,
          foregroundColor: AppColor.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          overlayColor: AppColor.white.withOpacity(0.1),
        ),
        child: Text(
          text,
          style: AppText.button(context, color: AppColor.white),
        ),
      ),
    );
  }
}
