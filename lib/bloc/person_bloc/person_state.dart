part of 'person_bloc.dart';

class PersonState extends Equatable {
  final Person? person;
  final String? error;
  bool isLoading;

  PersonState({
    this.person,
    this.error,
    this.isLoading = false,
  });

  @override
  List<Object> get props => [];
}
