import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:misastudio/controllers/password.dart';
import 'package:misastudio/theme/app_color.dart';
import 'package:misastudio/theme/app_text.dart';
import '../../controllers/navigasi.dart';
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
  String gender = 'Male';
  
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
                      Center(
                        child: Text(
                          'Account User Register',
                          style: AppText.title(context)
                              .copyWith(color: AppColor.white),
                        ),
                      ),

                      const SizedBox(height: 20),

                      InputField(
                        controller: fullnameController,
                        hintText: 'input Full Name',
                        label: 'Full Name',
                      ),

                      InputField(
                        controller: emailController,
                        hintText: 'email@domain.com',
                        label: 'E-mail',
                      ),

                      InputField(
                        controller: nohpController,
                        hintText: 'input phone number',
                        label: 'Phone Number',
                        keyboardType: TextInputType.phone,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      ),

                      DropdownInputField(
                        label: 'Gender',
                        value: gender,
                        options: ['Male', 'Female'],
                        onChanged: (val) {
                          setState(() {
                            gender = val!;
                          });
                        },
                      ),

                      InputField(
                        controller: passwordController,
                        hintText: 'minumum 12 charecters',
                        label: 'Password',
                        passwordController: passwordState,
                      ),

                      InputField(
                        controller: confirmpasswordController,
                        hintText: 'confirm password',
                        label: 'Confirm Password',
                        passwordController: passwordState,
                      ),

                      const SizedBox(height: 24),

                      /// REGISTER BUTTON
                      ContinueButton(
                        text: 'Register',
                        onPressed: (){
                          // Isi navigasi
                        },
                      ),

                      const SizedBox(height: 12),

                      /// LOGIN BUTTON
                      ContinueButton(
                        text: 'Login',
                        onPressed: (){
                          navigasi.pop(context, AppRoutes.user_login_page);
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
