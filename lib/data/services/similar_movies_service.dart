// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:dio/dio.dart';
import 'package:movie_app/data/models/upcoming_movies.dart';
import 'package:movie_app/utils/config.dart';

class SimilarMoivesService {
  final _dio = Dio();

  Future<UpcomingMovies> loadSimilarMovies(int id) async {
    const _apiKey = Config.apiKey;
    final _url =
        '${Config.host}/movie/$id/similar?api_key=$_apiKey&language=en-US&page=1';

    try {
      final response = await _dio.get(_url);

      final moives = UpcomingMovies.fromMap(response.data);

      return moives;
    } on DioError catch (_) {
      rethrow;
    }
  }
}
