class MovieModel {
  final bool adult;
  final String backdrop_path;
  final List<dynamic> genre_ids;
  final int id;
  final String original_language;
  final String original_title;
  final String overview;
  final double popularity;
  final String poster_path;
  final String release_date;
  final String title;
  final bool video;
  final double vote_average;
  final int vote_count;

  MovieModel({required this.adult, required this.backdrop_path, required this.genre_ids, required this.id, required this.original_language, required this.original_title, required this.overview, required this.popularity, required this.poster_path, required this.release_date, required this.title, required this.video, required this.vote_average, required this.vote_count});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      adult: json['adult'] ?? false,
      backdrop_path: json['backdrop_path'] ?? '',
      genre_ids: json['genre_ids'] ?? [],
      id: json['id'] ?? 0,
      original_language: json['original_language'] ?? '',
      original_title: json['original_title'] ?? '',
      overview: json['overview'] ?? '',
      popularity: json['popularity'] ?? 0.0,
      poster_path: json['poster_path'] ?? '',
      release_date: json['release_date'] ?? '',
      title: json['title'] ?? '',
      video: json['video'] ?? false,
      vote_average: json['vote_average'] ?? 0.0,
      vote_count: json['vote_count'] ?? 0,
    );
  }

}
