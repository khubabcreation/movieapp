import 'package:flutter/foundation.dart';
import '../../core/models/upcoming_movie.dart';

abstract class SearchMovieState {}

@immutable
class SearchMovieInitialState extends SearchMovieState {}

@immutable
class SearchMovieEmptyTextState extends SearchMovieState {}

@immutable
class SearchMovieWithTextState extends SearchMovieState {
  SearchMovieWithTextState({
    required this.searchedMovies,
  });

  final List<UpcomingMovie> searchedMovies;
}

@immutable
class SearchMovieWithTextDoneState extends SearchMovieState {
  SearchMovieWithTextDoneState({
    required this.searchedMovies,
  });

  final List<UpcomingMovie> searchedMovies;
}
