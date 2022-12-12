part of 'casts_bloc.dart';

class CastsState extends Equatable {
  final List<Cast>? casts;
  final String? errorMessage;

  const CastsState({
    this.casts,
    this.errorMessage,
  });

  @override
  List<Object> get props => [];
}
