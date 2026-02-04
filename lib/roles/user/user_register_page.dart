import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:misastudio/controllers/password.dart';
import 'package:misastudio/theme/app_color.dart';
import 'package:misastudio/theme/app_text.dart';
import '../../controllers/navigasi.dart';
import '../../controllers/validator.dart';
import '../../routes.dart';
import '../../widgets/accesoris/or_divider.dart';
import '../../widgets/buttons/continue_button.dart';
import '../../widgets/buttons/social_button.dart';
import '../../widgets/input_fields/input_field.dart';

class RegisterUserPage extends StatefulWidget {
  const RegisterUserPage({super.key});

  @override
  State<RegisterUserPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterUserPage> {
  final navigasi = Navigasi();
  final _formKey = GlobalKey<FormState>();
  final fullnameController = TextEditingController();
  final emailController = TextEditingController();
  final nohpController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final passwordState = PasswordController();
  String gender = '';
  
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor:
      isDark ? AppColor.darkBackground : AppColor.lightBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              const SizedBox(height: 4),

              /// ===== FORM CARD =====
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColor.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      /// TEXT
                      Center(
                        child: Text(
                          'Account User Register',
                          style: AppText.title(context)
                              .copyWith(color: AppColor.white),
                        ),
                      ),

                      const SizedBox(height: 20),

                      /// INPUTFIELD FULL NAME
                      InputField(
                        controller: fullnameController,
                        hintText: 'Input Full Name',
                        label: 'Full Name',
                      ),

                      /// INPUTFIELD EMAIL
                      InputField(
                        controller: emailController,
                        hintText: 'email@domain.com',
                        label: 'E-mail',
                        keyboardType: TextInputType.emailAddress,
                      ),

                      /// INPUTFIELD PHONE NUMBER
                      InputField(
                        controller: nohpController,
                        hintText: 'Input Phone Number',
                        label: 'Phone Number',
                        keyboardType: TextInputType.phone,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      ),

                      /// INPUTFIELD GENDER
                      DropdownInputField(
                        label: 'Gender',
                        value: gender.isEmpty ? null : gender,
                        options: ['Male', 'Female'],
                        hintText: 'Select Gender',
                        onChanged: (val) {
                          setState(() {
                            gender = val ?? '';
                          });
                        },
                      ),

                      /// INPUTFIELD PASSWORD
                      InputField(
                        controller: passwordController,
                        hintText: 'Minumum 8 Charecters',
                        label: 'Password',
                        passwordController: passwordState,
                      ),

                      /// INPUTFIELD CONFIRM PASSWORD
                      InputField(
                        controller: confirmpasswordController,
                        hintText: 'Confirm Password',
                        label: 'Confirm Password',
                        passwordController: passwordState,
                      ),

                      const SizedBox(height: 24),

                      /// REGISTER BUTTON
                      ContinueButton(
                        text: 'Register',
                        onPressed: (){
                          final fullName = fullnameController.text.trim();
                          final email = emailController.text.trim();
                          final password = passwordController.text.trim();
                          final phoneNumber = nohpController.text.trim();
                          final confirmPassword = confirmpasswordController.text.trim();
                          final isValid =
                              LoginValidator.validateFullName(fullName, context) &&
                              LoginValidator.validateEmail(email, context) &&
                              LoginValidator.validatePhoneNumber(phoneNumber, context) &&
                              LoginValidator.validateGender(gender, context) &&
                              LoginValidator.validatePassword(password, context) &&
                              LoginValidator.validateConfirmPassword(password, confirmPassword, context);

                          if (isValid) {
                            navigasi.removeUntil(context, AppRoutes.userDashboardPage);
                          }
                        },
                      ),

                      const SizedBox(height: 12),

                      /// LOGIN BUTTON
                      ContinueButton(
                        text: 'Login',
                        onPressed: (){
                          navigasi.pop(context, AppRoutes.userLoginPage);
                        },
                      ),

                      const SizedBox(height: 20),

                      /// OR
                      const OrDivider(
                        dividerColor: AppColor.white,
                      ),

                      const SizedBox(height: 20),

                      /// GOOGLE BUTTON
                      SocialButton(
                        text: 'Sign with Google',
                        icon: Icons.g_mobiledata,
                        iconSize: 30,
                        onPressed: (){
                        },
                      ),

                      const SizedBox(height: 12),

                      SocialButton(
                        text: 'Sign with Apple',
                        icon: Icons.apple,
                        iconSize: 30,
                        onPressed: (){
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
