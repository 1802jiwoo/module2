import 'package:flutter/material.dart';
import 'package:ott102/data/models/movie_model.dart';
import 'package:ott102/presentation/providers/home_povider.dart';
import 'package:ott102/presentation/widgets/average_star_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  void updateScreen() => setState(() {});

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      homeProvider.addListener(updateScreen);
      homeProvider.loadGenreList();
      homeProvider.loadTopRatedMovieList();
      print('1');
      homeProvider.loadNowPlayingMovieList();
      print('2');
      homeProvider.loadRecentlyReleasedMovieList();
      print('3');
    },);
  }

  @override
  void dispose() {
    homeProvider.removeListener(updateScreen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Color(0xFF2A2D37),
          actions: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 15,),
                Image.asset('assets/images/showtime_logo.png', width: 30,),
                SizedBox(width: 5,),
                SizedBox(
                  height: 60,
                  width: MediaQuery.sizeOf(context).width - 70,
                  child: ListView.builder(
                    itemCount: homeProvider.genreList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(homeProvider.genreList[index].name, style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),),
                      );
                    },),
                )
              ],
            ),
          ],
        ),
      ),
      body: homeProvider.topRatedMovieList.isNotEmpty
        ? SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height + 100,
              child: Stack(
                children: [
                  Image.network(
                      'https://image.tmdb.org/t/p/original${homeProvider.topRatedMovieList.first.poster_path}',
                    ),
                  Positioned(
                    top: 0,
                    child: Container(
                      height: 40,
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color(0xFF080E1D),
                          Color(0x131621),
                        ], begin: Alignment.topCenter, end: Alignment.center),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: 180,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color(0x080E1D),
                          Color(0xFF080E1D),
                          Color(0xFF080E1D),
                        ], begin: Alignment.topCenter, end: Alignment.center)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 20,),
                          Text(homeProvider.getVoteAverage(), style: TextStyle(
                            color: Colors.white,
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                          ),),
                          // SizedBox(height: 10,),
                          SizedBox(
                            width: 200,
                            height: 50,
                            child: AverageStarWidget(voteAverage: homeProvider.topRatedMovieList.first.vote_average),
                          ),
                          Text(homeProvider.topRatedMovieList.first.genre_ids.fold('', (previousValue, id) {
                            final genre = homeProvider.genreList.firstWhere((element) => element.id == id,);
                            return previousValue.isEmpty
                                ? genre.name
                                : '$previousValue | ${genre.name}';
                          },), style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            _buildMovieListWidget('방영 중인 작품', homeProvider.nowPlayingMovieList),
            _buildMovieListWidget('인기 작품', homeProvider.topRatedMovieList),
            _buildMovieListWidget('최근 개봉', homeProvider.recentlyReleasedMovieList),
          ],
        ),
      ) : CircularProgressIndicator(),
    );
  }

  SizedBox _buildMovieListWidget(String title, List<MovieModel> movieList) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.9,
      height: MediaQuery.sizeOf(context).height * 0.2 + 60,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.9,
            height: MediaQuery.sizeOf(context).height * 0.2,
            child: ListView.builder(
              itemCount: movieList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.all(5),
                child: Image.network(
                  'https://image.tmdb.org/t/p/original${movieList[index].poster_path}',
                  height: MediaQuery.sizeOf(context).height * 0.2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
