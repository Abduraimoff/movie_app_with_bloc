import 'movie.dart';

class UpcomingMovies {
  final int page;
  final List<Movie> movies;
  final int totalPages;
  final int totalResults;

  UpcomingMovies({
    required this.page,
    required this.movies,
    required this.totalPages,
    required this.totalResults,
  });

  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'results': movies.map((x) => x.toMap()).toList(),
      'total_pages': totalPages,
      'total_results': totalResults,
    };
  }

  factory UpcomingMovies.fromMap(Map<String, dynamic> map) {
    return UpcomingMovies(
      page: map['page']?.toInt() ?? 0,
      movies: List<Movie>.from(map['results']?.map((x) => Movie.fromMap(x))),
      totalPages: map['total_pages']?.toInt() ?? 0,
      totalResults: map['total_results']?.toInt() ?? 0,
    );
  }
}
