part of 'movie_detail_bloc.dart';

class MovieDetailEvent extends Equatable {
  final int movieId;
  const MovieDetailEvent(this.movieId);

  @override
  List<Object> get props => [movieId];
}
