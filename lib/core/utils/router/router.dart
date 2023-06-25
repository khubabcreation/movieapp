import 'package:flutter/material.dart';
import '../../../views/error_screen.dart';
import '../../../views/get_ticket/get_ticket_screen.dart';
import '../../../views/get_ticket/select_seat_screen.dart';
import '../../../views/movie_details_screen.dart';
import '../../../views/video_player_screen.dart';
import '../../../views/watch/search_movie_screen.dart';
import '../../../views/watch/watch_screen.dart';
import '../constants/app_routes.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutes.watchScreen:
        return MaterialPageRoute(
          builder: (_) => const WatchScreen(),
          settings: routeSettings,
        );
      case AppRoutes.videoPlayerScreen:
        return MaterialPageRoute(
          builder: (_) => VideoPlayerScreen(id: routeSettings.arguments as int),
          settings: routeSettings,
        );
      case AppRoutes.searchMovieScreen:
        return MaterialPageRoute(
          builder: (_) => const SearchMovieScreen(),
          settings: routeSettings,
        );
      case AppRoutes.movieDetailsScreen:
        return MaterialPageRoute(
          builder: (_) => const MovieDetailsScreen(),
          settings: routeSettings,
        );
      case AppRoutes.getTicketScreen:
        return MaterialPageRoute(
          builder: (_) => const GetTicketScreen(),
          settings: routeSettings,
        );
      case AppRoutes.selectSeatScreen:
        return MaterialPageRoute(
          builder: (_) => const SelectSeatScreen(),
          settings: routeSettings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const ErrorScreen(),
          settings: routeSettings,
        );
    }
  }
}
