import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:pocketmovies/BottomNavigation/Account/payment_navigator.dart';
import 'package:pocketmovies/Locale/locales.dart';
import 'package:pocketmovies/Pages/subscribe_page.dart';

class PaymentPage extends StatelessWidget {
  final String subscriptionTime;
  final String price;

  PaymentPage({this.subscriptionTime, this.price});

  @override
  Widget build(BuildContext context) {
    return PaymentBody(subscriptionTime, price);
  }
}

class PaymentBody extends StatefulWidget {
  final String subscriptionTime;
  final String price;

  PaymentBody(this.subscriptionTime, this.price);

  @override
  _PaymentBodyState createState() => _PaymentBodyState();
}

class _PaymentBodyState extends State<PaymentBody> {
  @override
  Widget build(BuildContext context) {
    var appLocalization = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(appLocalization.subscribe),
      ),
      body: FadedSlideAnimation(
        ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            ///Subscription image
            Padding(
              padding: EdgeInsets.all(20.0),
              child: SubscribeTile(
                subscriptionTime: widget.subscriptionTime,
                price: widget.price,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 32.0, horizontal: 20.0),
              child: Text(
                appLocalization.whyUpgrade,
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(letterSpacing: 1.2),
              ),
            ),
            SizedBox(height: 8.0),
            PaymentTile('images/payment_option/PayPal.png', 'PayPal'),
            PaymentTile('images/payment_option/PayU money.png', 'PayU Money'),
            PaymentTile('images/payment_option/Google pay.png', 'Google Pay'),
            PaymentTile('images/payment_option/Credit card.png', 'Credit Card'),
            PaymentTile('images/payment_option/stripe.png', 'Stripe'),
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}

class PaymentTile extends StatelessWidget {
  final String image;
  final String title;

  PaymentTile(this.image, this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, PaymentRoutes.subscribed);
        },
        leading: FadedScaleAnimation(
          Image.asset(
            image,
            scale: 2.5,
          ),
          durationInMilliseconds: 400,
        ),
        title: Text(title, style: Theme.of(context).textTheme.headline6),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
          size: 16.0,
        ),
      ),
    );
  }
}
