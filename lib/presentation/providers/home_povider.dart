import 'package:flutter/cupertino.dart';
import 'package:ott102/data/models/genre_model.dart';
import 'package:ott102/data/models/movie_model.dart';
import 'package:ott102/data/repositories/movie_repository.dart';

final HomeProvider homeProvider = HomeProvider();

class HomeProvider extends ChangeNotifier {
  final MovieRepository movieRepository = MovieRepository();

  List<GenreModel> genreList = [];
  List<MovieModel> topRatedMovieList = [];
  List<MovieModel> nowPlayingMovieList = [];
  List<MovieModel> recentlyReleasedMovieList = [];
  List<MovieModel> upCommingMovieList = [];

  void loadGenreList() async {
    genreList = await movieRepository.getGenre();
    notifyListeners();
  }

  void loadTopRatedMovieList() async {
    topRatedMovieList = await movieRepository.getTopRatedMovie();
    notifyListeners();
  }

  void loadNowPlayingMovieList() async {
    nowPlayingMovieList = await movieRepository.getNowPlayingMovie();
    notifyListeners();
  }

  void loadRecentlyReleasedMovieList() async {
    recentlyReleasedMovieList = await movieRepository.getRecentlyReleasedMovie();
    notifyListeners();
  }

  String getVoteAverage() {
    return topRatedMovieList.first.vote_average.toStringAsFixed(1);
  }

}