part of 'playing_movies_bloc.dart';

abstract class PlayingMoviesState extends Equatable {
  const PlayingMoviesState();

  @override
  List<Object> get props => [];
}

class PlayingMoviesInitial extends PlayingMoviesState {}

class PlayingMoviesLoading extends PlayingMoviesState {
  // ignore: prefer_typing_uninitialized_variables
  final oldMovies;
  final bool isFirstFetch;

  const PlayingMoviesLoading(this.oldMovies, {this.isFirstFetch = false});

  @override
  List<Object> get props => [oldMovies, isFirstFetch];
}

class PlayingMoviesSucces extends PlayingMoviesState {
  final NowPlayingMovies movies;

  const PlayingMoviesSucces(this.movies);

  @override
  List<Object> get props => [movies];
}

class PlayingMoviesError extends PlayingMoviesState {}
