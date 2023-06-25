import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tentwenty_test/core/utils/theme/app_colors.dart';
import 'package:tentwenty_test/core/utils/widgets/app_text.dart';

class GenreCard extends StatelessWidget {
  const GenreCard(
    this.genreTitle, {
    super.key,
    required this.color,
    this.textColor = AppColors.white,
  });

  final String genreTitle;
  final Color color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: color,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16.0.w,
        vertical: 6.0.w,
      ),
      child: AppText(
        text: genreTitle,
        color: textColor,
        fontSize: 12.0.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
