import 'dart:convert';
import 'package:http/http.dart';
import 'package:ott102/data/models/genre_model.dart';
import 'package:ott102/data/models/movie_model.dart';

class MovieRepository {
  final Client client = Client();
  final String api_key = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiZTVhOGFmNDMzZTg5MmFlOWI0YTlkYzQzYzRiNjVjMCIsIm5iZiI6MTczNjMzMTQ5My45MzI5OTk4LCJzdWIiOiI2NzdlNTBlNWIxMWQwODgxMTE3YjBhYmUiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.sJLGz6WDkj8Lg9_XKYf8wqHLw0Etq7l4HanuZCfkJiE';
  final String base_url = 'https://api.themoviedb.org/3';
  final String language = 'ko-KR';
  final String region = 'KR';

  Future<List<GenreModel>> getGenre() async {
    final Uri url = Uri.parse('${base_url}/genre/movie/list?language=${language}&region=${region}');
    final headers = {'Authorization' : 'Bearer ${api_key}'};

    final response = await client.get(url, headers: headers);

    final List<GenreModel> results = [];

    final json = jsonDecode(response.body);
    for(var genre in json['genres']) {
      results.add(GenreModel.fromJson(genre));
    }

    return results;
  }

  Future<List<MovieModel>> getTopRatedMovie() async {
    final Uri url = Uri.parse('${base_url}/movie/top_rated?language=${language}&region=${region}&page=1');
    final headers = {'Authorization' : 'Bearer ${api_key}'};

    final response = await client.get(url, headers: headers);

    final List<MovieModel> results = [];

    final json = jsonDecode(response.body);
    for(var movies in json['results']) {
      results.add(MovieModel.fromJson(movies));
    }

    return results;
  }

  Future<List<MovieModel>> getNowPlayingMovie() async {
    final Uri url = Uri.parse('${base_url}/movie/now_playing?language=${language}&region=${region}&page=1');
    final headers = {'Authorization' : 'Bearer ${api_key}'};

    final response = await client.get(url, headers: headers);

    final List<MovieModel> results = [];

    final json = jsonDecode(response.body);
    for(var movies in json['results']) {
      results.add(MovieModel.fromJson(movies));
    }

    return results;
  }

  Future<List<MovieModel>> getRecentlyReleasedMovie() async {
    final Uri url = Uri.parse('${base_url}/movie/now_playing?page=1');
    final headers = {'Authorization' : 'Bearer ${api_key}'};

    final response = await client.get(url, headers: headers);

    final List<MovieModel> results = [];

    final json = jsonDecode(response.body);
    for(var movies in json['results']) {
      results.add(MovieModel.fromJson(movies));
    }

    return results;
  }

  Future<List<MovieModel>> getUpCommingMovie() async {
    final Uri url = Uri.parse('${base_url}/movie/upcoming?language=${language}&region=${region}&page=1');
    final headers = {'Authorization' : 'Bearer ${api_key}'};

    final response = await client.get(url, headers: headers);

    final List<MovieModel> results = [];

    final json = jsonDecode(response.body);
    for(var movies in json['results']) {
      results.add(MovieModel.fromJson(movies));
    }

    return results;
  }

}