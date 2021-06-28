import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:pocketmovies/BottomNavigation/Home/Shows/UI/shows_page.dart';
import 'package:pocketmovies/Components/blurred_container.dart';
import 'package:pocketmovies/Locale/locales.dart';
import 'package:pocketmovies/Theme/colors.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/movie.dart';

class ContinueWatchingPage extends StatelessWidget {
  final String routeName;

  ContinueWatchingPage({this.routeName});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    var locale = AppLocalizations.of(context);
    final List<Video> _watchingList = [
      Video(
          image: 'images/continue_watching/11.png',
          title: 'Ghost Next Door',
          genre: locale.horror),
      Video(
          image: 'images/continue_watching/22.png',
          title: '2 Stupids',
          genre: locale.drama),
      Video(
          image: 'images/continue_watching/33.png',
          title: 'Life at 22',
          genre: locale.comedy),
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(locale.continueWatching.toUpperCase()),
      ),
      body: Padding(
        padding:
            EdgeInsets.only(left: 28.0, right: 36.0, top: 28.0, bottom: 28.0),
        child: GridView.builder(
            itemCount: _watchingList.length,
            controller: ScrollController(keepScrollOffset: false),
            physics: BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20.0,
              mainAxisSpacing: 20.0,
              childAspectRatio: (screenWidth / 3) / (screenWidth / 4),
            ),
            itemBuilder: (context, index) {
              return ContinueWatchingCard(_watchingList[index], routeName);
            }),
      ),
    );
  }
}

class ContinueWatching extends StatelessWidget {
  final String routeName;

  ContinueWatching(this.routeName);

  @override
  Widget build(BuildContext context) {
    final List<Video> _watchingList = [
      Video(
          image: 'images/continue_watching/11.png',
          title: 'Ghost Next Door',
          genre: AppLocalizations.of(context).horror),
      Video(
          image: 'images/continue_watching/22.png',
          title: '2 Stupids',
          genre: AppLocalizations.of(context).drama),
      Video(
          image: 'images/continue_watching/33.png',
          title: 'Life at 22',
          genre: AppLocalizations.of(context).comedy),
    ];
    return Container(
      margin: EdgeInsets.only(left: 8.0),
      height: 120,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: movies.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Hero(
              tag: index,
              child: ContinueWatchingCard(_watchingList[index], routeName));
        },
      ),
    );
  }
}

class ContinueWatchingCard extends StatelessWidget {
  final Video movieIndex;
  final String routeName;

  ContinueWatchingCard(this.movieIndex, this.routeName);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, routeName),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        width: screenWidth / 2.85,
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                FadedScaleAnimation(
                  Container(
                    height: screenWidth / 5.1,
                    width: screenWidth / 2.85,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(movieIndex.image),
                          fit: BoxFit.cover),
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(8.0)),
                    ),
                  ),
                  durationInMilliseconds: 400,
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      color: textBackgroundColor,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(8.0))),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: movieIndex.title + '\n',
                          style: Theme.of(context).textTheme.overline,
                        ),
                        TextSpan(
                          text: movieIndex.genre,
                          style: TextStyle(fontSize: 8, color: darkTextColor),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Positioned(
              right: 0.0,
              top: 40.0,
              child: BlurredContainer(
                child: Icon(Icons.play_arrow, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
