import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/comedy.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/continue_watching.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/explore_by_genre.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/more_page.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/recently_added.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/top_picks.dart';
import 'package:pocketmovies/BottomNavigation/Home/Shows/UI/movie_details.dart';
import 'package:pocketmovies/Locale/locales.dart';
import 'package:pocketmovies/Routes/routes.dart';
import 'package:pocketmovies/Theme/colors.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/movie.dart';

class MoviesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MoviesBody();
  }
}

List<Video> movies = [
  Video(
    image: 'images/home_banner/banner 1.png',
  ),
  Video(
    image: 'images/home_banner/banner 2.png',
  ),
  Video(
    image: 'images/home_banner/banner 3.png',
  ),
];

class MoviesBody extends StatefulWidget {
  @override
  _MoviesBodyState createState() => _MoviesBodyState();
}

class _MoviesBodyState extends State<MoviesBody> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    var locale = AppLocalizations.of(context);
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ///Carousel
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              initialPage: movies.length ~/ 2,
              height: 165,
              enableInfiniteScroll: false,
            ),
            items: movies.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MovieDetailsPage()));
                    },
                    child: FadedScaleAnimation(
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 8.0),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(i.image),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      durationInMilliseconds: 300,
                    ),
                  );
                },
              );
            }).toList(),
          ),

          ///Continue Watching
          TitleRow(
            locale.continueWatching,
            true,
            onTap: () =>
                Navigator.pushNamed(context, PageRoutes.continueWatchingPage),
          ),
          ContinueWatching(PageRoutes.movieDetailsPage),

          ///Explore by Genre
          TitleRow(locale.exploreByGenre, false),
          Container(
            margin: EdgeInsets.only(left: 8.0),
            height: 36.0,
            child: ExploreByGenre(width: screenWidth / 4.25),
          ),

          ///Recently Added
          TitleRow(
            locale.recentlyAdded,
            true,
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MorePage(recentList,
                        locale.recentlyAdded, PageRoutes.movieDetailsPage))),
          ),
          RecentlyAdded(locale.recentlyAdded, PageRoutes.movieDetailsPage),

          ///Top Picks
          TitleRow(
            locale.topPicks,
            true,
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MorePage(topPicksList,
                        locale.topPicks, PageRoutes.movieDetailsPage))),
          ),
          TopPicks(locale.topPicks, PageRoutes.movieDetailsPage),

          ///Comedy
          TitleRow(
            locale.comedy,
            true,
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MorePage(comedyList, locale.comedy,
                        PageRoutes.movieDetailsPage))),
          ),
          Comedy(locale.comedy, PageRoutes.movieDetailsPage),

          SizedBox(height: 80.0)
        ],
      ),
    );
  }
}

class TitleRow extends StatelessWidget {
  final String title;
  final bool showIcon;
  final Widget button;
  final Function onTap;

  TitleRow(this.title, this.showIcon, {this.button, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              title.toUpperCase(),
              style: Theme.of(context).textTheme.caption,
            ),
            showIcon
                ? Icon(
                    Icons.arrow_forward_ios,
                    color: unselectedColor,
                    size: 16.0,
                  )
                : button ?? SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
