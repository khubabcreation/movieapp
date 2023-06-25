import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/app_colors.dart';

class AppText extends StatelessWidget {
  const AppText({
    Key? key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
  }) : super(key: key);

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? AppColors.white,
        fontWeight: fontWeight ?? FontWeight.normal,
        fontSize: fontSize ?? 16.0.sp,
      ),
    );
  }
}
