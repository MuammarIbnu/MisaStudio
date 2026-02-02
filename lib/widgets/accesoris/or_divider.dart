import 'package:flutter/material.dart';
import 'package:misastudio/theme/app_color.dart';

///Divider OR
class OrDivider extends StatelessWidget {
  final String text;

  const OrDivider({
    super.key,
    this.text = 'or', // default value
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: AppColor.grey,
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
        const Expanded(
          child: Divider(
            color: AppColor.grey,
          ),
        ),
      ],
    );
  }
}