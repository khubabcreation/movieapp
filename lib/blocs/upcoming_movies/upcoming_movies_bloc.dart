import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tentwenty_test/core/repositories/movies_repository.dart';
import '../../core/models/upcoming_movie.dart';
import 'upcoming_movies_event.dart';
import 'upcoming_movies_state.dart';

class UpcomingMoviesBloc
    extends Bloc<UpcomingMoviesEvent, UpcomingMoviesState> {
  final MoviesRepository _moviesRepository = MoviesRepository();

  UpcomingMoviesBloc() : super(UpcomingMoviesInitial()) {
    on<FetchUpcomingMovies>(
      (event, emit) async {
        emit.call(UpcomingMoviesLoading());
        try {
          List<UpcomingMovie> upcomingMovies =
              await _moviesRepository.getUpcomingMovies();
          emit.call(UpcomingMoviesLoaded(upcomingMovies: upcomingMovies));
        } catch (e) {
          emit.call(UpcomingMoviesError(message: e.toString()));
        }
      },
    );
  }
}
