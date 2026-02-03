import 'package:flutter/material.dart';
import 'package:misastudio/theme/app_text.dart';

///Term Text
class TermsText extends StatelessWidget {
  const TermsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: AppText.caption(context),
        children: const [
          TextSpan(
              text: 'By clicking continue, you agree to our ',
              style: TextStyle(fontWeight: FontWeight.w300)
          ),
          TextSpan(
            text: 'Terms of Service\n',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: 'and ',
            style: TextStyle(fontWeight: FontWeight.w300)
          ),
          TextSpan(
            text: 'Privacy Policy',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}