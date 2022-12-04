// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:movie_app/data/data_provider/session_data_provider.dart';

class MyAppModel {
  final _sessionDatatProvider = SessionDataProvider();
  bool _isAuth = false;

  bool get isAuth => _isAuth;

  Future<void> checkAuth() async {
    final _sessionId = await _sessionDatatProvider.getSessionId();
    _isAuth = _sessionId != null;
  }
}
