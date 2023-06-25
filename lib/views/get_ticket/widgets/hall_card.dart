import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/utils/theme/app_colors.dart';

class HallCard extends StatelessWidget {
  const HallCard({
    super.key,
    required this.time,
    required this.dollar,
    required this.bonus,
  });

  final String time;
  final String dollar;
  final String bonus;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        width: 1.0.sw * 0.60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: time,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12.0.sp,
                  color: AppColors.darkBlue,
                ),
                children: [
                  TextSpan(
                    text: '    Cinetech + hall 1',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.0.sp,
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.0.h),
            Container(
              width: 1.0.sw * 0.60,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.sky,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(16.0.r),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 24.0.w,
                vertical: 4.0.w,
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/icons/ic_hall.svg',
                ),
              ),
            ),
            SizedBox(height: 8.0.h),
            RichText(
              text: TextSpan(
                text: 'From ',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12.0.sp,
                  color: AppColors.grey,
                ),
                children: [
                  TextSpan(
                    text: '$dollar\$',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0.sp,
                      color: AppColors.darkBlue,
                    ),
                  ),
                  TextSpan(
                    text: ' or ',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.0.sp,
                      color: AppColors.grey,
                    ),
                  ),
                  TextSpan(
                    text: '$bonus bonus',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0.sp,
                      color: AppColors.darkBlue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
