import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/data/models/now_playing_movies.dart';
import 'package:movie_app/data/models/popular_movies.dart';
import 'package:movie_app/data/models/upcoming_movies.dart';
import 'package:movie_app/data/services/playing_movies_service.dart';
import 'package:movie_app/data/services/popular_movies_service.dart';
import 'package:movie_app/data/services/upcoming_movies_serivce.dart';
import 'package:movie_app/utils/dio_exceptions.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesLoad, MoviesState> {
  final _playingService = PlayinMoviesService();
  final _upcomingService = UpcomingMoviesService();
  final _popularService = PopularMoviesService();

  MoviesBloc() : super(const MoviesState()) {
    on<MoviesLoad>(
      (event, emit) async {
        try {
          final playingMovies = await _playingService.loadNowPlayingMovies(1);
          final upcomingMovies = await _upcomingService.loadUpcomingMovies(1);
          final popularMovies = await _popularService.loadPopularMovies(1);

          final newState = MoviesState(
            nowPlayingmovies: playingMovies,
            upcomingMovies: upcomingMovies,
            popularMovies: popularMovies,
          );
          
          emit(newState);
        } on DioError catch (e) {
          final errorMessage = DioExceptions.fromDioError(e).toString();
          log(errorMessage);
          emit(MoviesState(nowPlayingmovies: null, errorMessage: errorMessage));
        }
      },
    );
  }
}
