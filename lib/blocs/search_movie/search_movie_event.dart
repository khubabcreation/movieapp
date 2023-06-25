import 'package:flutter/foundation.dart';

abstract class SearchMovieEvent {}

@immutable
class SearchMovieEmptyText extends SearchMovieEvent {}

@immutable
class SearchMovieWithText extends SearchMovieEvent {
  SearchMovieWithText({
    required this.searchText,
  });

  final String searchText;
}

@immutable
class SearchMovieWithTextDone extends SearchMovieEvent {
  SearchMovieWithTextDone({
    required this.searchText,
  });

  final String searchText;
}
