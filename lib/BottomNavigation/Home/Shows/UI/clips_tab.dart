import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/movie.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/movie_you_may_like.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/similar_movies.dart';
import 'package:pocketmovies/BottomNavigation/Home/Shows/UI/shows_page.dart';
import 'package:pocketmovies/Locale/locales.dart';
import 'package:pocketmovies/Theme/colors.dart';

class ClipsTab extends StatelessWidget {
  final List<VideoClip> clips = [
    VideoClip('images/movie_thum1.png', '0 : 38 sec'),
    VideoClip('images/movie_thum2.png', '1 : 02 sec'),
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 12.0),
          height: screenWidth / 3.3,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: clips.length,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                child: Stack(
                  children: <Widget>[
                    FadedScaleAnimation(
                      Container(
                        margin: EdgeInsets.only(left: 8.0, right: 8.0),
                        width: screenWidth / 2,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(clips[index].thumbnail),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        foregroundDecoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              scaffoldBackgroundColor.withOpacity(0.15),
                              scaffoldBackgroundColor.withOpacity(0.75)
                            ],
                            stops: [0.0, 0.75],
                            begin: FractionalOffset.topCenter,
                            end: FractionalOffset.bottomCenter,
                          ),
                        ),
                      ),
                      durationInMilliseconds: 400,
                    ),
                    Positioned(
                      left: 16.0,
                      bottom: 16.0,
                      child: Align(
                        child: Icon(
                          Icons.play_arrow,
                          color: unselectedColor,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 48.0,
                      bottom: 12.0,
                      child: Text(
                        AppLocalizations.of(context).trailer +
                            ' #${index + 1} of\nCorpoMan ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Positioned(
                      top: 8.0,
                      right: 16.0,
                      child: Text(clips[index].time),
                    )
                  ],
                ),
              );
            },
          ),
        ),
        TitleRow(AppLocalizations.of(context).recentlyAdded, true),
        SimilarMovies(),
        TitleRow(AppLocalizations.of(context).action, true),
        MoviesLike(),
      ],
    );
  }
}
