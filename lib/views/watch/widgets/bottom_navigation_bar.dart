import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/utils/constants/app_assets.dart';
import '../../../core/utils/constants/app_strings.dart';
import '../../../core/utils/theme/app_colors.dart';

class AppBottomNavigationBar extends StatefulWidget {
  const AppBottomNavigationBar({super.key});

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0.r),
          topRight: Radius.circular(24.0.r),
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: index,
        iconSize: 18.0.w,
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.grey,
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 10.0.sp,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 10.0.sp,
          fontWeight: FontWeight.w400,
        ),
        selectedFontSize: 10.0.sp,
        unselectedFontSize: 10.0.sp,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.icDashboard,
              color: index == 0 ? AppColors.white : AppColors.grey,
              width: 16.0.w,
              height: 16.0.w,
            ),
            backgroundColor: AppColors.darkBlue,
            label: AppStrings.dashboard,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.icWatch,
              color: index == 1 ? AppColors.white : AppColors.grey,
              width: 16.0.w,
              height: 16.0.w,
            ),
            backgroundColor: AppColors.darkBlue,
            label: AppStrings.watch,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.icMediaLibrary,
              color: index == 2 ? AppColors.white : AppColors.grey,
              width: 16.0.w,
              height: 16.0.w,
            ),
            backgroundColor: AppColors.darkBlue,
            label: AppStrings.mediaLibrary,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.icMore,
              color: index == 3 ? AppColors.white : AppColors.grey,
              width: 16.0.w,
              height: 16.0.w,
            ),
            backgroundColor: AppColors.darkBlue,
            label: AppStrings.more,
          ),
        ],
      ),
    );
  }
}
