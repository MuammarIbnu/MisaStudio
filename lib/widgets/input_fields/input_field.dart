import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:misastudio/theme/app_color.dart';
import 'package:misastudio/controllers/password.dart';

/// INPUTFIELD
class InputField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? hintText;
  final String? label;
  final PasswordController? passwordController;

  const InputField({
    super.key,
    required this.controller,
    this.hintText,
    this.label,
    this.passwordController,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,

  });

  @override
  Widget build(BuildContext context) {
    final field = AnimatedBuilder(
      animation: passwordController ?? Listenable.merge([]),
      builder: (context, _) {
        final isObscure = passwordController?.obscure ?? false;

        return TextField(
          controller: controller,
          obscureText: isObscure,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          style: const TextStyle(
            fontFamily: 'Urbanist',
            color: AppColor.black,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              color: AppColor.black26,
              fontFamily: 'Urbanist',
              fontSize: 14,
            ),
            filled: true,
            fillColor: AppColor.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            suffixIcon: passwordController != null
                ? IconButton(
              icon: Icon(
                isObscure ? Icons.visibility_off : Icons.visibility,
                color: AppColor.black26,
              ),
              onPressed: passwordController!.toggle,
            )
                : null,
          ),
        );
      },
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: const TextStyle(
              fontFamily: 'Urbanist',
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColor.black,
            ),
          ),
          const SizedBox(height: 6),
        ],
        field,
      ],
    );
  }
}

/// DROPDOWNINPUTFIELD
class DropdownInputField extends StatelessWidget {
  final String? label;
  final String? value;
  final List<String> options;
  final ValueChanged<String?> onChanged;

  const DropdownInputField({
    super.key,
    this.label,
    required this.value,
    required this.options,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final field = DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColor.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      hint: Text(
        "Select $label",
        style: const TextStyle(
          color: AppColor.black26,
          fontFamily: 'Urbanist',
        ),
      ),
      style: const TextStyle(
        fontFamily: 'Urbanist',
        color: AppColor.black,
      ),
      items: options.map((String option) {
        return DropdownMenuItem<String>(
          value: option,
          child: Text(option),
        );
      }).toList(),
      onChanged: onChanged,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: const TextStyle(
              fontFamily: 'Urbanist',
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColor.black,
            ),
          ),
          const SizedBox(height: 6),
        ],
        field,
      ],
    );
  }
}
