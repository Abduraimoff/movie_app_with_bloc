// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:movie_app/data/services/create_request_token_service.dart';
import 'package:movie_app/data/services/create_session_service.dart';
import 'package:movie_app/data/services/validate_user_service.dart';

class AuthRepository {
  Future<String> auth({
    required String username,
    required String password,
  }) async {
    final _createRequestToken = CreateRequestToken();
    final _validateUser = ValidateUserService();
    final _sessionService = CreateSession();

    final token = await _createRequestToken.makeToken();
    final validateToken = await _validateUser.validateUser(
      username: username,
      password: password,
      requestToken: token,
    );
    final sessionId = await _sessionService.makeSession(validateToken);

    return sessionId;
  }
}
