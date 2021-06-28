import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocketmovies/Auth/Verification/profile_screen.dart';
import 'package:pocketmovies/Components/background_image.dart';
import 'package:pocketmovies/Components/continue_button.dart';
import 'package:pocketmovies/Components/entry_field.dart';
import 'package:pocketmovies/Locale/locales.dart';
import 'package:pocketmovies/Theme/colors.dart';

class VerificationPage extends StatelessWidget {
  final VoidCallback callback;

  VerificationPage(this.callback);

  @override
  Widget build(BuildContext context) {
    return VerificationBody(callback);
  }
}

class VerificationBody extends StatefulWidget {
  final VoidCallback onVerificationDone;

  VerificationBody(this.onVerificationDone);

  @override
  _VerificationBodyState createState() => _VerificationBodyState();
}

class _VerificationBodyState extends State<VerificationBody> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        BackgroundImage(),
        Scaffold(
          backgroundColor: transparentColor,
          appBar: AppBar(
            automaticallyImplyLeading: true,
            title: Text(AppLocalizations.of(context).verification),
          ),
          body: FadedSlideAnimation(
            SingleChildScrollView(
              child: Container(
                height: screenHeight -
                    AppBar().preferredSize.height -
                    MediaQuery.of(context).padding.vertical,
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Spacer(),
                    Text(
                      AppLocalizations.of(context).almostLoggedIn +
                          '\n\n' +
                          AppLocalizations.of(context).enterOtp,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    Spacer(),
                    EntryField(
                      keyboardType: TextInputType.number,
                      readOnly: false,
                      label: AppLocalizations.of(context).enterVerificationCode,
                      maxLength: 6,
                    ),
                    Hero(
                      tag: 'signToVer',
                      child: ContinueButton(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileScreen()),
                        );
                        // widget.onVerificationDone();
                      }, text: AppLocalizations.of(context).submit),
                    ),
                    Spacer(flex: 5),
                  ],
                ),
              ),
            ),
            beginOffset: Offset(0, 0.3),
            endOffset: Offset(0, 0),
            slideCurve: Curves.linearToEaseOut,
          ),
        ),
      ],
    );
  }
}
