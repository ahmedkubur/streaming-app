import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocketmovies/Components/background_image.dart';
import 'package:pocketmovies/Components/continue_button.dart';
import 'package:pocketmovies/Components/entry_field.dart';
import 'package:pocketmovies/Locale/locales.dart';
import 'package:pocketmovies/Theme/colors.dart';

class SupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    var appLocalization = AppLocalizations.of(context);
    return Stack(
      children: <Widget>[
        BackgroundImage(),
        Scaffold(
          backgroundColor: transparentColor,
          appBar: AppBar(
            automaticallyImplyLeading: true,
            title: Text(appLocalization.support),
          ),
          body: FadedSlideAnimation(
            SingleChildScrollView(
              child: Container(
                height: screenHeight -
                    AppBar().preferredSize.height -
                    MediaQuery.of(context).padding.vertical,
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Spacer(flex: 2),
                    FadedScaleAnimation(
                      Image.asset(
                        'images/main_logo.png',
                        height: 112,
                        width: 90,
                      ),
                      durationInMilliseconds: 400,
                    ),
                    Spacer(flex: 3),
                    Text(
                      appLocalization.connectUs,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Spacer(),
                    FloatingActionButton.extended(
                      icon: Icon(
                        Icons.call,
                        color: mainColor,
                      ),
                      label: Text(
                        appLocalization.callUs,
                        style: TextStyle(color: mainColor),
                      ),
                      onPressed: () {},
                      backgroundColor: transparentColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          side: BorderSide(color: mainColor, width: 0.5)),
                    ),
                    Spacer(),
                    Text(
                      appLocalization.writeUs,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Spacer(),
                    EntryField(
                      label: appLocalization.writeMessage,
                      maxLength: 200,
                      maxLines: 5,
                    ),
                    ContinueButton(
                      () {},
                      text: appLocalization.submit,
                    )
                  ],
                ),
              ),
            ),
            beginOffset: Offset(0, 0.3),
            endOffset: Offset(0, 0),
            slideCurve: Curves.linearToEaseOut,
          ),
        )
      ],
    );
  }
}
