import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:pocketmovies/Locale/Languages/arabic.dart';
import 'dart:async';
import 'package:pocketmovies/Locale/Languages/english.dart';
import 'package:pocketmovies/Locale/Languages/french.dart';
import 'package:pocketmovies/Locale/Languages/indonesian.dart';
import 'package:pocketmovies/Locale/Languages/portuguese.dart';
import 'package:pocketmovies/Locale/Languages/spanish.dart';

class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': english(),
    'ar': arabic(),
    'fr': french(),
    'in': indonesian(),
    'pt': portuguese(),
    'es': spanish(),
  };

  String get signIn {
    return _localizedValues[locale.languageCode]['signIn'];
  }

  String get enterPhone {
    return _localizedValues[locale.languageCode]['enterPhone'];
  }

  String get toContinue {
    return _localizedValues[locale.languageCode]['toContinue'];
  }

  String get phoneNum {
    return _localizedValues[locale.languageCode]['phoneNum'];
  }

  String get continueText {
    return _localizedValues[locale.languageCode]['continueText'];
  }

  String get orContinueWith {
    return _localizedValues[locale.languageCode]['orContinueWith'];
  }

  String get signUp {
    return _localizedValues[locale.languageCode]['signUp'];
  }

  String get fullName {
    return _localizedValues[locale.languageCode]['fullName'];
  }

  String get emailAddress {
    return _localizedValues[locale.languageCode]['emailAddress'];
  }

  String get bySigningUp {
    return _localizedValues[locale.languageCode]['bySigningUp'];
  }

  String get tnc {
    return _localizedValues[locale.languageCode]['tnc'];
  }

  String get verification {
    return _localizedValues[locale.languageCode]['verification'];
  }

  String get almostLoggedIn {
    return _localizedValues[locale.languageCode]['almostLoggedIn'];
  }

  String get enterOtp {
    return _localizedValues[locale.languageCode]['enterOtp'];
  }

  String get enterVerificationCode {
    return _localizedValues[locale.languageCode]['enterVerificationCode'];
  }

  String get submit {
    return _localizedValues[locale.languageCode]['submit'];
  }

  String get hey {
    return _localizedValues[locale.languageCode]['hey'];
  }

  String get youAreAlmost {
    return _localizedValues[locale.languageCode]['youAreAlmost'];
  }

  String get kindlyProvide {
    return _localizedValues[locale.languageCode]['kindlyProvide'];
  }

  String get account {
    return _localizedValues[locale.languageCode]['account'];
  }

  String get logout {
    return _localizedValues[locale.languageCode]['logout'];
  }

  String get notPremium {
    return _localizedValues[locale.languageCode]['notPremium'];
  }

  String get premium {
    return _localizedValues[locale.languageCode]['premium'];
  }

  String get settings {
    return _localizedValues[locale.languageCode]['settings'];
  }

  String get privacyPolicy {
    return _localizedValues[locale.languageCode]['privacyPolicy'];
  }

  String get support {
    return _localizedValues[locale.languageCode]['support'];
  }

  String get login {
    return _localizedValues[locale.languageCode]['login'];
  }

  String get feature1 {
    return _localizedValues[locale.languageCode]['feature1'];
  }

  String get feature2 {
    return _localizedValues[locale.languageCode]['feature2'];
  }

  String get feature3 {
    return _localizedValues[locale.languageCode]['feature3'];
  }

  String get upgrade {
    return _localizedValues[locale.languageCode]['upgrade'];
  }

  String get movies {
    return _localizedValues[locale.languageCode]['movies'];
  }

  String get tvShows {
    return _localizedValues[locale.languageCode]['tvShows'];
  }

  String get continueWatching {
    return _localizedValues[locale.languageCode]['continueWatching'];
  }

  String get recentlyAdded {
    return _localizedValues[locale.languageCode]['recentlyAdded'];
  }

  String get exploreByGenre {
    return _localizedValues[locale.languageCode]['exploreByGenre'];
  }

  String get topPicks {
    return _localizedValues[locale.languageCode]['topPicks'];
  }

  String get action {
    return _localizedValues[locale.languageCode]['action'];
  }

  String get adventure {
    return _localizedValues[locale.languageCode]['adventure'];
  }

  String get comedy {
    return _localizedValues[locale.languageCode]['comedy'];
  }

  String get drama {
    return _localizedValues[locale.languageCode]['drama'];
  }

  String get horror {
    return _localizedValues[locale.languageCode]['horror'];
  }

  String get searchPageTitle {
    return _localizedValues[locale.languageCode]['searchPageTitle'];
  }

  String get searchBarHint {
    return _localizedValues[locale.languageCode]['searchBarHint'];
  }

  String get comedyMovie {
    return _localizedValues[locale.languageCode]['comedyMovie'];
  }

  String get mystery {
    return _localizedValues[locale.languageCode]['mystery'];
  }

  String get thriller {
    return _localizedValues[locale.languageCode]['thriller'];
  }

  String get bollywood {
    return _localizedValues[locale.languageCode]['bollywood'];
  }

  String get animated {
    return _localizedValues[locale.languageCode]['animated'];
  }

  String get cartoon {
    return _localizedValues[locale.languageCode]['cartoon'];
  }

  String get superHero {
    return _localizedValues[locale.languageCode]['superHero'];
  }

  String get tvSeries {
    return _localizedValues[locale.languageCode]['tvSeries'];
  }

  String get fiction {
    return _localizedValues[locale.languageCode]['fiction'];
  }

  String get recentlySearched {
    return _localizedValues[locale.languageCode]['recentlySearched'];
  }

  String get clearAll {
    return _localizedValues[locale.languageCode]['clearAll'];
  }

  String get watchlist {
    return _localizedValues[locale.languageCode]['watchlist'];
  }

  String get download {
    return _localizedValues[locale.languageCode]['download'];
  }

  String get downloaded {
    return _localizedValues[locale.languageCode]['downloaded'];
  }

  String get language {
    return _localizedValues[locale.languageCode]['language'];
  }

  String get remove {
    return _localizedValues[locale.languageCode]['remove'];
  }

  String get notLoggedIn {
    return _localizedValues[locale.languageCode]['notLoggedIn'];
  }

  String get time {
    return _localizedValues[locale.languageCode]['time'];
  }

  String get watchMovie {
    return _localizedValues[locale.languageCode]['watchMovie'];
  }

  String get seasons {
    return _localizedValues[locale.languageCode]['seasons'];
  }

  String get season {
    return _localizedValues[locale.languageCode]['season'];
  }

  String get clips {
    return _localizedValues[locale.languageCode]['clips'];
  }

  String get reviews {
    return _localizedValues[locale.languageCode]['reviews'];
  }

  String get trailer {
    return _localizedValues[locale.languageCode]['trailer'];
  }

  String get ofText {
    return _localizedValues[locale.languageCode]['ofText'];
  }

  String get peopleRated {
    return _localizedValues[locale.languageCode]['peopleRated'];
  }

  String get videoQuality {
    return _localizedValues[locale.languageCode]['videoQuality'];
  }

  String get preferredAppLanguage {
    return _localizedValues[locale.languageCode]['preferredAppLanguage'];
  }

  String get wifiOnly {
    return _localizedValues[locale.languageCode]['wifiOnly'];
  }

  String get mobileData {
    return _localizedValues[locale.languageCode]['mobileData'];
  }

  String get englishText {
    return _localizedValues[locale.languageCode]['englishText'];
  }

  String get downloads {
    return _localizedValues[locale.languageCode]['downloads'];
  }

  String get addYourReview {
    return _localizedValues[locale.languageCode]['addYourReview'];
  }

  String get letUsKnow {
    return _localizedValues[locale.languageCode]['letUsKnow'];
  }

  String get enterYourReview {
    return _localizedValues[locale.languageCode]['enterYourReview'];
  }

  String get connectUs {
    return _localizedValues[locale.languageCode]['connectUs'];
  }

  String get callUs {
    return _localizedValues[locale.languageCode]['callUs'];
  }

  String get writeUs {
    return _localizedValues[locale.languageCode]['writeUs'];
  }

  String get writeMessage {
    return _localizedValues[locale.languageCode]['writeMessage'];
  }

  String get subscribe {
    return _localizedValues[locale.languageCode]['subscribe'];
  }

  String get starterPack {
    return _localizedValues[locale.languageCode]['starterPack'];
  }

  String get months {
    return _localizedValues[locale.languageCode]['months'];
  }

  String get whyUpgrade {
    return _localizedValues[locale.languageCode]['whyUpgrade'];
  }

  String get getAccess {
    return _localizedValues[locale.languageCode]['getAccess'];
  }

  String get enableDownload {
    return _localizedValues[locale.languageCode]['enableDownload'];
  }

  String get watchPremium {
    return _localizedValues[locale.languageCode]['watchPremium'];
  }

  String get hola {
    return _localizedValues[locale.languageCode]['hola'];
  }

  String get subscribedNow {
    return _localizedValues[locale.languageCode]['subscribedNow'];
  }

  String get findYourShow {
    return _localizedValues[locale.languageCode]['findYourShow'];
  }

  String get watchShow {
    return _localizedValues[locale.languageCode]['watchShow'];
  }

  String get oops {
    return _localizedValues[locale.languageCode]['oops'];
  }

  String get paymentFailed {
    return _localizedValues[locale.languageCode]['paymentFailed'];
  }

  String get somethingWentWrong {
    return _localizedValues[locale.languageCode]['somethingWentWrong'];
  }

  String get pleaseTryAgain {
    return _localizedValues[locale.languageCode]['pleaseTryAgain'];
  }

  String get loggingOut {
    return _localizedValues[locale.languageCode]['loggingOut'];
  }

  String get areYouSure {
    return _localizedValues[locale.languageCode]['areYouSure'];
  }

  String get yes {
    return _localizedValues[locale.languageCode]['yes'];
  }

  String get no {
    return _localizedValues[locale.languageCode]['no'];
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['en', 'ar', 'fr', 'in', 'pt', 'es'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
