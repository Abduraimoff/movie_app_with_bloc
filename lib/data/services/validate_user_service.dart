// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:dio/dio.dart';
import 'package:movie_app/utils/config.dart';

class ValidateUserService {
  final _dio = Dio();

  Future<String> validateUser({
    required String username,
    required String password,
    required String requestToken,
  }) async {
    const _apiKey = Config.apiKey;
    const _url =
        '${Config.host}/authentication/token/validate_with_login?api_key=$_apiKey';

    final parameters = <String, dynamic>{
      'username': username,
      'password': password,
      'request_token': requestToken
    };

    try {
      final response = await _dio.post(_url, queryParameters: parameters);
      final token = response.data['request_token'] as String;

      return token;
    } catch (e) {
      rethrow;
    }
  }
}
