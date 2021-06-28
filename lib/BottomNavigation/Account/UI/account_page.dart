import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:pocketmovies/Components/background_image.dart';
import 'package:pocketmovies/Components/button_with_icon.dart';
import 'package:pocketmovies/Locale/locales.dart';
import 'package:pocketmovies/Routes/routes.dart';
import 'package:pocketmovies/Theme/colors.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AccountBody();
  }
}

class AccountBody extends StatefulWidget {
  @override
  _AccountBodyState createState() => _AccountBodyState();
}

class _AccountBodyState extends State<AccountBody> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> benefitsList = [
      {
        'image': 'images/premium/premium1.png',
        'text': AppLocalizations.of(context).feature1
      },
      {
        'image': 'images/premium/premium2.png',
        'text': AppLocalizations.of(context).feature2
      },
      {
        'image': 'images/premium/premium3.png',
        'text': AppLocalizations.of(context).feature3
      },
    ];

    final double screenWidth = MediaQuery.of(context).size.width;
    return Stack(children: <Widget>[
      BackgroundImage(),
      Scaffold(
          backgroundColor: transparentColor,
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context).account,
              style: TextStyle(fontSize: 27.0),
            ),
            actions: <Widget>[
              LogoutButton(),
            ],
          ),
          body: FadedSlideAnimation(
            ListView(
              children: <Widget>[
                UserDetails('Samantha Smith', 'images/user/my profile.png',
                    screenWidth),
                ListTile(
                  leading: Icon(Icons.settings, color: mainColor),
                  title: Text(AppLocalizations.of(context).settings),
                  onTap: () =>
                      Navigator.pushNamed(context, PageRoutes.settingsPage),
                ),
                ListTile(
                  leading: Icon(Icons.assignment, color: mainColor),
                  title: Text(AppLocalizations.of(context).privacyPolicy),
                  onTap: () => Navigator.pushNamed(
                      context, PageRoutes.privacyPolicyPage),
                ),
                ListTile(
                  leading: Icon(Icons.mail, color: mainColor),
                  title: Text(AppLocalizations.of(context).support),
                  onTap: () =>
                      Navigator.pushNamed(context, PageRoutes.supportPage),
                ),

                //  target: Target.CodeCanyon),
                Column(
                  children: <Widget>[
                    Premium(
                        screenWidth: screenWidth, benefitsList: benefitsList),
                    Row(
                      children: <Widget>[
                        SizedBox(width: 20.0),
                        ButtonWithIcon(
                          image: 'images/ic_crown.png',
                          label: AppLocalizations.of(context).upgrade,
                          color: mainColor,
                          onTap: () {
                            Navigator.pushNamed(
                                context, PageRoutes.paymentNavigator);
                          },
                        ),
                        SizedBox(width: 20.0),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 12.0),
              ],
            ),
            beginOffset: Offset(0, 0.3),
            endOffset: Offset(0, 0),
            slideCurve: Curves.linearToEaseOut,
          ))
    ]);
  }
}

class Premium extends StatelessWidget {
  final double screenWidth;
  final List<Map<String, String>> benefitsList;

  Premium({this.screenWidth, this.benefitsList});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 12.0, bottom: 12.0),
      height: screenWidth / 4.5,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: benefitsList.length,
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(left: 8.0),
              width: screenWidth / 1.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(benefitsList[index]['image']),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text(
                    benefitsList[index]['text'],
                    style: TextStyle(fontWeight: FontWeight.bold, height: 1.5),
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class UserDetails extends StatelessWidget {
  final String name;
  final String image;
  final double screenWidth;

  UserDetails(this.name, this.image, this.screenWidth);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, PageRoutes.myProfilePage),
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Hero(
              tag: 'profile_image',
              child: CircleAvatar(
                radius: 36,
                backgroundImage: AssetImage(image),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                name,
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset(
                    'images/ic_crown_2.png',
                    height: 15.0,
                  ),
                  SizedBox(width: 10),
                  Text(
                    AppLocalizations.of(context).premium,
                    style: TextStyle(color: premiumColor),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        AppLocalizations.of(context).logout,
        style: TextStyle(color: mainColor),
      ),
      onPressed: () {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: textBackgroundColor,
              title: Text(AppLocalizations.of(context).loggingOut),
              content: Text(AppLocalizations.of(context).areYouSure),
              actions: <Widget>[
                FlatButton(
                  child: Text(AppLocalizations.of(context).no),
                  textColor: mainColor,
                  onPressed: () => Navigator.pop(context),
                ),
                FlatButton(
                    child: Text(AppLocalizations.of(context).yes),
                    textColor: mainColor,
                    onPressed: () {
                      Phoenix.rebirth(context);
                    })
              ],
            );
          },
        );
      },
    );
  }
}
