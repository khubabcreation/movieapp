import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tentwenty_test/core/models/upcoming_movie.dart';
import 'package:tentwenty_test/core/utils/constants/app_strings.dart';
import '../../../core/utils/constants/api_constants.dart';
import '../../../core/utils/constants/app_routes.dart';
import '../../../core/utils/theme/app_colors.dart';
import '../../../core/utils/widgets/app_text.dart';

class SearchMovieCard extends StatefulWidget {
  const SearchMovieCard({
    Key? key,
    required this.upcomingMovie,
  }) : super(key: key);

  final UpcomingMovie upcomingMovie;

  @override
  State<SearchMovieCard> createState() => _SearchMovieCardState();
}

class _SearchMovieCardState extends State<SearchMovieCard> {
  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 8.0.h),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            AppRoutes.movieDetailsScreen,
            arguments: widget.upcomingMovie.id,
          );
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0.r),
              child: CachedNetworkImage(
                imageUrl:
                    '${ApiConstants.imageBaseUrl}${widget.upcomingMovie.posterPath}',
                width: 1.0.sw * 0.35,
                height: 100.0.h,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16.0.w),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    child: AppText(
                      text: widget.upcomingMovie.originalTitle ?? 'No Title',
                      color: AppColors.darkBlue,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8.0.h),
                  AppText(
                    text: AppStrings
                        .genres[random.nextInt(AppStrings.genres.length)],
                    fontSize: 12.0.sp,
                    color: AppColors.lightGrey,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            // const Expanded(child: SizedBox()),
            Icon(
              Icons.more_horiz,
              color: AppColors.sky,
              size: 24.0.w,
            ),
          ],
        ),
      ),
    );
  }
}
