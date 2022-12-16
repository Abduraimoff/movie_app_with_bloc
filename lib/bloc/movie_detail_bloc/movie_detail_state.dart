part of 'movie_detail_bloc.dart';

class MovieDetailState extends Equatable {
  final MovieDetail? movie;
  final String? errorMessage;

  bool isLoading;

  MovieDetailState({
    this.movie,
    this.errorMessage,
    this.isLoading = false,
  });

  @override
  List<Object> get props => [];
}
