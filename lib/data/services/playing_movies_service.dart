// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movie_app/data/models/now_playing_movies.dart';
import 'package:movie_app/utils/config.dart';

class PlayinMoviesService {
  final _dio = Dio();

  Future<NowPlayingMovies> loadNowPlayingMovies(int page) async {
    const _apiKey = Config.apiKey;
    final _url =
        '${Config.host}/movie/now_playing?api_key=$_apiKey&language=en-US&page=$page';

    try {
      final response = await _dio.get(_url);
      log(response.data.toString());
      
      final moives = NowPlayingMovies.fromMap(response.data);

      return moives;
    } on DioError catch (e) {
      rethrow;
    }
  }
}
