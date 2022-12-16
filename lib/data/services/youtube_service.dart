// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:dio/dio.dart';
import 'package:movie_app/utils/config.dart';

class YoutubeService {
  final _dio = Dio();

  Future<String> getYoutubeId(int id) async {
    const _apiKey = Config.apiKey;
    final _url = '${Config.host}/movie/$id/videos?api_key=$_apiKey';

    try {
      final response = await _dio.get(_url);
      final youtubeId = response.data['results'][0]['key'];

      return youtubeId;
    } on DioError catch (_) {
      rethrow;
    }
  }
}
