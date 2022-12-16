// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:dio/dio.dart';
import 'package:movie_app/data/models/movie_detail.dart';
import 'package:movie_app/data/services/casts_service.dart';
import 'package:movie_app/data/services/youtube_service.dart';
import 'package:movie_app/utils/config.dart';

class MovieDetailService {
  final _dio = Dio();
  final _youtubeService = YoutubeService();
  final _castService = CastService();

  Future<MovieDetail> getMovieDetail(int movieId) async {
    const _apiKey = Config.apiKey;
    final _url =
        '${Config.host}/movie/$movieId?api_key=$_apiKey&language=en-US';

    try {
      final response = await _dio.get(_url);
      final movieDetail = MovieDetail.fromMap(response.data);
      movieDetail.trailerId = (await _youtubeService.getYoutubeId(movieId));
      movieDetail.castList = await _castService.getCastList(movieId);

      return movieDetail;
    } on DioError catch (_) {
      rethrow;
    }
  }
}
