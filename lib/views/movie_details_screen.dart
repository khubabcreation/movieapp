import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../blocs/movie_details_bloc.dart';
import '../core/models/movie_details.dart';
import '../core/utils/constants/api_constants.dart';
import '../core/utils/constants/app_routes.dart';
import '../core/utils/helper_functions/release_data.dart';
import '../core/utils/theme/app_colors.dart';
import '../core/utils/widgets/app_text.dart';
import '../core/utils/widgets/error_card.dart';
import '../core/utils/widgets/loader.dart';
import 'watch/widgets/genre_card.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({super.key});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  final Random random = Random();

  @override
  Widget build(BuildContext context) {
    _callApi(context);
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
          builder: (context, state) {
            if (state is MovieDetailsInitial || state is MovieDetailsLoading) {
              return SizedBox(
                height: 1.sh,
                width: double.infinity,
                child: const Loader(),
              );
            }

            if (state is MovieDetailsLoaded) {
              return _buildMovieDetailsData(context, state);
            }

            if (state is MovieDetailsError) {
              return ErrorCard(message: state.message);
            }

            return Center(
              child: AppText(
                text: 'Something went wrong',
                fontSize: 16.0.sp,
                color: AppColors.darkBlue,
                fontWeight: FontWeight.w500,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildMovieDetailsData(
    BuildContext context,
    MovieDetailsLoaded state,
  ) {
    return Column(
      children: [
        _buildHeroSection(state, context),
        SizedBox(height: 24.0.h),
        _buildGenresAndOverviewSection(state),
        SizedBox(height: 36.0.h),
      ],
    );
  }

  Widget _buildHeroSection(MovieDetailsLoaded state, BuildContext context) {
    return SizedBox(
      height: 1.0.sh * 0.6,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.topLeft,
        children: [
          _buildCoverImage(state),
          _buildDarkGradient1(),
          _buildDarkGradient2(),
          _buildHeroBar(context),
          _buildReleaseDateAndButtons(state, context),
        ],
      ),
    );
  }

  Widget _buildCoverImage(MovieDetailsLoaded state) {
    return CachedNetworkImage(
      imageUrl: '${ApiConstants.imageBaseUrl}${state.movieDetails?.posterPath}',
      height: 1.0.sw * 0.6,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }

  Widget _buildDarkGradient1() {
    return Container(
      width: double.infinity,
      height: double.infinity,
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
    );
  }

  Widget _buildDarkGradient2() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(70, 0, 0, 0),
            AppColors.transparent,
          ],
        ),
      ),
    );
  }

  Widget _buildHeroBar(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Align(
          alignment: Alignment.topLeft,
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_new),
                iconSize: 20.0.w,
                color: AppColors.white,
              ),
              SizedBox(width: 8.0.w),
              AppText(
                text: 'Watch',
                fontSize: 16.0.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReleaseDateAndButtons(
      MovieDetailsLoaded state, BuildContext context) {
    return Positioned(
      bottom: 24.0.w,
      left: 0.0,
      right: 0.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildReleaseDateText(state),
          SizedBox(height: 12.0.h),
          _buildGetTicketsButton(context),
          SizedBox(height: 12.0.h),
          _buildWatchTrailerButton(state),
        ],
      ),
    );
  }

  Widget _buildReleaseDateText(MovieDetailsLoaded state) {
    return AppText(
      text: 'In theaters ${getReleaseData(state.movieDetails?.releaseDate)}',
      fontSize: 16.0.sp,
      color: AppColors.white,
      fontWeight: FontWeight.w500,
    );
  }

  Widget _buildGetTicketsButton(BuildContext context) {
    return SizedBox(
      width: 1.0.sw * 0.6,
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
          text: 'Get Tickets',
          fontSize: 14.0.sp,
          color: AppColors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  SizedBox _buildWatchTrailerButton(MovieDetailsLoaded state) {
    return SizedBox(
      width: 1.0.sw * 0.6,
      child: TextButton.icon(
        onPressed: () {
          if (state.movieDetails?.id != null) {
            Navigator.pushNamed(
              context,
              AppRoutes.videoPlayerScreen,
              arguments: state.movieDetails!.id!,
            );
          }
        },
        style: TextButton.styleFrom(
          foregroundColor: AppColors.white,
          padding: EdgeInsets.all(16.0.r),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0.r),
            side: const BorderSide(
              color: AppColors.sky,
              width: 1.0,
            ),
          ),
        ),
        icon: const Icon(Icons.play_arrow),
        label: AppText(
          text: 'Watch Trailer',
          fontSize: 14.0.sp,
          color: AppColors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildGenresAndOverviewSection(MovieDetailsLoaded state) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildGenresTitle(),
          SizedBox(height: 8.0.h),
          _buildGenres(state.movieDetails?.genres ?? []),
          SizedBox(height: 8.0.h),
          const Divider(color: AppColors.black11),
          SizedBox(height: 12.0.h),
          _buildOverviewTitle(),
          SizedBox(height: 12.0.h),
          _buildMovieOverview(state.movieDetails?.overview ?? 'No Overview'),
        ],
      ),
    );
  }

  Widget _buildGenresTitle() {
    return AppText(
      text: 'Genres',
      fontSize: 16.0.sp,
      color: AppColors.darkBlue,
      fontWeight: FontWeight.w500,
    );
  }

  Widget _buildGenres(List<Genre> genres) {
    return Wrap(
      spacing: 8.0.w,
      runSpacing: 8.0.w,
      children: genres
          .map(
            (genre) => GenreCard(
              genre.name ?? '',
              color: AppColors
                  .randomColors[random.nextInt(AppColors.randomColors.length)],
            ),
          )
          .toList(),
    );
  }

  AppText _buildOverviewTitle() {
    return AppText(
      text: 'Overview',
      fontSize: 16.0.sp,
      color: AppColors.darkBlue,
      fontWeight: FontWeight.w500,
    );
  }

  Widget _buildMovieOverview(String overviewText) {
    return AppText(
      text: overviewText,
      fontSize: 12.0.sp,
      color: AppColors.grey,
      fontWeight: FontWeight.w400,
    );
  }

  void _callApi(BuildContext context) {
    int? movieId = ModalRoute.of(context)?.settings.arguments as int?;
    context
        .read<MovieDetailsBloc>()
        .add(FetchMovieDetails(movieId: movieId ?? 10));
  }
}
