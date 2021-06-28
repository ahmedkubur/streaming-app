import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:pocketmovies/Auth/sign_in_navigator.dart';
import 'package:pocketmovies/Components/background_image.dart';
import 'package:pocketmovies/Components/continue_button.dart';
import 'package:pocketmovies/Components/entry_field.dart';
import 'package:pocketmovies/Locale/locales.dart';
import 'package:pocketmovies/Theme/colors.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SignUpBody();
  }
}

class SignUpBody extends StatefulWidget {
  @override
  _SignUpBodyState createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  TextEditingController qualityController =
      TextEditingController(text: "Child account");
  String isoCode;

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
            title: Text(AppLocalizations.of(context).signUp),
          ),
          body: FadedSlideAnimation(
            SingleChildScrollView(
              child: Container(
                height: screenHeight -
                    AppBar().preferredSize.height -
                    MediaQuery.of(context).padding.vertical,
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Spacer(flex: 2),
                    // FadedScaleAnimation(
                    //   Image.asset(
                    //     'images/main_logo.png',
                    //     height: 112,
                    //     width: 80,
                    //   ),
                    //   durationInMilliseconds: 400,
                    // ),
                    Expanded(
                      child: SizedBox(
                        height: 60.0,
                      ),
                    ),
                    EntryField(
                      textCapitalization: TextCapitalization.words,
                      label: AppLocalizations.of(context).fullName,
                    ),

                    //email textField
                    EntryField(
                      textCapitalization: TextCapitalization.none,
                      label: AppLocalizations.of(context).emailAddress,
                      keyboardType: TextInputType.emailAddress,
                    ),

                    //phone textField
                    EntryField(
                      label: AppLocalizations.of(context).phoneNum,
                      keyboardType: TextInputType.phone,
                    ),
                    buildEntryField(
                      context: context,
                      controller: qualityController,
                      label: "Acoount Type",
                      upperPadding: 120.0,
                      items: [
                        PopupMenuItem(
                          child: Text('Child account'),
                          value: 'Child account',
                        ),
                        PopupMenuItem(
                          child: Text('Adult account'),
                          value: 'Adult account',
                        ),
                      ],
                    ),
                    Hero(
                      tag: 'signToVer',
                      child: ContinueButton(() {
                        Navigator.pushNamed(context, SignInRoutes.verification);
                      }),
                    ),
                    Spacer(),
                    Text(
                      AppLocalizations.of(context).bySigningUp,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, height: 2.32),
                    ),
                    Text(
                      AppLocalizations.of(context).tnc,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: mainColor),
                    ),
                    Spacer(),
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

  EntryField buildEntryField({
    BuildContext context,
    TextEditingController controller,
    String label,
    List<PopupMenuItem> items,
    double upperPadding,
  }) {
    return EntryField(
      controller: controller,
      label: label,
      readOnly: true,
      suffixIcon: Icon(
        Icons.keyboard_arrow_down,
        color: mainColor,
      ),
      onTap: () async {
        // var prefs = await SharedPreferences.getInstance();
        var result = await showMenu(
          color: textBackgroundColor,
          context: context,
          position: RelativeRect.fromLTRB(100.0, upperPadding, 30.0, 0.0),
          items: items,
        );
        if (result == null) {
          result = controller.text;
        }

        controller.text = result.toString();
      },
    );
  }
}
