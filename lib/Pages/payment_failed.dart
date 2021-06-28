import 'package:animation_wrappers/Animations/faded_translation_animation.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:pocketmovies/Components/continue_button.dart';
import 'package:pocketmovies/Locale/locales.dart';

class PaymentFailedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
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
                  AppLocalizations.of(context).oops,
                  style: TextStyle(fontSize: 28.0),
                ),
              ),
              Center(
                child: Text(
                  '\n' + AppLocalizations.of(context).paymentFailed,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Spacer(),
              Center(
                child: Text(AppLocalizations.of(context).somethingWentWrong +
                    '\n' +
                    AppLocalizations.of(context).pleaseTryAgain),
              ),
              Spacer(),
              ContinueButton(
                () {
                  Phoenix.rebirth(context);
                },
                text: AppLocalizations.of(context).findYourShow,
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
