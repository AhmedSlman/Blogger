import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';

class AuthHeaderTextWidget extends StatelessWidget {
  const AuthHeaderTextWidget({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppStyles.s40,
    );
  }
}
