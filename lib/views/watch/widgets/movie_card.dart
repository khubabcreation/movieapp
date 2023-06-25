import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/models/upcoming_movie.dart';
import '../../../core/utils/constants/api_constants.dart';
import '../../../core/utils/constants/app_routes.dart';
import '../../../core/utils/theme/app_colors.dart';
import '../../../core/utils/widgets/app_text.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    Key? key,
    required this.upcomingMovie,
  }) : super(key: key);

  final UpcomingMovie upcomingMovie;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 8.0.h),
      height: 180.0.h,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0.r),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            AppRoutes.movieDetailsScreen,
            arguments: upcomingMovie.id,
          );
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImage(
              imageUrl:
                  '${ApiConstants.imageBaseUrl}${upcomingMovie.posterPath}',
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                height: 180.0.h * 0.4,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      AppColors.black,
                      AppColors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 16.0.w,
              left: 16.0.w,
              child: AppText(
                text: upcomingMovie.originalTitle ?? 'No Title Found',
                fontSize: 18.0.sp,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
