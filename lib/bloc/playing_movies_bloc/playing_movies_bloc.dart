import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/data/models/now_playing_movies.dart';
import 'package:movie_app/data/services/playing_movies_service.dart';
import 'package:movie_app/utils/dio_exceptions.dart';

part 'playing_movies_event.dart';
part 'playing_movies_state.dart';

class PlayingMoviesBloc extends Bloc<PlayingMoviesLoad, PlayingMoviesState> {
  final _moiveService = PlayinMoviesService();

  PlayingMoviesBloc() : super(const PlayingMoviesState()) {
    on<PlayingMoviesLoad>(
      (event, emit) async {
        try {
          final result = await _moiveService.loadNowPlayingMovies(1);
          emit(PlayingMoviesState(movies: result));
        } on DioError catch (e) {
          final errorMessage = DioExceptions.fromDioError(e).toString();
          log(errorMessage);
          emit(PlayingMoviesState(movies: null, errorMessage: errorMessage));
        }
      },
    );
  }
}
