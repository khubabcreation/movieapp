import 'dart:developer';
import 'package:dio/dio.dart' as dio;
import 'package:tentwenty_test/core/models/movie_trailer.dart';
import '../models/movie_details.dart';
import '../models/upcoming_movie.dart';
import '../utils/constants/api_constants.dart';
import '../utils/constants/app_keys.dart';

class MoviesApiService {
  final dio.Dio _dioClient = dio.Dio(
    dio.BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),
  );

  /// call to fetch upcoming movies
  Future<List<UpcomingMovie>> getUpcomingMovies() async {
    List<UpcomingMovie> upcomingMovies = [];

    try {
      dio.Response response = await _dioClient.get(
        ApiConstants.upcomingMovies,
        queryParameters: {
          'api_key': AppKeys.apiKey,
        },
      );

      if (response.statusCode == 200) {
        var responseData = response.data;
        upcomingMovies = (responseData['results'] as List)
            .map((movieMap) => UpcomingMovie.fromMap(movieMap))
            .toList();
      }
    } catch (e) {
      throw Exception(e.toString());
    }

    return upcomingMovies;
  }

  Future<MovieDetails?> getMovieDetail({required int movieId}) async {
    try {
      dio.Response response = await _dioClient.get(
        '${ApiConstants.movieDetails}/$movieId',
        queryParameters: {
          'api_key': AppKeys.apiKey,
        },
      );

      if (response.statusCode == 200) {
        log(response.statusCode.toString());
        var data = response.data;
        return MovieDetails.fromMap(data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return null;
  }

  Future<MovieTrailer?> getMovieTrailer({required int movieId}) async {
    try {
      dio.Response response = await _dioClient.get(
        '${ApiConstants.baseUrl}${ApiConstants.movieDetails}/$movieId${ApiConstants.videos}',
        queryParameters: {
          'api_key': AppKeys.apiKey,
        },
      );

      if (response.statusCode == 200) {
        log(response.statusCode.toString());
        var data = response.data;
        return MovieTrailer.fromMap(data['results'][0]);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return null;
  }
}
