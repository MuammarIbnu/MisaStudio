import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:misastudio/controllers/password.dart';
import 'package:misastudio/theme/app_color.dart';
import 'package:misastudio/theme/app_text.dart';
import '../../controllers/navigasi.dart';
import '../../routes.dart';
import '../../widgets/buttons/continue_button.dart';
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

                      const SizedBox(height: 12),

                      Container(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: (){}, ///Belum ada Navigasi
                          child: Text(
                            'Forgot Password?',
                            style: AppText.caption(context)
                                .copyWith(color: AppColor.grey.shade300),
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      /// REGISTER BUTTON
                      ContinueButton(
                        text: 'Register',
                        onPressed: (){
                          // Isi navigasi
                        },
                      ),

                      const SizedBox(height: 16),

                      /// LOGIN BUTTON
                      ContinueButton(
                        text: 'Login',
                        onPressed: (){
                          navigasi.pop(context, AppRoutes.user_login_page);
                        },
                      ),

                      const SizedBox(height: 20),

                      /// OR
                      Row(
                        children: [
                          Expanded(
                            child: Divider(color: AppColor.white),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              'Or',
                              style: AppText.caption(context)
                                  .copyWith(color: AppColor.grey),
                            ),
                          ),
                          Expanded(
                            child: Divider(color: AppColor.white),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      /// GOOGLE BUTTON
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          onPressed: () {
                            // Navigator.pushReplacementNamed(context, AppRoutes.home);
                          },
                          icon: const Icon(
                            Icons.g_mobiledata,
                            size: 28,
                            color: AppColor.white,
                          ),
                          label: Text(
                            'Sign in with Google',
                            style: AppText.body(context).copyWith(color: AppColor.white),
                          ),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: AppColor.white),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            alignment: Alignment.center, // ⬅️ ini opsional tapi rapi
                          ),
                        ),
                      )
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

/// ===== SMALL WIDGETS =====

class _CountryCode extends StatelessWidget {
  final BorderRadius radius;

  const _CountryCode({required this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: radius,
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('🇮🇩', style: TextStyle(fontSize: 16)),
          SizedBox(width: 4),
          Text('+62', style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool outlined;
  final FontWeight? fontWeight;
  final Color? color;

  const _PrimaryButton({
    required this.text,
    required this.onPressed,
    this.outlined = false,
    this.fontWeight,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: outlined
          ? OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColor.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding:
          const EdgeInsets.symmetric(vertical: 14),
        ),
        child: Text(
          text,
          style: AppText.body(context)
              .copyWith(color: AppColor.white),
        ),
      )
          : ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? AppColor.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding:
          const EdgeInsets.symmetric(vertical: 14),
        ),
        child: Text(
          text,
          style: AppText.body(context)
              .copyWith(color: AppColor.white),
        ),
      ),
    );
  }
}


// class InputField extends StatefulWidget {
//   final bool obscure;
//   final bool isPassword;
//   final TextEditingController? controller;
//
//   const InputField({
//     super.key,
//     this.obscure = false,
//     this.isPassword = false,
//     this.controller,
//   });
//
//   @override
//   State<InputField> createState() => _InputFieldState();
// }
//
// class _InputFieldState extends State<InputField> {
//   late bool _obscureText;
//
//   @override
//   void initState() {
//     super.initState();
//     _obscureText = widget.obscure;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: widget.controller,
//       obscureText: widget.isPassword ? _obscureText : false,
//       validator: (v) => v == null || v.isEmpty ? 'Required' : null,
//       decoration: InputDecoration(
//         filled: true,
//         fillColor: Colors.white, // ganti sesuai AppColor.white
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide.none,
//         ),
//         suffixIcon: widget.isPassword
//             ? IconButton(
//           icon: Icon(
//             _obscureText ? Icons.visibility_off : Icons.visibility,
//             color: Colors.grey,
//           ),
//           onPressed: () {
//             setState(() {
//               _obscureText = !_obscureText;
//             });
//           },
//         )
//             : null,
//       ),
//     );
//   }
// }