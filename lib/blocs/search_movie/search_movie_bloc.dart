import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/models/upcoming_movie.dart';
import '../../core/repositories/movies_repository.dart';
import 'search_movie_event.dart';
import 'search_movie_state.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  final MoviesRepository _moviesRepository = MoviesRepository();

  SearchMovieBloc() : super(SearchMovieInitialState()) {
    on<SearchMovieEmptyText>((event, emit) {
      emit.call(SearchMovieEmptyTextState());
    });

    on<SearchMovieWithText>((event, emit) async {
      List<UpcomingMovie> filteredMovies = [];
      List<UpcomingMovie> upcomingMovies =
          await _moviesRepository.getUpcomingMovies();

      filteredMovies = upcomingMovies
          .where((upcomingMovie) => upcomingMovie.originalTitle!
              .toLowerCase()
              .contains(event.searchText.toLowerCase()))
          .toList();
      emit.call(SearchMovieWithTextState(searchedMovies: filteredMovies));
    });

    on<SearchMovieWithTextDone>((event, emit) async {
      List<UpcomingMovie> filteredMovies = [];
      List<UpcomingMovie> upcomingMovies =
          await _moviesRepository.getUpcomingMovies();

      filteredMovies = upcomingMovies
          .where((upcomingMovie) => upcomingMovie.originalTitle!
              .toLowerCase()
              .contains(event.searchText.toLowerCase()))
          .toList();
      emit.call(SearchMovieWithTextDoneState(searchedMovies: filteredMovies));
    });
  }
}
