import 'package:flutter/material.dart';
import 'package:pocketmovies/BottomNavigation/Home/Shows/UI/movie_details.dart';
import 'package:pocketmovies/Locale/locales.dart';
import 'package:pocketmovies/Routes/routes.dart';

class Genre {
  final String genre;
  final Color color;

  Genre(this.genre, this.color);
}

class ExploreByGenre extends StatelessWidget {
  final double width;

  ExploreByGenre({this.width});

  @override
  Widget build(BuildContext context) {
    List<Genre> genres = [
      Genre(AppLocalizations.of(context).action, Colors.blue),
      Genre(AppLocalizations.of(context).adventure, Colors.red),
      Genre(AppLocalizations.of(context).comedy, Colors.yellow.shade800),
      Genre(AppLocalizations.of(context).drama, Colors.green),
      Genre(AppLocalizations.of(context).horror, Colors.deepPurple),
    ];

    return ListView.builder(
      shrinkWrap: true,
      itemCount: genres.length,
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MovieDetailsPage(
                      title: 'CorpoMan',
                      genre: AppLocalizations.of(context).comedy,
                      image: 'images/movie poster.png'))),
          child: Container(
            margin: EdgeInsets.only(left: 8.0),
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: genres[index].color,
            ),
            padding: EdgeInsets.all(8.0),
            child: Center(
                child: Text(
              genres[index].genre.toUpperCase(),
              style: Theme.of(context).textTheme.caption,
            )),
          ),
        );
      },
    );
  }
}
