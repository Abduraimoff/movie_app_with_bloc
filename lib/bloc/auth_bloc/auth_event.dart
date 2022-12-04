part of 'auth_bloc.dart';

class AuthEvent extends Equatable {
  final String username;
  final String password;

  const AuthEvent({required this.username, required this.password});

  @override
  List<Object> get props => [username, password];
}
