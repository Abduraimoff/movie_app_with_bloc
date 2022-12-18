import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/data/models/movie_detail.dart';
import 'package:movie_app/data/models/upcoming_movies.dart';
import 'package:movie_app/data/services/similar_movies_service.dart';
import 'package:movie_app/utils/dio_exceptions.dart';

import '../../data/services/movie_detail_service.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final _movieService = MovieDetailService();
  final _similarService = SimilarMoivesService();

  MovieDetailBloc() : super(MovieDetailState(isLoading: true)) {
    on<MovieDetailEvent>((event, emit) async {
      try {
        final result = await _movieService.getMovieDetail(event.movieId);
        final similarMovies =
            await _similarService.loadSimilarMovies(event.movieId);
        final newState = MovieDetailState(
          isLoading: false,
          movie: result,
          similarMovies: similarMovies,
        );
        emit(newState);
      } on DioError catch (e) {
        final errorMessage = DioExceptions.fromDioError(e).toString();
        log(errorMessage);
        emit(MovieDetailState(isLoading: false, errorMessage: errorMessage));
      }
    });
  }
}
