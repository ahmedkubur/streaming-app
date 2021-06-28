import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:pocketmovies/BottomNavigation/Home/Components/movie.dart';

class ThumbTile extends StatelessWidget {
  final Video videoIndex;
  final String routeName;

  ThumbTile(this.videoIndex, this.routeName);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      child: FadedScaleAnimation(
        Container(
          margin: EdgeInsets.only(left: 8.0),
          height: screenWidth / 3,
          width: screenWidth / 4.25,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(videoIndex.image), fit: BoxFit.fill),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        durationInMilliseconds: 400,
      ),
      onTap: () => Navigator.pushNamed(context, routeName),
    );
  }
}
