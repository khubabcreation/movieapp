import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/utils/theme/app_colors.dart';
import '../../core/utils/constants/app_routes.dart';
import '../../core/utils/widgets/app_text.dart';
import '../watch/widgets/hero_bar.dart';

class SelectSeatScreen extends StatelessWidget {
  const SelectSeatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context),
            Expanded(
              child: Column(
                children: [
                  _buildHallImage(),
                  _buildSeatInfoSection(),
                  _buildBottomButtons(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return HeroBar(
      height: 80.0.h,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new),
              iconSize: 20.0.w,
              color: AppColors.darkBlue,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppText(
                  text: 'The Kings Man',
                  color: AppColors.darkBlue,
                  fontSize: 16.0.sp,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 3.0.h),
                AppText(
                  text: 'March 5, 2021  I  12:30 hall 1',
                  color: AppColors.sky,
                  fontSize: 12.0.sp,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHallImage() {
    return Expanded(
      flex: 7,
      child: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: SvgPicture.asset(
          'assets/icons/ic_hall_main.svg',
          fit: BoxFit.contain,
          width: double.infinity,
        ),
      ),
    );
  }

  Widget _buildSeatInfoSection() {
    return Expanded(
      flex: 3,
      child: Container(
        color: AppColors.white,
        width: double.infinity,
        padding: EdgeInsets.all(16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(flex: 1, child: SizedBox()),
            _buildSeatInfoTiles(),
            const Expanded(flex: 1, child: SizedBox()),
            _buildSelectedSeatButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildSeatInfoTiles() {
    return Expanded(
      flex: 3,
      child: Column(
        children: [
          Row(
            children: [
              _buildSeatInfoItem(
                title: 'Selected',
                icon: 'assets/icons/ic_selected.svg',
              ),
              _buildSeatInfoItem(
                title: 'Not Available',
                icon: 'assets/icons/ic_not_available.svg',
              ),
            ],
          ),
          SizedBox(height: 8.0.h),
          Row(
            children: [
              _buildSeatInfoItem(
                title: 'VIP (150\$)',
                icon: 'assets/icons/ic_vip.svg',
              ),
              _buildSeatInfoItem(
                title: 'Regular (50\$)',
                icon: 'assets/icons/ic_regular.svg',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSelectedSeatButton() {
    return Expanded(
      flex: 2,
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0.r),
          color: AppColors.white88,
        ),
        width: 1.0.sw * 0.25,
        child: Center(
          child: RichText(
            text: TextSpan(
              text: '4 /',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.0.sp,
                color: AppColors.darkBlue,
              ),
              children: [
                TextSpan(
                  text: ' 3 row',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 10.0.sp,
                    color: AppColors.darkBlue,
                  ),
                ),
                TextSpan(
                  text: '    X',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.0.sp,
                    color: AppColors.darkBlue,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomButtons(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.white,
      padding: EdgeInsets.all(16.0.w),
      child: Row(
        children: [
          _buildTotalPriceButton(context),
          SizedBox(width: 8.0.w),
          _buildSelectSeatButton(context),
        ],
      ),
    );
  }

  Widget _buildTotalPriceButton(BuildContext context) {
    return Expanded(
      flex: 3,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            AppRoutes.getTicketScreen,
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.white88,
          padding: EdgeInsets.all(12.0.r),
        ),
        child: RichText(
          text: TextSpan(
            text: 'Total Price\n',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 10.0.sp,
              color: AppColors.darkBlue,
            ),
            children: [
              TextSpan(
                text: '50\$',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14.0.sp,
                  color: AppColors.darkBlue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _buildSelectSeatButton(BuildContext context) {
    return Expanded(
      flex: 7,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            AppRoutes.getTicketScreen,
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.sky,
          padding: EdgeInsets.all(16.0.r),
        ),
        child: AppText(
          text: 'Select Seat',
          fontSize: 14.0.sp,
          color: AppColors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildSeatInfoItem({required String title, required String icon}) {
    return Expanded(
      child: Row(
        children: [
          SvgPicture.asset(icon),
          SizedBox(width: 8.0.w),
          AppText(
            text: title,
            fontSize: 12.0,
            color: AppColors.grey,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
