import '../models/movie_details.dart';
import '../models/upcoming_movie.dart';
import '../services/movies_api_service.dart';

class MoviesRepository {
  final MoviesApiService _moviesApiService = MoviesApiService();

  Future<List<UpcomingMovie>> getUpcomingMovies() async {
    return await _moviesApiService.getUpcomingMovies();
  }

  Future<MovieDetails?> getMovieDetail({required int movieId}) async {
    return await _moviesApiService.getMovieDetail(movieId: movieId);
  }
}
