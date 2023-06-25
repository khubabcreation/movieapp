import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/theme/app_colors.dart';

class HeroBar extends StatelessWidget {
  const HeroBar({
    super.key,
    required this.child,
    required this.height,
  });
  final Widget child;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.0.w,
        vertical: 4.0.w,
      ),
      height: height,
      width: double.infinity,
      color: AppColors.white,
      child: Center(
        child: child,
      ),
    );
  }
}
