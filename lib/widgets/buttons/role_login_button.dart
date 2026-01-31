import 'package:flutter/material.dart';
import 'package:misastudio/theme/app_color.dart';
import 'package:misastudio/widgets/buttons/role_login_button.dart';

class RoleLoginButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  const RoleLoginButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
    });

  @override
  Widget build(BuildContext context){
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 56,
            decoration: BoxDecoration(
              color: AppColor.primary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Icon(
                icon,
                color: AppColor.orangeaccent,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(label),
        ],
      ),
    );
  }
}