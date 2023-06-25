import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/utils/theme/app_colors.dart';
import '../../core/utils/constants/app_routes.dart';
import '../../core/utils/widgets/app_text.dart';
import '../watch/widgets/genre_card.dart';
import '../watch/widgets/hero_bar.dart';
import 'widgets/hall_card.dart';

class GetTicketScreen extends StatelessWidget {
  const GetTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.0.w),
                child: Column(
                  children: [
                    _buildHallCardSection(),
                    _buildSelectSeatButton(context),
                  ],
                ),
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
                  text: 'In theaters december 22, 2021',
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

  Widget _buildHallCardSection() {
    return Expanded(
      child: Center(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDateTitle(),
              SizedBox(height: 8.0.h),
              _buildGenreCards(),
              SizedBox(height: 32.0.h),
              _buildHallCards(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDateTitle() {
    return AppText(
      text: 'Date',
      fontSize: 16.0.sp,
      color: AppColors.darkBlue,
      fontWeight: FontWeight.w500,
    );
  }

  Widget _buildGenreCards() {
    return SizedBox(
      height: 30.0.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          const GenreCard(
            '5 Mar',
            color: AppColors.sky,
          ),
          SizedBox(width: 8.0.w),
          const GenreCard(
            '6 Mar',
            color: AppColors.lightGrey,
            textColor: AppColors.darkBlue,
          ),
          SizedBox(width: 8.0.w),
          const GenreCard(
            '7 Mar',
            color: AppColors.lightGrey,
            textColor: AppColors.darkBlue,
          ),
          SizedBox(width: 8.0.w),
          const GenreCard(
            '8 Mar',
            color: AppColors.lightGrey,
            textColor: AppColors.darkBlue,
          ),
          SizedBox(width: 8.0.w),
          const GenreCard(
            '9 Mar',
            color: AppColors.lightGrey,
            textColor: AppColors.darkBlue,
          ),
          SizedBox(width: 8.0.w),
          const GenreCard(
            '10 Mar',
            color: AppColors.lightGrey,
            textColor: AppColors.darkBlue,
          ),
          SizedBox(width: 8.0.w),
          const GenreCard(
            '11 Mar',
            color: AppColors.lightGrey,
            textColor: AppColors.darkBlue,
          ),
          SizedBox(width: 8.0.w),
          const GenreCard(
            '12 Mar',
            color: AppColors.lightGrey,
            textColor: AppColors.darkBlue,
          ),
          SizedBox(width: 8.0.w),
          const GenreCard(
            '13 Mar',
            color: AppColors.lightGrey,
            textColor: AppColors.darkBlue,
          ),
          SizedBox(width: 8.0.w),
        ],
      ),
    );
  }

  Widget _buildHallCards() {
    return SizedBox(
      height: 180.0.h,
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          const HallCard(
            time: '12:30',
            dollar: '50',
            bonus: '2500',
          ),
          SizedBox(width: 8.0.w),
          const HallCard(
            time: '13:30',
            dollar: '75',
            bonus: '3000',
          ),
          SizedBox(width: 8.0.w),
          const HallCard(
            time: '14:30',
            dollar: '90',
            bonus: '4500',
          ),
        ],
      ),
    );
  }

  Widget _buildSelectSeatButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            AppRoutes.selectSeatScreen,
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
}
