part of 'movies_bloc.dart';

class MoviesState extends Equatable {
  final NowPlayingMovies? nowPlayingmovies;
  final UpcomingMovies? upcomingMovies;
  final PopularMovies? popularMovies;
  final String? errorMessage;

  const MoviesState({
    this.nowPlayingmovies,
    this.errorMessage,
    this.upcomingMovies,
    this.popularMovies,
  });

  @override
  List<Object> get props => [];
}
