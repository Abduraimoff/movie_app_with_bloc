// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:dio/dio.dart';
import 'package:movie_app/data/models/popular_movies.dart';
import 'package:movie_app/utils/config.dart';

class PopularMoviesService {
  final _dio = Dio();

  Future<PopularMovies> loadPopularMovies(int page) async {
    const _apiKey = Config.apiKey;
    final _url =
        '${Config.host}/movie/top_rated?api_key=$_apiKey&language=en-US&page=$page';

    try {
      final response = await _dio.get(_url);

      final moives = PopularMovies.fromMap(response.data);

      return moives;
    } on DioError catch (_) {
      rethrow;
    }
  }
}
