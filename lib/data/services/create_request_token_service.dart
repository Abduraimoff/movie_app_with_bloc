// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:dio/dio.dart';
import 'package:movie_app/utils/config.dart';

class CreateRequestToken {
  final _dio = Dio();

  Future<String> makeToken() async {
    const _apiKey = Config.apiKey;
    const _url = '${Config.host}/authentication/token/new?api_key=$_apiKey';

    try {
      final response = await _dio.get(_url);
      final token = response.data['request_token'] as String;

      return token;
    } catch (e) {
      rethrow;
    }
  }
}
