import 'dart:convert';

import 'cast.dart';




class MovieDetail {
  final int id;
  final String title;
  final String tagline;
  final String backdropPath;
  final String budget;
  final String homePage;
  final String originalTitle;
  final String overview;
  final String releaseDate;
  final String runtime;
  final String voteAverage;
  final String voteCount;
  final String originalLanguage;

  String? trailerId;
  List<Cast>? castList;

  MovieDetail({
    required this.id,
    required this.title,
    required this.tagline,
    required this.backdropPath,
    required this.budget,
    required this.homePage,
    required this.originalTitle,
    required this.overview,
    required this.releaseDate,
    required this.runtime,
    required this.voteAverage,
    required this.voteCount,
    required this.originalLanguage,
    this.trailerId,
    this.castList,
  });

  

  factory MovieDetail.fromMap(Map<String, dynamic> map) {
    return MovieDetail(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      tagline: map['tagline'] ?? '',
      backdropPath: map['backdrop_path'] ?? '',
      budget: map['budget'].toString(),
      homePage: map['home_page'] ?? '',
      originalTitle: map['original_title'] ?? '',
      overview: map['overview'] ?? '',
      releaseDate: map['release_date'] ?? '',
      runtime: map['runtime'].toString(),
      voteAverage: map['vote_average'].toString(),
      voteCount: map['vote_count'].toString(),
      trailerId: map['trailerId'],
      originalLanguage: map['original_language'],
    );
  }



  factory MovieDetail.fromJson(String source) =>
      MovieDetail.fromMap(json.decode(source));
}
