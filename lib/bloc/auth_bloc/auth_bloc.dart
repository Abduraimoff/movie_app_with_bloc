import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/data/data_provider/session_data_provider.dart';
import 'package:movie_app/data/repositories/auth_repository.dart';
import 'package:movie_app/utils/dio_exceptions.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final _authRepo = AuthRepository();
  final _dataProvider = SessionDataProvider();
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      try {
        emit(AuthLoading());
        final result = await _authRepo.auth(
          username: event.username,
          password: event.password,
        );
        _dataProvider.setSessionId(result);
        emit(AuthSucces(result));
      } on DioError catch (e) {
        final errorMessage = DioExceptions.fromDioError(e).toString();
        log(errorMessage);
        emit(AuthError(errorMessage));
      }
    });
  }
}
