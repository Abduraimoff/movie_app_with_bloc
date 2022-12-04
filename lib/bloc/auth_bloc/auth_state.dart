part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSucces extends AuthState {
  final String sessioId;

  const AuthSucces(this.sessioId);
}

class AuthError extends AuthState {
  final String errorMessage;

  const AuthError(this.errorMessage);
}
