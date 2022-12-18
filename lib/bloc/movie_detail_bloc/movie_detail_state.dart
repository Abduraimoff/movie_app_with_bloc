part of 'movie_detail_bloc.dart';

class MovieDetailState extends Equatable {
  final MovieDetail? movie;
  final UpcomingMovies? similarMovies;
  final String? errorMessage;

  bool isLoading;

  MovieDetailState({
    this.movie,
    this.errorMessage,
    this.isLoading = false,
    this.similarMovies,
  });

  @override
  List<Object> get props => [];
}
