// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:movie_app/data/models/cast.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/utils/config.dart';

class CastService {
  final _dio = Dio();
  Future<List<Cast>> getCastList(int id) async {
    const _apiKey = Config.apiKey;
    final _url = '${Config.host}/movie/$id/credits?api_key=$_apiKey';

    try {
      final response = await _dio.get(_url);
      final body = response.data['cast'] as List;
      final List<Cast> casts = body.map((c) => Cast.fromMap(c)).toList();

      return casts;
    } on DioError catch (_) {
      rethrow;
    }
  }
}
