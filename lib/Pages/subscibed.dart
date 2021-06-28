import 'package:animation_wrappers/Animations/faded_translation_animation.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pocketmovies/Components/continue_button.dart';
import 'package:pocketmovies/Locale/locales.dart';
import 'package:pocketmovies/Theme/colors.dart';

class SubscribedPage extends StatelessWidget {
  final VoidCallback onPaymentDone;

  SubscribedPage(this.onPaymentDone);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    var appLocalization = AppLocalizations.of(context);
    return Scaffold(
      body: FadedSlideAnimation(
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Spacer(),
              FadedScaleAnimation(
                Image.asset(
                  'images/subscribed.png',
                  height: screenWidth / 2,
                  width: screenWidth / 1.5,
                ),
                durationInMilliseconds: 400,
              ),
              Spacer(),
              Center(
                child: Text(
                  appLocalization.hola,
                  style: TextStyle(fontSize: 28.0),
                ),
              ),
              Center(
                child: Text(
                  '\n' + appLocalization.subscribedNow,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Spacer(),
              ListTile(
                leading: Icon(
                  Icons.check_circle,
                  color: mainColor,
                ),
                title: Text(appLocalization.getAccess),
              ),
              ListTile(
                leading: Icon(
                  Icons.check_circle,
                  color: mainColor,
                ),
                title: Text(appLocalization.enableDownload),
              ),
              ListTile(
                leading: Icon(
                  Icons.check_circle,
                  color: mainColor,
                ),
                title: Text(appLocalization.watchPremium),
              ),
              Spacer(),
              ContinueButton(
                () {
                  onPaymentDone();
                },
                text: appLocalization.findYourShow,
              )
            ],
          ),
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
