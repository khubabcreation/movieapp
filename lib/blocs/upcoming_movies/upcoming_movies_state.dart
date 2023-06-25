import 'package:flutter/cupertino.dart';
import '../../core/models/upcoming_movie.dart';

abstract class UpcomingMoviesState {}

class UpcomingMoviesInitial extends UpcomingMoviesState {}

class UpcomingMoviesLoading extends UpcomingMoviesState {}

@immutable
class UpcomingMoviesLoaded extends UpcomingMoviesState {
  UpcomingMoviesLoaded({
    required this.upcomingMovies,
  });

  final List<UpcomingMovie> upcomingMovies;
}

@immutable
class UpcomingMoviesError extends UpcomingMoviesState {
  UpcomingMoviesError({
    required this.message,
  });

  final String message;
}
