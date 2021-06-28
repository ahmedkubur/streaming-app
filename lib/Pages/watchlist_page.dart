import 'package:animation_wrappers/Animations/faded_translation_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocketmovies/Locale/locales.dart';
import 'package:pocketmovies/Theme/colors.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/movie.dart';

class WatchlistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WatchlistBody();
  }
}

class WatchlistBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final List<Video> watchlistMovies = [
      Video(
          image: 'images/thum/4.png',
          title: '2 Stupids',
          genre: AppLocalizations.of(context).comedy +
              AppLocalizations.of(context).drama,
          language: AppLocalizations.of(context).englishText,
          noOfEpisodes: 12),
      Video(
          image: 'images/thum/2.png',
          title: 'RoomMates',
          genre: AppLocalizations.of(context).adventure +
              AppLocalizations.of(context).drama,
          language: AppLocalizations.of(context).englishText,
          noOfEpisodes: 8),
      Video(
          image: 'images/thum/1.png',
          title: 'Queen of heart',
          genre: AppLocalizations.of(context).comedy +
              AppLocalizations.of(context).drama,
          language: AppLocalizations.of(context).englishText,
          noOfEpisodes: 9),
      Video(
          image: 'images/thum/3.png',
          title: 'Wosop !!',
          genre: AppLocalizations.of(context).comedy,
          language: AppLocalizations.of(context).englishText,
          noOfEpisodes: 8),
      Video(
          image: 'images/thum/6.png',
          title: 'CorpoMan',
          genre: AppLocalizations.of(context).adventure,
          language: AppLocalizations.of(context).englishText,
          noOfEpisodes: 3),
      Video(
          image: 'images/thum/7.png',
          title: 'Brain Monkey',
          genre: AppLocalizations.of(context).comedy +
              AppLocalizations.of(context).horror,
          language: AppLocalizations.of(context).englishText,
          noOfEpisodes: 4),
      Video(
          image: 'images/thum/8.png',
          title: 'Another One !',
          genre: AppLocalizations.of(context).comedy +
              AppLocalizations.of(context).drama,
          language: AppLocalizations.of(context).englishText,
          noOfEpisodes: 9),
      Video(
          image: 'images/thum/9.png',
          title: 'World and us',
          genre: AppLocalizations.of(context).comedy +
              AppLocalizations.of(context).drama,
          language: AppLocalizations.of(context).englishText,
          noOfEpisodes: 10),
      Video(
          image: 'images/thum/10.png',
          title: 'Bruno',
          genre: AppLocalizations.of(context).drama,
          language: AppLocalizations.of(context).englishText,
          noOfEpisodes: 12),
      Video(
          image: 'images/thum/11.png',
          title: 'Sci-Astro',
          genre: AppLocalizations.of(context).adventure,
          language: AppLocalizations.of(context).englishText,
          noOfEpisodes: 10),
      Video(
          image: 'images/thum/12.png',
          title: 'Lovers',
          genre: AppLocalizations.of(context).drama,
          language: AppLocalizations.of(context).englishText,
          noOfEpisodes: 5),
    ];
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context).watchlist,
            style: TextStyle(fontSize: 27.0),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(36.0),
            child: Align(
              alignment: getTabAlignment(Directionality.of(context)),
              child: TabBar(
                indicatorColor: scaffoldBackgroundColor,
                labelColor: mainColor,
                unselectedLabelColor: unselectedLabelColor,
                labelStyle: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontSize: 16.7),
                isScrollable: true,
                tabs: <Widget>[
                  Tab(text: AppLocalizations.of(context).movies),
                  Tab(text: AppLocalizations.of(context).tvShows),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            FadedSlideAnimation(
              Watchlist(watchlist: watchlistMovies, screenWidth: screenWidth),
              beginOffset: Offset(0, 0.3),
              endOffset: Offset(0, 0),
              slideCurve: Curves.linearToEaseOut,
            ),
            FadedSlideAnimation(
              Watchlist(watchlist: watchlistMovies, screenWidth: screenWidth),
              beginOffset: Offset(0, 0.3),
              endOffset: Offset(0, 0),
              slideCurve: Curves.linearToEaseOut,
            ),
          ],
        ),
      ),
    );
  }

  Alignment getTabAlignment(TextDirection textDirection) {
    Alignment alignment;
    switch (textDirection) {
      case TextDirection.rtl:
        alignment = Alignment.centerRight;
        break;
      case TextDirection.ltr:
        alignment = Alignment.centerLeft;
        break;
    }
    return alignment;
  }
}

class Watchlist extends StatelessWidget {
  final List<Video> watchlist;
  final double screenWidth;

  Watchlist({this.watchlist, this.screenWidth});

  final bool isDownloaded = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: <Widget>[
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: watchlist.length,
            itemBuilder: (context, index) {
              var imageWidth = screenWidth / 4.25;
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                height: screenWidth / 3,
                decoration: BoxDecoration(
                  color: textBackgroundColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular((8.0)),
                  child: Stack(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.asset(
                            watchlist[index].image,
                            fit: BoxFit.fill,
                            height: screenWidth / 3,
                            width: imageWidth,
                          ),
                          SizedBox(width: 24.0),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(top: 12.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      buildTitle(index, context),
                                      buildPopupMenuButton(),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        height: 28,
                                        margin: EdgeInsets.only(bottom: 12.0),
                                        alignment: Alignment.center,
                                        child: RichText(
                                          text: TextSpan(
                                            style: Theme.of(context)
                                                .textTheme
                                                .overline,
                                            children: [
                                              TextSpan(
                                                  text:
                                                      '${watchlist[index].noOfEpisodes}'),
                                              TextSpan(
                                                  text: '  |  ',
                                                  style: TextStyle(
                                                      color: mainColor)),
                                              TextSpan(text: '40m'),
                                            ],
                                          ),
                                        ),
                                      ),
                                      downloadButton(context, index)
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned.directional(
                        start: imageWidth - 15,
                        bottom: 12,
                        textDirection: Directionality.of(context),
                        child: CircleAvatar(
                          radius: 15.0,
                          backgroundColor: mainColor,
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 80.0)
        ],
      ),
    );
  }

  Widget downloadButton(BuildContext context, int index) {
    return index % 2 == 1
        ? FlatButton(
            onPressed: () {},
            child: Text(
              AppLocalizations.of(context).downloaded,
              style: TextStyle(color: unselectedLabelColor),
            ),
          )
        : FlatButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.file_download,
              color: mainColor,
              size: 20,
            ),
            label: Text(
              AppLocalizations.of(context).download,
              style: TextStyle(color: mainColor),
            ),
          );
  }

  Widget buildTitle(int index, BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(color: darkTextColor),
        children: [
          TextSpan(
              text: watchlist[index].title + '\n',
              style: Theme.of(context).textTheme.headline6),
          TextSpan(text: watchlist[index].genre + '\n'),
          TextSpan(text: watchlist[index].language),
        ],
      ),
    );
  }

  PopupMenuButton buildPopupMenuButton() {
    return PopupMenuButton(
      color: scaffoldBackgroundColor,
      icon: Icon(
        Icons.more_vert,
        color: darkTextColor,
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Row(
            children: <Widget>[
              Icon(
                Icons.delete,
                color: Colors.white,
              ),
              SizedBox(width: 10.0),
              Text(AppLocalizations.of(context).remove)
            ],
          ),
        ),
      ],
    );
  }
}
