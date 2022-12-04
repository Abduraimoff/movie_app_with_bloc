// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:dio/dio.dart';
import 'package:movie_app/utils/config.dart';

class CreateSession {
  final _dio = Dio();
  Future<String> makeSession(String requestToken) async {
    const _apiKey = Config.apiKey;
    const _url = '${Config.host}/authentication/session/new?api_key=$_apiKey';

    final parameters = <String, dynamic>{'request_token': requestToken};
    try {
      final response = await _dio.post(_url, queryParameters: parameters);
      final sessionId = response.data['session_id'] as String;

      return sessionId;
    } catch (e) {
      rethrow;
    }
  }
}
