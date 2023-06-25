import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../core/models/movie_trailer.dart';
import '../core/services/movies_api_service.dart';
import '../core/utils/widgets/app_text.dart';
import '../core/utils/widgets/loader.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key, required this.id});
  final int id;

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  final MoviesApiService _moviesApiService = MoviesApiService();
  late YoutubePlayerController _controller;
  MovieTrailer? movieTrailer;

  @override
  void initState() {
    super.initState();
    _callApi();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return movieTrailer == null
        ? const Loader()
        : YoutubePlayerBuilder(
            player: YoutubePlayer(
              topActions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const AppText(text: 'Done'),
                ),
              ],
              controller: _controller,
              onEnded: (metaData) {
                Navigator.pop(context);
              },
            ),
            builder: (context, player) {
              return player;
            },
          );
  }

  void _callApi() async {
    movieTrailer = await _moviesApiService.getMovieTrailer(movieId: widget.id);
    setState(() {});
    _initYoutubeController(movieTrailer?.key ?? '');
  }

  void _initYoutubeController(String trailerEndPoint) {
    _controller = YoutubePlayerController(
      initialVideoId: trailerEndPoint,
      flags: const YoutubePlayerFlags(),
    );
  }
}
