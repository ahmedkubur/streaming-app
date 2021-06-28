import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/continue_watching.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/explore_by_genre.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/more_page.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/recently_added.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/top_picks.dart';
import 'package:pocketmovies/BottomNavigation/Home/Shows/UI/shows_page.dart';
import 'package:pocketmovies/BottomNavigation/Home/TvShows/tv_shows_details.dart';
import 'package:pocketmovies/Locale/locales.dart';
import 'package:pocketmovies/Routes/routes.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/movie.dart';

class TvShowsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TvShowsBody();
  }
}

class TvShowsBody extends StatefulWidget {
  @override
  _TvShowsBodyState createState() => _TvShowsBodyState();
}

class _TvShowsBodyState extends State<TvShowsBody> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    List<Video> tvShows = [
      Video(
          image: 'images/home_banner/web1.jpg',
          title: 'Peter on Holidays',
          genre: AppLocalizations.of(context).action),
      Video(
          image: 'images/home_banner/web2.jpg',
          title: 'Peter on Holidays',
          genre: AppLocalizations.of(context).comedy),
      Video(
          image: 'images/home_banner/web3.jpg',
          title: 'Peter on Holidays',
          genre: AppLocalizations.of(context).action),
    ];
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
              initialPage: tvShows.length ~/ 2,
              height: 165,
              enableInfiniteScroll: false,
            ),
            items: tvShows.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TVShowsDetailsPage(
                                    title: i.title,
                                    genre: i.genre,
                                  )));
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
                      durationInMilliseconds: 400,
                    ),
                  );
                },
              );
            }).toList(),
          ),

          ///Continue Watching
          TitleRow(
            AppLocalizations.of(context).continueWatching,
            true,
            onTap: () =>
                Navigator.pushNamed(context, PageRoutes.continueWatchingPage),
          ),
          ContinueWatching(PageRoutes.tvShowDetailsPage),

          ///Explore by Genre
          TitleRow(AppLocalizations.of(context).exploreByGenre, false),
          Container(
            margin: EdgeInsets.only(left: 8.0),
            height: 36.0,
            child: ExploreByGenre(width: screenWidth / 4.25),
          ),

          ///Recently Added
          TitleRow(
            AppLocalizations.of(context).recentlyAdded,
            true,
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MorePage(
                        topPicksList,
                        AppLocalizations.of(context).recentlyAdded,
                        PageRoutes.tvShowDetailsPage))),
          ),
          TopPicks(AppLocalizations.of(context).recentlyAdded,
              PageRoutes.tvShowDetailsPage),

          ///Top Picks
          TitleRow(
            AppLocalizations.of(context).topPicks,
            true,
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MorePage(
                        recentList,
                        AppLocalizations.of(context).topPicks,
                        PageRoutes.tvShowDetailsPage))),
          ),
          RecentlyAdded(AppLocalizations.of(context).topPicks,
              PageRoutes.tvShowDetailsPage),

          SizedBox(height: 80.0)
        ],
      ),
    );
  }
}
