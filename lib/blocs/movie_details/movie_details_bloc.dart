import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/models/movie_details.dart';
import '../../core/repositories/movies_repository.dart';
import 'movie_details_event.dart';
import 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final MoviesRepository _moviesRepository = MoviesRepository();

  MovieDetailsBloc() : super(MovieDetailsInitial()) {
    on<FetchMovieDetails>(
      (event, emit) async {
        emit.call(MovieDetailsLoading());
        try {
          final MovieDetails? movieDetails =
              await _moviesRepository.getMovieDetail(movieId: event.movieId);
          emit.call(MovieDetailsLoaded(movieDetails: movieDetails));
        } catch (e) {
          emit.call(MovieDetailsError(message: e.toString()));
        }
      },
    );
  }
}
