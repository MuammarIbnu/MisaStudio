import 'package:flutter/material.dart';
import 'package:misastudio/theme/app_color.dart';

///Divider OR
class OrDivider extends StatelessWidget {
  final String text;
  final Color dividerColor;

  const OrDivider({
    super.key,
    this.text = 'or',
    this.dividerColor = AppColor.grey,

  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: dividerColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            text, // gunakan properti text
            style: const TextStyle(
              color: AppColor.black,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: dividerColor,
          ),
        ),
      ],
    );
  }
}