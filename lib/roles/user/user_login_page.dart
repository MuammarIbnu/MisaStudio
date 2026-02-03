import 'package:flutter/material.dart';
import 'package:misastudio/routes.dart';
import 'package:misastudio/controllers/navigasi.dart';
import 'package:misastudio/theme/app_text.dart';
import 'package:misastudio/theme/app_color.dart';
import 'package:misastudio/widgets/accesoris/or_divider.dart';
import 'package:misastudio/widgets/buttons/continue_button.dart';
import 'package:misastudio/widgets/buttons/social_button.dart';
import 'package:misastudio/widgets/accesoris/term_text.dart';
import 'package:misastudio/widgets/input_fields/input_field.dart';
import 'package:misastudio/controllers/password.dart';
import 'package:misastudio/controllers/validator.dart';

class LoginUserPage extends StatefulWidget {
  const LoginUserPage({super.key});

  @override
  State<LoginUserPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginUserPage> {
  final navigasi = Navigasi();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordState = PasswordController();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      resizeToAvoidBottomInset: true, // penting agar layout menyesuaikan saat keyboard muncul
      backgroundColor:
      isDark ? AppColor.darkBackground : AppColor.lightBackground,

      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView( // supaya konten bisa digeser saat keyboard muncul
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Sign in and continue as a User',
                style: AppText.body(context).copyWith(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),

              const SizedBox(height: 8),

              /// LOGO
              Image.asset(
                'assets/images/logo misa studio tanpa.png',
                width: 200,
              ),

              const SizedBox(height: 1),

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
                  navigasi.push(context, AppRoutes.userRegisterPage);
                },
                child: Text(
                  'Create one here!',
                  style: AppText.link(context),
                ),
              ),

              const SizedBox(height: 16),

              /// EMAIL FIELD
              InputField(
                controller: emailController,
                hintText: 'email@domain.com',
                label: 'E-mail',
              ),
              const SizedBox(height: 4),
              InputField(
                controller: passwordController,
                hintText: 'minumum 12 characters',
                label: 'Password',
                passwordController: passwordState,
              ),

              /// FORGOT PASSWORD
              const SizedBox(height: 4),
              Align(
                alignment: Alignment.centerRight,
                child:
                  InkWell(
                    onTap: () {
                      // navigasi.push(context, AppRoutes.userDashboardPage);
                    },
                    child: Text(
                      'Forgot Password!',
                      style: AppText.link(context),
                    ),
                  ),
                ),

              const SizedBox(height: 16),

              /// CONTINUE BUTTON
              ContinueButton(
                text: 'Continue',
                onPressed:() {
                  final email = emailController.text.trim();
                  final password = passwordController.text.trim();
                  final isValid = LoginValidator.validateEmail(email, context) && LoginValidator.validatePassword(password, context);

                  if (isValid) {
                    navigasi.push(context, AppRoutes.userDashboardPage);
                  }
                }

              ),

              const SizedBox(height: 24),

              /// OR DIVIDER
              const OrDivider(),

              const SizedBox(height: 16),

              /// SOCIAL BUTTONS
              SocialButton(
                text: 'Continue with Google',
                icon: Icons.g_mobiledata,
                iconSize: 34,
                onPressed: (){
                },
              ),

              const SizedBox(height: 12),

              SocialButton(
                text: 'Continue with Apple',
                icon: Icons.apple,
                iconSize: 30,
                onPressed: (){
                },
              ),

              const SizedBox(height: 20),

              /// TERMS
              const TermsText(),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}