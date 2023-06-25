import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../blocs/search_movie_bloc.dart';
import '../../core/models/upcoming_movie.dart';
import '../../core/utils/constants/app_strings.dart';
import '../../core/utils/theme/app_colors.dart';
import '../../core/utils/widgets/app_text.dart';
import 'widgets/bottom_navigation_bar.dart';
import 'widgets/category_card.dart';
import 'widgets/hero_bar.dart';
import 'widgets/search_movie_card.dart';

class SearchMovieScreen extends StatefulWidget {
  const SearchMovieScreen({super.key});

  @override
  State<SearchMovieScreen> createState() => _SearchMovieScreenState();
}

class _SearchMovieScreenState extends State<SearchMovieScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const AppBottomNavigationBar(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: BlocBuilder<SearchMovieBloc, SearchMovieState>(
        builder: (context, state) {
          if (state is SearchMovieInitialState ||
              state is SearchMovieEmptyTextState) {
            return _buildGenres();
          }

          if (state is SearchMovieWithTextState) {
            return _buildSearchedMovies(state);
          }

          if (state is SearchMovieWithTextDoneState) {
            return _buildDoneSearchedMovies(state);
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
    );
  }

  Widget _buildGenres() {
    return Column(
      children: [
        _buildTextFieldAppBar(),
        _buildMoviesGenres(),
      ],
    );
  }

  Widget _buildTextFieldAppBar() {
    return HeroBar(
      height: 80.0.h,
      child: SizedBox(
        height: 48.0.h,
        child: TextField(
          onChanged: (value) {
            if (value.isNotEmpty) {
              context
                  .read<SearchMovieBloc>()
                  .add(SearchMovieWithText(searchText: value));
            } else {
              context.read<SearchMovieBloc>().add(SearchMovieEmptyText());
            }
          },
          onSubmitted: (value) {
            if (value.isNotEmpty) {
              context
                  .read<SearchMovieBloc>()
                  .add(SearchMovieWithTextDone(searchText: value));
            } else {
              context.read<SearchMovieBloc>().add(SearchMovieEmptyText());
            }
          },
          controller: _searchController,
          style: TextStyle(
            fontSize: 14.0.sp,
            color: AppColors.darkBlue,
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.white88,
            enabled: true,
            prefixIcon: Icon(
              Icons.search,
              size: 20.0.w,
              color: AppColors.black,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.close,
                size: 24.0.w,
                color: AppColors.darkBlue,
              ),
              onPressed: () {
                if (_searchController.text.isEmpty) {
                  Navigator.pop(context);
                }
                _searchController.clear();
                context.read<SearchMovieBloc>().add(SearchMovieEmptyText());
              },
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
            hintText: AppStrings.textFieldHint,
            hintStyle: TextStyle(
              fontSize: 14.0.sp,
              color: AppColors.transparentBlue,
              fontWeight: FontWeight.w400,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMoviesGenres() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12.0.w,
            mainAxisSpacing: 12.0.w,
            childAspectRatio: 3 / 2,
          ),
          itemCount: AppStrings.genres.length,
          itemBuilder: (context, index) {
            return CategoryCard(
              categoryName: AppStrings.genres[index],
              categoryImageUrl: AppStrings.genresPosters[index],
            );
          },
        ),
      ),
    );
  }

  Widget _buildSearchedMovies(SearchMovieWithTextState state) {
    return Column(
      children: [
        _buildTextFieldAppBar(),
        _buildOnTextChangedSearchedMovies(state),
      ],
    );
  }

  Widget _buildOnTextChangedSearchedMovies(SearchMovieWithTextState state) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8.0.h),
              AppText(
                text: AppStrings.topResults,
                fontSize: 12.0.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.darkBlue,
              ),
              SizedBox(height: 4.0.h),
              const Divider(
                color: AppColors.black11,
              ),
              SizedBox(height: 4.0.h),
              Expanded(
                child: ListView.builder(
                  itemCount: state.searchedMovies.length,
                  itemBuilder: (context, index) {
                    UpcomingMovie upcomingMovie = state.searchedMovies[index];
                    return SearchMovieCard(
                      upcomingMovie: upcomingMovie,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDoneSearchedMovies(SearchMovieWithTextDoneState state) {
    return Column(
      children: [
        _buildSearchResultAppBar(state),
        _buildDoneTextSearchedMovies(state),
      ],
    );
  }

  Widget _buildSearchResultAppBar(SearchMovieWithTextDoneState state) {
    return HeroBar(
      height: 64.0.h,
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              context.read<SearchMovieBloc>().add(SearchMovieEmptyText());
            },
            icon: const Icon(Icons.arrow_back_ios_new),
            iconSize: 20.0.w,
            color: AppColors.darkBlue,
          ),
          SizedBox(width: 8.0.w),
          AppText(
            text: '${state.searchedMovies.length} Results Found',
            fontSize: 16.0.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.darkBlue,
          ),
        ],
      ),
    );
  }

  Widget _buildDoneTextSearchedMovies(SearchMovieWithTextDoneState state) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: ListView.builder(
          itemCount: state.searchedMovies.length,
          itemBuilder: (context, index) {
            UpcomingMovie upcomingMovie = state.searchedMovies[index];
            return SearchMovieCard(
              upcomingMovie: upcomingMovie,
            );
          },
        ),
      ),
    );
  }
}
