import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/movie.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/thumb_tile.dart';

class MorePage extends StatelessWidget {
  final String title;
  final List<Video> list;
  final String routeName;

  MorePage(this.list, this.title, this.routeName);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title.toUpperCase()),
      ),
      body: FadedSlideAnimation(
        Padding(
          padding:
              EdgeInsets.only(left: 20.0, right: 28.0, top: 20.0, bottom: 20.0),
          child: GridView.builder(
              itemCount: list.length,
              controller: ScrollController(keepScrollOffset: false),
              physics: BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 24.0,
                  crossAxisSpacing: 20.0,
                  childAspectRatio: (screenWidth / 4) / (screenWidth / 3.25)),
              itemBuilder: (context, index) {
                return ThumbTile(list[index], routeName);
              }),
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
