import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/more_page.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/recently_added.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/top_picks.dart';
import 'package:pocketmovies/BottomNavigation/Home/Shows/UI/shows_page.dart';
import 'package:pocketmovies/Locale/locales.dart';
import 'package:pocketmovies/Routes/routes.dart';
import 'package:pocketmovies/Theme/colors.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SearchBody();
  }
}

class SearchBody extends StatefulWidget {
  @override
  _SearchBodyState createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  final List<String> _searchList = [];

  @override
  Widget build(BuildContext context) {
    var appLocalization = AppLocalizations.of(context);
    final List<String> _filters = [
      appLocalization.comedyMovie,
      appLocalization.mystery,
      appLocalization.thriller,
      appLocalization.bollywood,
      appLocalization.animated,
      appLocalization.cartoon,
      appLocalization.superHero,
      appLocalization.tvSeries,
      appLocalization.fiction,
    ];
    return Scaffold(
      body: FadedSlideAnimation(
        SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    appLocalization.searchPageTitle,
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(letterSpacing: 1.2),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(16.0),
                  padding:
                      EdgeInsets.symmetric(vertical: 6.0, horizontal: 24.0),
                  color: blackColor,
                  child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.search, color: mainColor),
                      border: InputBorder.none,
                      hintText: appLocalization.searchBarHint,
                      hintStyle: TextStyle(color: unselectedLabelColor),
                    ),
                    onSubmitted: (s) {
                      setState(() {
                        _searchList.add(s);
                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Wrap(
                    alignment: WrapAlignment.spaceEvenly,
                    children: _filters
                        .map(
                          (text) => FilterChip(
                            labelPadding: EdgeInsets.symmetric(
                                vertical: 2.0, horizontal: 16.0),
                            label: Text(
                              text.toUpperCase(),
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  .copyWith(color: lightTextColor),
                            ),
                            // shape: OutlineInputBorder(
                            //   borderRadius: BorderRadius.circular(8.0),
                            // ),
                            backgroundColor: textBackgroundColor,
                            selectedColor: selectedChipColor,
                            onSelected: (bool value) {},
                          ),
                        )
                        .toList(),
                  ),
                ),
                _searchList.isNotEmpty
                    ? Column(
                        children: <Widget>[
                          TitleRow(
                            appLocalization.recentlySearched,
                            false,
                            button: FlatButton(
                              child: Text(
                                appLocalization.clearAll.toUpperCase(),
                                style: Theme.of(context)
                                    .textTheme
                                    .caption
                                    .copyWith(color: mainColor),
                              ),
                              onPressed: () {
                                setState(() {
                                  _searchList.clear();
                                });
                              },
                            ),
                          ),
                          Container(
                            height: 144.0,
                            child: ListView.builder(
                              itemCount: _searchList.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 6.0,
                                        horizontal: 16.0,
                                      ),
                                      child: Icon(Icons.youtube_searched_for,
                                          color: mainColor),
                                    ),
                                    Text(
                                      _searchList[index],
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      )
                    : SizedBox.shrink(),

//              ///Explore by Genre
//              TitleRow('Explore by genre', false),
//              Container(
//                margin: EdgeInsets.only(left: 8.0),
//                height: 36.0,
//                child: ExploreByGenre(width: screenWidth / 4.25),
//              ),

                ///Recently Added
                TitleRow(
                  AppLocalizations.of(context).recentlyAdded,
                  true,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MorePage(
                          recentList,
                          AppLocalizations.of(context).recentlyAdded,
                          PageRoutes.movieDetailsPage),
                    ),
                  ),
                ),
                RecentlyAdded(AppLocalizations.of(context).recentlyAdded,
                    PageRoutes.movieDetailsPage),

                ///Top Picks
                TitleRow(
                  AppLocalizations.of(context).topPicks,
                  true,
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MorePage(
                              topPicksList,
                              AppLocalizations.of(context).topPicks,
                              PageRoutes.movieDetailsPage))),
                ),
                TopPicks(AppLocalizations.of(context).topPicks,
                    PageRoutes.movieDetailsPage),

                SizedBox(
                  height: 80.0,
                )
              ],
            ),
          ),
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
