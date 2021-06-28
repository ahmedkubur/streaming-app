import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:pocketmovies/BottomNavigation/Home/Shows/UI/shows_page.dart';
import 'package:pocketmovies/BottomNavigation/Home/TvShows/tv_shows_page.dart';
import 'package:pocketmovies/BottomNavigation/Search/search_page.dart';
import 'package:pocketmovies/Locale/locales.dart';
import 'package:pocketmovies/Theme/colors.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Home();
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: FadedScaleAnimation(
              Image.asset(
                'images/logo.png',
                scale: 2.7,
              ),
              durationInMilliseconds: 400,
            ),
            title: TabBar(
              labelColor: mainColor,
              unselectedLabelColor: unselectedLabelColor,
              indicator: BoxDecoration(color: transparentColor),
              tabs: <Widget>[
                Tab(child: Text(AppLocalizations.of(context).movies)),
                Tab(child: Text(AppLocalizations.of(context).tvShows)),
              ],
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchPage()));
                },
              )
            ],
          ),
          body: TabBarView(
            children: <Widget>[
              FadedSlideAnimation(
                MoviesPage(),
                beginOffset: Offset(0, 0.3),
                endOffset: Offset(0, 0),
                slideCurve: Curves.linearToEaseOut,
              ),
              FadedSlideAnimation(
                TvShowsPage(),
                beginOffset: Offset(0, 0.3),
                endOffset: Offset(0, 0),
                slideCurve: Curves.linearToEaseOut,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
