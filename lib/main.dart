import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'blocs/movie_details_bloc.dart';
import 'blocs/search_movie_bloc.dart';
import 'blocs/upcoming_movies_bloc.dart';
import 'core/utils/router/router.dart';
import 'core/utils/theme/app_theme.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();

  ByteData data =
      await PlatformAssetBundle().load('assets/ca/lets-encrypt-r3.pem');
  SecurityContext.defaultContext
      .setTrustedCertificatesBytes(data.buffer.asUint8List());

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => UpcomingMoviesBloc(),
        ),
        BlocProvider(
          create: (_) => MovieDetailsBloc(),
        ),
        BlocProvider(
          create: (_) => SearchMovieBloc(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (_, __) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        title: 'TenTwenty Assessment Test',
        onGenerateRoute: AppRouter.onGenerateRoute,
      );
    });
  }
}
