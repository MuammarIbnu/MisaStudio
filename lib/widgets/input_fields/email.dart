import 'package:flutter/material.dart';
import 'package:misastudio/theme/app_theme.dart';
import 'package:misastudio/theme/app_text.dart';
import 'package:misastudio/theme/app_color.dart';

class EmailInput extends StatelessWidget {
  final TextEditingController controller;

  const EmailInput({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: AppText.body(context),
      decoration: InputDecoration(
        hintText: 'email@domain.com',
        hintStyle: TextStyle(
            color: AppColor.black26,
            fontFamily: 'Urbanist'
        ),
        filled: true,
        fillColor: AppColor.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}