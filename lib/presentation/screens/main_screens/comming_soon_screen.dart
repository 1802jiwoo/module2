import 'package:flutter/material.dart';
import 'package:ott102/presentation/providers/comming_soon_provider.dart';

class CommingSoonScreen extends StatefulWidget {
  const CommingSoonScreen({super.key});

  @override
  State<CommingSoonScreen> createState() => _CommingSoonScreenState();
}

class _CommingSoonScreenState extends State<CommingSoonScreen> {

  void updateScreen() => setState(() {});

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      commingSoonProvider.addListener(updateScreen);
      commingSoonProvider.loadUpCommingMovieList();
    },);
  }

  @override
  void dispose() {
    commingSoonProvider.removeListener(updateScreen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF080E1D),
        title: Text('공개예정 작품', style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),),
      ),
      body: SingleChildScrollView(
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3
              ),
              itemBuilder: (context, index) {
                return SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  height: MediaQuery.sizeOf(context).height * 0.2,
                  child: ListView.builder(
                    itemCount: commingSoonProvider.upCommingMovieList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.all(5),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/original${commingSoonProvider.upCommingMovieList[index].poster_path}',
                        height: MediaQuery.sizeOf(context).height * 0.2,
                      ),
                    ),
                  ),
                );
              },),
      ),
    );
  }
}
