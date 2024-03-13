// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:blogger/core/utils/app_colors.dart';
import 'package:blogger/core/utils/app_styles.dart';

class AuthGradientButton extends StatelessWidget {
  const AuthGradientButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            AppColors.gradient1,
            AppColors.gradient2,
            AppColors.gradient3,
          ],
        ),
        borderRadius: BorderRadius.circular(7),
      ),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(390, 55),
          backgroundColor: AppColors.transparentColor,
        ),
        child: Text(
          text,
          style: AppStyles.s17,
        ),
      ),
    );
  }
}
