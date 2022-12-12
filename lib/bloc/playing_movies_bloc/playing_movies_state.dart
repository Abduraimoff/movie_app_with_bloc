part of 'playing_movies_bloc.dart';

class PlayingMoviesState extends Equatable {
  final NowPlayingMovies? movies;
  final String? errorMessage;

  const PlayingMoviesState({this.movies, this.errorMessage});

  @override
  List<Object> get props => [];
}
