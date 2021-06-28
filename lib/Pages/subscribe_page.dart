import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pocketmovies/Locale/locales.dart';
import 'package:pocketmovies/BottomNavigation/Account/payment_navigator.dart';
import 'package:pocketmovies/Theme/colors.dart';

class SubscribePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SubscribeBody();
  }
}

class SubscribeBody extends StatefulWidget {
  @override
  _SubscribeBodyState createState() => _SubscribeBodyState();
}

class _SubscribeBodyState extends State<SubscribeBody> {
  @override
  Widget build(BuildContext context) {
    var appLocalization = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(appLocalization.subscribe),
      ),
      body: FadedSlideAnimation(
        Padding(
          padding: EdgeInsets.all(20.0),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              SubscribeTile(
                subscriptionTime: '3 ' + appLocalization.months,
                price: '\$ 9.99',
                onTap: () {
                  Navigator.pushNamed(context, PaymentRoutes.payment,
                      arguments: SubscribeData(
                          '3 ' + AppLocalizations.of(context).months,
                          '\$ 9.99'));
                },
              ),
              SizedBox(height: 10.0),
              SubscribeTile(
                subscriptionTime: '6 ' + appLocalization.months,
                price: '\$ 14.99',
                onTap: () {
                  Navigator.pushNamed(context, PaymentRoutes.payment,
                      arguments: SubscribeData(
                          '6 ' + AppLocalizations.of(context).months,
                          '\$ 14.99'));
                },
              ),
              SizedBox(height: 10.0),
              SubscribeTile(
                subscriptionTime: '12 ' + appLocalization.months,
                price: '\$ 23.99',
                onTap: () {
                  Navigator.pushNamed(context, PaymentRoutes.payment,
                      arguments: SubscribeData(
                          '12 ' + AppLocalizations.of(context).months,
                          '\$ 23.99'));
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 44.0, bottom: 28.0),
                child: Text(
                  appLocalization.whyUpgrade,
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(letterSpacing: 1.2),
                ),
              ),
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

class SubscribeData {
  final String subscriptionTime;
  final String price;

  SubscribeData(this.subscriptionTime, this.price);
}

class SubscribeTile extends StatelessWidget {
  final String subscriptionTime;
  final String price;
  final Function onTap;

  SubscribeTile({this.subscriptionTime, this.price, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: <Widget>[
          FadedScaleAnimation(
            Container(
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                image:
                    DecorationImage(image: AssetImage('images/subscribe.png')),
              ),
            ),
            durationInMilliseconds: 400,
          ),
          Positioned(
            top: 28.0,
            left: 25.0,
            child: Text(
              AppLocalizations.of(context).starterPack.toUpperCase(),
              style: TextStyle(color: subscribeColor, letterSpacing: 2.4),
            ),
          ),
          Positioned(
            bottom: 30.0,
            left: 25.0,
            child: Text(
              subscriptionTime.toUpperCase(),
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Positioned(
            bottom: 30.0,
            right: 25.0,
            child: Text(
              price,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ],
      ),
    );
  }
}
