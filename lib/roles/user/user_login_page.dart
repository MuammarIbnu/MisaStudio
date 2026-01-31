import 'package:flutter/material.dart';
import 'package:misastudio/routes.dart';
import 'package:misastudio/theme/app_theme.dart';
import 'package:misastudio/theme/app_text.dart';
import 'package:misastudio/theme/app_color.dart';
import 'package:misastudio/widgets/buttons/continue_button.dart';
import 'package:misastudio/widgets/buttons/social_button.dart';
import 'package:misastudio/widgets/input_fields/email.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();

  void _continue() {
    if (emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email tidak boleh kosong')),
      );
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark
          ? AppColor.darkBackground
          : AppColor.lightBackground,

      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 18),

              /// LOGO
              Image.asset(
                'assets/images/logo misa studio tanpa.png',
                width: 260,
              ),

              const SizedBox(height: 4),

              /// REGISTER TEXT
              Text(
                "Didn't have account ?",
                style: AppText.caption(context).copyWith(
                  color: AppColor.black,
                ),
              ),
              const SizedBox(height: 4),
              InkWell(
                onTap: () {
                  // Navigator.pushNamed(context, AppRoutes.register);
                },
                child: Text(
                  'Create one here!',
                  style: AppText.link(context),
                ),
              ),

              const SizedBox(height: 32),

              /// EMAIL FIELD
              EmailInput(controller: emailController),

              const SizedBox(height: 16),

              /// CONTINUE BUTTON
              ContinueButton(
                text: 'Continue',
                onPressed: _continue,
              ),

              const SizedBox(height: 24),

              /// OR DIVIDER
              const _OrDivider(),

              const SizedBox(height: 16),

              /// SOCIAL BUTTONS
              const SocialButton(
                text: 'Continue with Google',
                icon: Icons.g_mobiledata,
                iconSize: 34,
              ),
              const SizedBox(height: 12),
              const SocialButton(
                text: 'Continue with Apple',
                icon: Icons.apple,
                iconSize: 30,
              ),

              const SizedBox(height: 20),

              /// TERMS
              const _TermsText(),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}


///Divider OR
class _OrDivider extends StatelessWidget {
  const _OrDivider();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(child: Divider(
          color: AppColor.grey,
        )
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text('or',
              style: TextStyle(
                  color: AppColor.black)
          ),
        ),
        Expanded(child: Divider(
          color: AppColor.grey,
        )
        ),
      ],
    );
  }
}

///Term Text
class _TermsText extends StatelessWidget {
  const _TermsText();

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: AppText.caption(context),
        children: const [
          TextSpan(
              text: 'By clicking continue, you agree to our ',
              style: TextStyle(fontWeight: FontWeight.normal)
          ),
          TextSpan(
            text: 'Terms of Service\n',
            style: const TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ),
          TextSpan(text: 'and '),
          TextSpan(
            text: 'Privacy Policy',
            style: const TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}