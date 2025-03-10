import 'package:flutter/cupertino.dart';
import 'package:ott102/data/models/movie_model.dart';
import 'package:ott102/data/repositories/movie_repository.dart';

CommingSoonProvider commingSoonProvider = CommingSoonProvider();

class CommingSoonProvider extends ChangeNotifier {
  MovieRepository movieRepository = MovieRepository();

  List<MovieModel> upCommingMovieList = [];

  void loadUpCommingMovieList() async {
    upCommingMovieList = await movieRepository.getUpCommingMovie();
    notifyListeners();
  }

}