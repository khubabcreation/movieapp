import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'app_text.dart';

class ErrorCard extends StatelessWidget {
  const ErrorCard({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppText(
        text: message,
        color: AppColors.red,
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
