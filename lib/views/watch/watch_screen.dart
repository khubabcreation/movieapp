import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../blocs/upcoming_movies_bloc.dart';
import '../../core/models/upcoming_movie.dart';
import '../../core/utils/constants/app_routes.dart';
import '../../core/utils/theme/app_colors.dart';
import '../../core/utils/widgets/app_text.dart';
import '../../core/utils/widgets/error_card.dart';
import '../../core/utils/widgets/loader.dart';
import 'widgets/bottom_navigation_bar.dart';
import 'widgets/hero_bar.dart';
import 'widgets/movie_card.dart';

class WatchScreen extends StatefulWidget {
  const WatchScreen({super.key});

  @override
  State<WatchScreen> createState() => _WatchScreenState();
}

class _WatchScreenState extends State<WatchScreen> {
  @override
  void initState() {
    super.initState();
    context.read<UpcomingMoviesBloc>().add(FetchUpcomingMovies());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const AppBottomNavigationBar(),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          _buildHeroBar(context),
          _buildUpcomingMoviesItems(context),
        ],
      ),
    );
  }

  Widget _buildHeroBar(BuildContext context) {
    return HeroBar(
      height: 64.0.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppText(
            text: 'Watch',
            color: AppColors.darkBlue,
            fontSize: 16.0.sp,
            fontWeight: FontWeight.w500,
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.searchMovieScreen);
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
    );
  }

  Widget _buildUpcomingMoviesItems(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: BlocBuilder<UpcomingMoviesBloc, UpcomingMoviesState>(
          builder: (context, state) {
            if (state is UpcomingMoviesInitial ||
                state is UpcomingMoviesLoading) {
              return const Loader();
            }

            if (state is UpcomingMoviesLoaded) {
              return _buildUpcomingMoviesItemsList(state);
            }

            if (state is UpcomingMoviesError) {
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

  Widget _buildUpcomingMoviesItemsList(UpcomingMoviesLoaded state) {
    return ListView.builder(
      itemCount: state.upcomingMovies.length,
      itemBuilder: (context, index) {
        UpcomingMovie upcomingMovie = state.upcomingMovies[index];
        return MovieCard(upcomingMovie: upcomingMovie);
      },
    );
  }
}
