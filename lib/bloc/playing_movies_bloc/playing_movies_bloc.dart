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

  int _page = 1;

  PlayingMoviesBloc() : super(PlayingMoviesInitial()) {
    on<PlayingMoviesLoad>(
      (event, emit) async {
        try {
          var oldMovies = <NowPlayingMovies>[];
          emit(PlayingMoviesLoading(oldMovies, isFirstFetch: _page == 1));
          _moiveService.loadNowPlayingMovies(_page).then(
            (newMovies) {
              if (newMovies.totalPages != null) {
                if (_page <= newMovies.totalPages!) {
                  _page++;
                  final oldMovies = (state as PlayingMoviesLoading).oldMovies;
                  oldMovies.addAll(newMovies);
                  emit(PlayingMoviesSucces(newMovies));
                }
              }
            },
          );
        } on DioError catch (e) {
          final errorMessage = DioExceptions.fromDioError(e).toString();
          log(errorMessage);
          emit(PlayingMoviesError());
        }
      },
    );
  }
}
