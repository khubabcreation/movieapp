import 'package:flutter/material.dart';

abstract class MovieDetailsEvent {}

@immutable
class FetchMovieDetails extends MovieDetailsEvent {
  FetchMovieDetails({
    required this.movieId,
  });

  final int movieId;
}
