// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:dio/dio.dart';
import 'package:movie_app/data/models/person.dart';
import 'package:movie_app/utils/config.dart';

class PersonService {
  final _dio = Dio();

  Future<Person> loadPerson(int id) async {
    const _apiKey = Config.apiKey;
    final _url =
        '${Config.host}/person/$id/similar?api_key=$_apiKey&language=en-US';

    try {
      final response = await _dio.get(_url);

      final person = Person.fromMap(response.data);

      return person;
    } on DioError catch (_) {
      rethrow;
    }
  }
}
