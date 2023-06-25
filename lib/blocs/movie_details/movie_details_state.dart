import 'package:flutter/cupertino.dart';
import '../../core/models/movie_details.dart';

abstract class MovieDetailsState {}

class MovieDetailsInitial extends MovieDetailsState {}

class MovieDetailsLoading extends MovieDetailsState {}

@immutable
class MovieDetailsLoaded extends MovieDetailsState {
  MovieDetailsLoaded({
    required this.movieDetails,
  });

  final MovieDetails? movieDetails;
}

@immutable
class MovieDetailsError extends MovieDetailsState {
  MovieDetailsError({
    required this.message,
  });

  final String message;
}
