import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:pocketmovies/BottomNavigation/Home/Shows/UI/clips_tab.dart';
import 'package:pocketmovies/BottomNavigation/Home/Shows/UI/reviews_tab.dart';
import 'package:pocketmovies/BottomNavigation/Home/TvShows/seasons_tab.dart';
import 'package:pocketmovies/Locale/locales.dart';
import 'package:pocketmovies/Theme/colors.dart';

class TabSection extends StatelessWidget {
  final String tab1;

  TabSection({this.tab1});

  @override
  Widget build(BuildContext context) {
    final double padding = (MediaQuery.of(context).padding.vertical +
        AppBar().preferredSize.height);
    final double height = MediaQuery.of(context).size.height - padding;
    final double heightWith2Padding =
        MediaQuery.of(context).size.height - 2 * padding;
    return DefaultTabController(
      length: 2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 4.0),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: TabBar(
                indicatorColor: transparentColor,
                labelColor: mainColor,
                unselectedLabelColor: unselectedLabelColor,
                labelStyle: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontSize: 16.7),
                isScrollable: true,
                tabs: [
                  Tab(text: tab1),
                  Tab(text: AppLocalizations.of(context).reviews),
                ],
              ),
            ),
          ),
          Container(
            height: tab1 == AppLocalizations.of(context).seasons
                ? height * 0.75
                : heightWith2Padding * 0.75,
            child: TabBarView(
              children: [
                tab1 == AppLocalizations.of(context).seasons
                    ? FadedSlideAnimation(
                        SeasonsTab(),
                        beginOffset: Offset(0, 0.3),
                        endOffset: Offset(0, 0),
                        slideCurve: Curves.linearToEaseOut,
                      )
                    : FadedSlideAnimation(
                        ClipsTab(),
                        beginOffset: Offset(0, 0.3),
                        endOffset: Offset(0, 0),
                        slideCurve: Curves.linearToEaseOut,
                      ),
                FadedSlideAnimation(
                  ReviewsTab(),
                  beginOffset: Offset(0, 0.3),
                  endOffset: Offset(0, 0),
                  slideCurve: Curves.linearToEaseOut,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
