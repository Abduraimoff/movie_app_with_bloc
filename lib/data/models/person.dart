class Person {
  final int id;
  final String genre;
  final String birthday;
  final String deathday;
  final String name;
  final String biography;
  final String placeOfBirth;
  final String profilePath;
  final String knowForDepartment;
  final double popularity;

  Person({
    required this.id,
    required this.genre,
    required this.deathday,
    required this.birthday,
    required this.name,
    required this.biography,
    required this.placeOfBirth,
    required this.profilePath,
    required this.knowForDepartment,
    required this.popularity,
  });
  //profile_path know_for_department

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'genre': genre,
      'deathday': deathday,
      'birthday': birthday,
      'name': name,
      'biography': biography,
      'place_of_birth': placeOfBirth,
      'profile_path': profilePath,
      'know_for_department': knowForDepartment,
      'popularity': popularity,
    };
  }

  factory Person.fromMap(Map<String, dynamic> map) {
    return Person(
      id: map['id']?.toInt() ?? 0,
      genre: map['genre'] ?? '',
      deathday: map['deathday'] ?? '',
      birthday: map['birthday'] ?? '',
      name: map['name'] ?? '',
      biography: map['biography'] ?? '',
      placeOfBirth: map['place_of_birth'] ?? '',
      profilePath: map['profile_path'] ?? '',
      knowForDepartment: map['know_for_department'] ?? '',
      popularity: map['popularity']?.toDouble() ?? 0.0,
    );
  }
}
